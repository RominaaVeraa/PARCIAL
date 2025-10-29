USE rmv_parcial_plp3;

-- HTML
INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué etiqueta define un título principal?', 'HTML','facil');
SET @ph1=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@ph1,'<h1>',1),(NULL,@ph1,'<title>',0),(NULL,@ph1,'<header>',0),(NULL,@ph1,'<head>',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@ph1 AND rmv_es_correcta=1) WHERE id=@ph1;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué atributo abre el enlace en nueva pestaña?', 'HTML','facil');
SET @ph2=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@ph2,'target=\"_blank\"',1),(NULL,@ph2,'rel=\"new\"',0),(NULL,@ph2,'window=\"new\"',0),(NULL,@ph2,'tab=\"1\"',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@ph2 AND rmv_es_correcta=1) WHERE id=@ph2;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué etiqueta agrupa contenido autónomo?', 'HTML','media');
SET @ph3=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@ph3,'<article>',1),(NULL,@ph3,'<div>',0),(NULL,@ph3,'<section>',0),(NULL,@ph3,'<span>',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@ph3 AND rmv_es_correcta=1) WHERE id=@ph3;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué atributo de <img> carga diferido?', 'HTML','media');
SET @ph4=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@ph4,'loading=\"lazy\"',1),(NULL,@ph4,'defer',0),(NULL,@ph4,'async',0),(NULL,@ph4,'delay',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@ph4 AND rmv_es_correcta=1) WHERE id=@ph4;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué etiqueta mejora el SEO del autor?', 'HTML','dificil');
SET @ph5=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@ph5,'<address>',1),(NULL,@ph5,'<author>',0),(NULL,@ph5,'<meta name=\"author\">',0),(NULL,@ph5,'<cite>',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@ph5 AND rmv_es_correcta=1) WHERE id=@ph5;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué etiqueta define contenido relacionado pero no principal?', 'HTML','dificil');
SET @ph6=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@ph6,'<aside>',1),(NULL,@ph6,'<details>',0),(NULL,@ph6,'<summary>',0),(NULL,@ph6,'<figure>',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@ph6 AND rmv_es_correcta=1) WHERE id=@ph6;

-- CSS
INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué propiedad establece el tamaño de fuente?', 'CSS','facil');
SET @pc1=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pc1,'font-size',1),(NULL,@pc1,'text-size',0),(NULL,@pc1,'size',0),(NULL,@pc1,'type-size',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pc1 AND rmv_es_correcta=1) WHERE id=@pc1;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué propiedad agrega espacio interno al contenedor?', 'CSS','facil');
SET @pc2=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pc2,'padding',1),(NULL,@pc2,'margin',0),(NULL,@pc2,'gap',0),(NULL,@pc2,'space',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pc2 AND rmv_es_correcta=1) WHERE id=@pc2;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué valor crea un contenedor grid?', 'CSS','media');
SET @pc3=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pc3,'display:grid',1),(NULL,@pc3,'grid:true',0),(NULL,@pc3,'position:grid',0),(NULL,@pc3,'flex:grid',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pc3 AND rmv_es_correcta=1) WHERE id=@pc3;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué propiedad controla la altura de línea?', 'CSS','media');
SET @pc4=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pc4,'line-height',1),(NULL,@pc4,'text-height',0),(NULL,@pc4,'height-line',0),(NULL,@pc4,'leading',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pc4 AND rmv_es_correcta=1) WHERE id=@pc4;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué atajo define margen en el orden top right bottom left?', 'CSS','dificil');
SET @pc5=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pc5,'margin: t r b l',1),(NULL,@pc5,'margin: l r t b',0),(NULL,@pc5,'margins: trbl',0),(NULL,@pc5,'margin-quad',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pc5 AND rmv_es_correcta=1) WHERE id=@pc5;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué propiedad controla el apilado de elementos posicionados?', 'CSS','dificil');
SET @pc6=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pc6,'z-index',1),(NULL,@pc6,'stack-index',0),(NULL,@pc6,'order',0),(NULL,@pc6,'layer',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pc6 AND rmv_es_correcta=1) WHERE id=@pc6;

