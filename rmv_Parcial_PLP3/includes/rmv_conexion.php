<?php

function rmv_get_pdo(){
  $host = '127.0.0.1';
  $db   = 'rmv_parcial_plp3';
  $user = 'root';
  $pass = '';
  $port = 3308;

  $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
  try{
    $pdo = new PDO($dsn, $user, $pass, [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
    return $pdo;
  }catch(PDOException $e){
    http_response_code(500);
    die(json_encode(['error'=>'Conexión fallida','detalle'=>$e->getMessage()]));
  }
}