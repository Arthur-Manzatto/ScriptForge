<?php

include "mysql_connect.php";
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["error" => "Method not allowed"]);
    exit;
}

if (!isset($_POST['selected_distro']) || !isset($_POST['selected_apps'])) {
    http_response_code(400);
    echo json_encode(["error" => "Missing selected_distro or selected_apps"]);
    exit;
}

$selected_distro = intval($_POST['selected_distro']);
$selected_apps_raw = $_POST['selected_apps'];

if (!is_array($selected_apps_raw) || count($selected_apps_raw) === 0) {
    http_response_code(400);
    echo json_encode(["error" => "No apps selected"]);
    exit;
}

$selected_apps = [];
foreach ($selected_apps_raw as $slug) {
    if (preg_match('/^[a-z0-9-]+$/', $slug)) {
        $selected_apps[] = $slug;
    }
}

$selected_apps = array_values(array_unique($selected_apps));

if (count($selected_apps) === 0) {
    http_response_code(400);
    echo json_encode(["error" => "Invalid app slugs"]);
    exit;
}

$distro_stmt = $conn->prepare("SELECT id_distro, name_distro, install_method
                               FROM distros
                               WHERE id_distro = ? AND active_distro = 1");

$distro_stmt->bind_param("i", $selected_distro);
$distro_stmt->execute();
$distro_result = $distro_stmt->get_result();
$distro = $distro_result->fetch_assoc();

if (!$distro) {
    http_response_code(404);
    echo json_encode(["error" => "Distro not found"]);
    exit;
}

$placeholders = implode(',', array_fill(0, count($selected_apps), '?'));
$types = 'i' . str_repeat('s', count($selected_apps));

$apps_stmt = $conn->prepare("SELECT a.slug_app, a.name_app, p.name_pack
                             FROM packages p
                             JOIN apps a ON a.id_app = p.fk_id_app
                             WHERE p.fk_id_distro = ?
                               AND p.active_pack = 1
                               AND a.active_app = 1
                               AND a.slug_app IN ($placeholders)
                             ORDER BY a.name_app");

function bind_dynamic_params($stmt, $types, $params)
{
    $bind_names = [];
    $bind_names[] = $types;
    for ($i = 0; $i < count($params); $i++) {
        $bind_name = 'bind' . $i;
        $$bind_name = $params[$i];
        $bind_names[] = &$$bind_name;
    }
    call_user_func_array([$stmt, 'bind_param'], $bind_names);
}

$bind_values = array_merge([$selected_distro], $selected_apps);
bind_dynamic_params($apps_stmt, $types, $bind_values);

$apps_stmt->execute();
$apps_result = $apps_stmt->get_result();

$packages = [];
$apps = [];

while ($row = $apps_result->fetch_assoc()) {
    $apps[] = $row;
    if (!in_array($row['name_pack'], $packages, true)) {
        $packages[] = $row['name_pack'];
    }
}

if (count($packages) === 0) {
    http_response_code(404);
    echo json_encode(["error" => "No packages found for selected apps and distro"]);
    exit;
}

$script_lines = [
    "#!/usr/bin/env bash",
    "set -e",
    "",
    "# Distro: " . $distro['name_distro'],
    $distro['install_method'] . " " . implode(' ', $packages)
];

echo json_encode([
    "distro" => $distro,
    "apps" => $apps,
    "packages" => $packages,
    "script" => implode("\n", $script_lines)
]);
