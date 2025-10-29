<?php
header('Content-Type: application/json');
require_once __DIR__.'/../includes/rmv_conexion.php';
$pdo = rmv_get_pdo();

$cat = $_GET['cat'] ?? 'MIX';
$dif = $_GET['dif'] ?? 'facil';
$n   = max(1, min(20, (int)($_GET['n'] ?? 10)));

$params = [];
$where  = [];

if ($cat !== 'MIX') { $where[] = 'rmv_categoria = ?';   $params[] = $cat; }
if ($dif)           { $where[] = 'rmv_dificultad = ?'; $params[] = $dif; }

$w = $where ? ('WHERE '.implode(' AND ', $where)) : '';

$sqlP = "SELECT id, rmv_texto, rmv_correcta_id
         FROM rmv_preguntas
         $w
         ORDER BY RAND()
         LIMIT $n";
$pregs = $pdo->prepare($sqlP);
$pregs->execute($params);
$pregs = $pregs->fetchAll();

if (!$pregs) { echo json_encode([]); exit; }

$ids = array_column($pregs,'id');
$in  = implode(',', array_fill(0, count($ids), '?'));

$sqlO = "SELECT id, rmv_pregunta_id, rmv_texto
         FROM rmv_opciones
         WHERE rmv_pregunta_id IN ($in)
         ORDER BY rmv_pregunta_id, id";
$opt  = $pdo->prepare($sqlO);
$opt->execute($ids);
$opt  = $opt->fetchAll();

$mapOpc = [];
foreach($opt as $o){
  $mapOpc[$o['rmv_pregunta_id']][] = ['id'=>(int)$o['id'], 'texto'=>$o['RMV_texto']];
}
$out = [];
foreach($pregs as $p){
  $out[] = [
    'id'          => (int)$p['id'],
    'texto'       => $p['rmv_texto'],
    'correcta_id' => (int)$p['rmv_correcta_id'],
    'opciones'    => $mapOpc[$p['id']] ?? []
  ];
}
echo json_encode($out, JSON_UNESCAPED_UNICODE);