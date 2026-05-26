<?php

include "mysql_connect.php";

if (!isset($_GET['selected_distro']) ||
    !isset($_GET['selected_apps'])) {

    die("Missing parameters");
}

$selected_distro = intval($_GET['selected_distro']);
$selected_apps = $_GET['selected_apps'];


/*
|--------------------------------------------------------------------------
| GET DISTRO
|--------------------------------------------------------------------------
*/

$distro_stmt = $conn->prepare("
    SELECT 
        id_distro,
        name_distro,
        install_method
    FROM distros
    WHERE id_distro = ?
");

$distro_stmt->bind_param("i", $selected_distro);
$distro_stmt->execute();

$distro = $distro_stmt->get_result()->fetch_assoc();

if (!$distro) {
    die("Invalid distro");
}

/*
|--------------------------------------------------------------------------
| GET PACKAGES
|--------------------------------------------------------------------------
*/

$placeholders = implode(',', array_fill(0, count($selected_apps), '?'));

$types = 'i' . str_repeat('s', count($selected_apps));

$query = "
    SELECT p.name_pack
    FROM packages p
    JOIN apps a ON a.id_app = p.fk_id_app
    WHERE p.fk_id_distro = ?
    AND a.slug_app IN ($placeholders)
";

$stmt = $conn->prepare($query);

/*
|--------------------------------------------------------------------------
| DYNAMIC BIND
|--------------------------------------------------------------------------
*/

$params = array_merge([$selected_distro], $selected_apps);

$bind_names = [];
$bind_names[] = $types;

for ($i = 0; $i < count($params); $i++) {

    $bind_name = 'bind' . $i;

    $$bind_name = $params[$i];

    $bind_names[] = &$$bind_name;
}

call_user_func_array([$stmt, 'bind_param'], $bind_names);

$stmt->execute();

$result = $stmt->get_result();

$packages = [];

while ($row = $result->fetch_assoc()) {

    if (!in_array($row['name_pack'], $packages)) {

        $packages[] = $row['name_pack'];
    }
}

if (count($packages) === 0) {
    die("No packages found");
}

/*
|--------------------------------------------------------------------------
| GENERATE INSTALL SCRIPT
|--------------------------------------------------------------------------
*/

$script_lines = [
    "#!/usr/bin/env bash",
    "",
    "set -e",
    "",
    "echo 'Installing applications...'",
    "",
    $distro['install_method'] . " " . implode(' ', $packages),
    "",
    "echo 'Installation completed!'"
];

$temp_dir = sys_get_temp_dir() . '/scriptforge_' . uniqid();

mkdir($temp_dir);

file_put_contents(
    $temp_dir . '/install.sh',
    implode("\n", $script_lines)
);

$run_script = '#!/usr/bin/env bash

clear

echo "Starting ScriptForge..."

chmod +x install.sh

./install.sh
';

file_put_contents($temp_dir . '/run.sh', $run_script);

$desktop = '[Desktop Entry]
Version=1.0
Name=ScriptForge
Exec=bash -c "cd $(dirname %k) && ./run.sh"
Icon=utilities-terminal
Terminal=true
Type=Application
';

file_put_contents(
    $temp_dir . '/scriptforge.desktop',
    $desktop
);

$zip = new ZipArchive();

$zip_name = $temp_dir . '.zip';

if ($zip->open($zip_name, ZipArchive::CREATE) === TRUE) {

    $files = scandir($temp_dir);

    foreach ($files as $file) {

        if ($file !== '.' && $file !== '..') {

            $zip->addFile(
                $temp_dir . '/' . $file,
                $file
            );
        }
    }

    $zip->close();
}

if (ob_get_length()) {
    ob_end_clean();
}

header('Content-Type: application/zip');
header('Content-Disposition: attachment; filename="ScriptForge.zip"');
header('Content-Length: ' . filesize($zip_name));

readfile($zip_name);

exit;