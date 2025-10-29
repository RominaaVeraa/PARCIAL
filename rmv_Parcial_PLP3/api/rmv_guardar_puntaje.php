<?php
header('Content-Type: application/json');
require_once __DIR__.'/../includes/rmv_conexion.php';
$pdo = RMV_get_pdo();

if($_SERVER['REQUEST_METHOD']==='POST'){
  $nombre = trim($_POST['nombre'] ?? 'Anónimo');
  $puntaje= (int)($_POST['puntaje'] ?? 0);
  $dur    = (int)($_POST['duracion'] ?? 0);
  $cat    = $_POST['categoria'] ?? 'MIX';
  $dif    = $_POST['dificultad'] ?? 'facil';

  $sql="INSERT INTO rmv_partidas (rmv_nombre, rmv_puntaje, rmv_duracion_seg, rmv_categoria, rmv_dificultad)
        VALUES (?,?,?,?,?)";
  $stmt=$pdo->prepare($sql);
  $stmt->execute([$nombre,$puntaje,$dur,$cat,$dif]);
}

$top=$pdo->query("SELECT rmv_nombre as nombre, rmv_puntaje as puntaje, rmv_duracion_seg as duracion_seg, rmv_creado_en as creado_en
                  FROM rmv_partidas
                  ORDER BY rmv_puntaje DESC, rmv_duracion_seg ASC
                  LIMIT 10")->fetchAll();

echo json_encode(['ok'=>true,'top'=>$top], JSON_UNESCAPED_UNICODE);