-- JS
INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué método selecciona el primer elemento que coincide con un selector CSS?', 'JS','facil');
SET @pj1=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pj1,'document.querySelector()',1),(NULL,@pj1,'document.get()',0),(NULL,@pj1,'document.find()',0),(NULL,@pj1,'window.select()',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pj1 AND rmv_es_correcta=1) WHERE id=@pj1;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué operador comprueba igualdad estricta?', 'JS','facil');
SET @pj2=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pj2,'===',1),(NULL,@pj2,'==',0),(NULL,@pj2,'=',0),(NULL,@pj2,'!==',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pj2 AND rmv_es_correcta=1) WHERE id=@pj2;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué método crea un nuevo arreglo con los resultados de una función?', 'JS','media');
SET @pj3=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pj3,'map()',1),(NULL,@pj3,'forEach()',0),(NULL,@pj3,'reduce()',0),(NULL,@pj3,'filter()',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pj3 AND rmv_es_correcta=1) WHERE id=@pj3;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué palabra clave detiene la propagación de errores asíncronos si no se captura?', 'JS','media');
SET @pj4=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pj4,'try/catch',1),(NULL,@pj4,'async',0),(NULL,@pj4,'await',0),(NULL,@pj4,'throw',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pj4 AND rmv_es_correcta=1) WHERE id=@pj4;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué estructura evita colisiones de nombres en módulos?', 'JS','dificil');
SET @pj5=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pj5,'IIFE o módulos ES6',1),(NULL,@pj5,'var global',0),(NULL,@pj5,'with()',0),(NULL,@pj5,'eval()',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pj5 AND rmv_es_correcta=1) WHERE id=@pj5;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué método programa una función al final de la cola de tareas?', 'JS','dificil');
SET @pj6=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pj6,'setTimeout(fn,0)',1),(NULL,@pj6,'requestAnimationFrame',0),(NULL,@pj6,'queueMicrotask',0),(NULL,@pj6,'setImmediate',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pj6 AND rmv_es_correcta=1) WHERE id=@pj6;

-- PHP
INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué función imprime información legible de una variable?', 'PHP','facil');
SET @pp1=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pp1,'print_r()',1),(NULL,@pp1,'var()',0),(NULL,@pp1,'echo_json()',0),(NULL,@pp1,'printf_json()',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pp1 AND rmv_es_correcta=1) WHERE id=@pp1;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué superglobal guarda variables de sesión?', 'PHP','facil');
SET @pp2=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pp2,'$_SESSION',1),(NULL,@pp2,'$_COOKIE',0),(NULL,@pp2,'$_FILES',0),(NULL,@pp2,'$_ENV',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pp2 AND rmv_es_correcta=1) WHERE id=@pp2;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué opción de PDO activa excepciones?', 'PHP','media');
SET @pp3=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pp3,'PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION',1),(NULL,@pp3,'PDO::ATTR_THROW',0),(NULL,@pp3,'ERRMODE_EXCEPTION()',0),(NULL,@pp3,'PDO::EXC',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pp3 AND rmv_es_correcta=1) WHERE id=@pp3;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué función filtra correo válido desde POST?', 'PHP','media');
SET @pp4=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pp4,'filter_input(INPUT_POST, \"email\", FILTER_VALIDATE_EMAIL)',1),(NULL,@pp4,'htmlentities($_POST[\"email\"])',0),(NULL,@pp4,'strip_tags($_POST[\"email\"])',0),(NULL,@pp4,'json_encode($_POST[\"email\"])',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pp4 AND rmv_es_correcta=1) WHERE id=@pp4;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Qué función genera un hash seguro para contraseñas?', 'PHP','dificil');
SET @pp5=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pp5,'password_hash()',1),(NULL,@pp5,'md5()',0),(NULL,@pp5,'sha1()',0),(NULL,@pp5,'crypt_simple()',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pp5 AND rmv_es_correcta=1) WHERE id=@pp5;

INSERT INTO rmv_preguntas (rmv_texto,rmv_categoria,rmv_dificultad) VALUES ('¿Cómo evitás inyección SQL con valores variables?', 'PHP','dificil');
SET @pp6=LAST_INSERT_ID();
INSERT INTO rmv_opciones VALUES (NULL,@pp6,'Consultas preparadas (prepare/bind/execute)',1),(NULL,@pp6,'Concatenar strings',0),(NULL,@pp6,'str_replace en comillas',0),(NULL,@pp6,'addslashes()',0);
UPDATE rmv_preguntas SET rmv_correcta_id=(SELECT id FROM rmv_opciones WHERE rmv_pregunta_id=@pp6 AND rmv_es_correcta=1) WHERE id=@pp6;
