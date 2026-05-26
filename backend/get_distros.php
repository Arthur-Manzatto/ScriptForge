<?php

include "mysql_connect.php";
header('Content-Type: application/json');

/*
|--------------------------------------------------------------------------
| DISTRO DETECTION
|--------------------------------------------------------------------------
*/

function get_linux_distro_family()
{
    if (PHP_OS_FAMILY !== "Linux") {
        return false;
    }

    if (!file_exists('/etc/os-release')) {
        return false;
    }

    $os_info = parse_ini_file('/etc/os-release');

    $id = strtolower($os_info['ID'] ?? '');
    $id_like = strtolower($os_info['ID_LIKE'] ?? '');

    $full_info = $id . ' ' . $id_like;

    if (
        str_contains($full_info, 'ubuntu') ||
        str_contains($full_info, 'debian')
    ) {
        return 'ubuntu';
    }

    if (
        str_contains($full_info, 'fedora') ||
        str_contains($full_info, 'rhel') ||
        str_contains($full_info, 'centos')
    ) {
        return 'fedora';
    }

    if (str_contains($full_info, 'arch')) {
        return 'arch';
    }

    return false;
}

switch ($_SERVER['REQUEST_METHOD']){
        case "GET":

            $query = $conn->query("
                SELECT 
                    id_distro,
                    name_distro,
                    slug_distro,
                    active_distro
                FROM distros
                WHERE active_distro = 1
            ");

            $data = [];

            while($distros = mysqli_fetch_assoc($query)){
                $data[] = $distros; 
            }

            $detected_distro = get_linux_distro_family();

            $warning = null;

            if ($detected_distro === false) {

                $warning = [
                    "type" => "error",
                    "message" => "Unsupported Linux distro or non-Linux operating system detected."
                ];
            }

            echo json_encode([
                "distros" => $data,
                "detected_distro" => $detected_distro,
                "warning" => $warning
            ]);

        break;
        
        case "POST":


            if (!isset($_POST['selected_distro'])) {
                echo json_encode(["error" => "No distro selected"]);
                exit;
            }

            // garante que é número (segurança básica)
            $selected_distro = intval($_POST['selected_distro']);

            // prepared statement (evita SQL injection)
            $stmt = $conn->prepare("
                SELECT 
                    distros.id_distro,
                    distros.name_distro,
                    packages.id_pack,
                    packages.name_pack
                FROM distros 
                JOIN packages ON distros.id_distro = packages.fk_id_distro
                WHERE distros.id_distro = ?
                AND distros.active_distro = 1 
                AND packages.active_pack = 1
            ");

            $stmt->bind_param("i", $selected_distro);
            $stmt->execute();

            $result = $stmt->get_result();

            $data = [];

            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }

            echo json_encode($data);

        break;

    }

