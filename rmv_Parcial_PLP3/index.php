<?php  ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>RMV QuizMaster</title>
  <link rel="stylesheet" href="css/rmv_estilos.css" />
</head>
<body class="rmv-body">
  <header class="rmv-header">
    <h1 class="rmv-title">RMV QuizMaster</h1>
    
    <button class="rmv-hamburger" id="rmv_hamburger" aria-label="Menú" aria-expanded="false">
      <span></span>
      <span></span>
      <span></span>
    </button>

    <nav class="rmv-nav" id="rmv_nav">
      <button class="rmv-btn rmv-link" data-go="inicio">Inicio</button>
      <button class="rmv-btn rmv-link" data-go="juego">Juego</button>
      <button class="rmv-btn rmv-link" data-go="resultados">Resultados</button>
    </nav>
  </header>

  <div class="rmv-overlay" id="rmv_overlay"></div>

  <main class="rmv-main">

    <section id="rmv_inicio" class="rmv-section rmv-visible" aria-labelledby="rmv_inicio_t">
      <h2 id="rmv_inicio_t">Configurar partida</h2>
      <div class="rmv-card">
        <label class="rmv-field">Categoría
          <select id="rmv_categoria">
            <option value="HTML">HTML</option>
            <option value="CSS">CSS</option>
            <option value="JS">JavaScript</option>
            <option value="PHP">PHP</option>
            <option value="MIX">Mixto</option>
          </select>
        </label>
        <label class="rmv-field">Dificultad
          <select id="rmv_dificultad">
            <option value="facil">Fácil</option>
            <option value="media">Media</option>
            <option value="dificil">Difícil</option>
          </select>
        </label>
        <button id="rmv_btn_empezar" class="rmv-btn rmv-primary">Empezar</button>
      </div>
    </section>

    <section id="rmv_juego" class="rmv-section" aria-labelledby="rmv_juego_t">
      <h2 id="rmv_juego_t">Responder preguntas</h2>
      <div class="rmv-hud">
        <div>Pregunta <span id="rmv_idx">1</span>/<span id="rmv_total">10</span></div>
        <div>Tiempo: <span id="rmv_tiempo">00:00</span></div>
        <div>Puntaje: <span id="rmv_puntaje">0</span></div>
      </div>

      <div id="rmv_panel" class="rmv-card">
        <h3 id="rmv_pregunta">Cargando...</h3>
        <ul id="rmv_opciones" class="rmv-opciones" role="list" aria-live="polite"></ul>
        <div class="rmv-actions">
          <button id="rmv_btn_siguiente" class="rmv-btn" disabled>Siguiente</button>
        </div>
        <div id="rmv_feedback" class="rmv-feedback" aria-live="polite"></div>
      </div>
    </section>

    <section id="rmv_resultados" class="rmv-section" aria-labelledby="rmv_resultados_t">
      <h2 id="rmv_resultados_t">Resultados</h2>
      <div class="rmv-card">
        <p>Tu puntaje: <strong id="rmv_puntaje_final">0</strong></p>
        <p>Duración: <strong id="rmv_duracion_final">00:00</strong></p>
        <form id="rmv_form_score" class="rmv-form">
          <input type="text" id="rmv_nombre" placeholder="Tu nombre" maxlength="30" required />
          <button class="rmv-btn rmv-primary" type="submit">Guardar en ranking</button>
        </form>
        <button id="rmv_btn_nuevo" class="rmv-btn" type="button">Nuevo juego</button>
      </div>

      <div class="rmv-card">
        <h3>Top 10</h3>
        <table class="rmv-table" id="rmv_tabla_top">
          <thead><tr><th>#</th><th>Nombre</th><th>Puntaje</th><th>Tiempo</th><th>Fecha</th></tr></thead>
          <tbody></tbody>
        </table>
      </div>
    </section>
  </main>

  <footer class="rmv-footer">RMV QuizMaster — PLP3 · 2025</footer>
  <script src="js/rmv_script.js"></script>
</body>
</html>