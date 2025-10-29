let rmv_state = {
  pregs: [], idx: 0, score: 0, seg: 0, timer: null,
  cat: 'MIX', dif: 'facil', finished: false
};
const $ = s => document.querySelector(s);

function rmv_go(sec){
  document.querySelectorAll('.rmv-section')
    .forEach(x=>x.classList.toggle('rmv-visible', x.id==='rmv_'+sec));
  
  rmv_closeMenu();
}

function rmv_fmt(s){
  const m = String(Math.floor(s/60)).padStart(2,'0');
  const ss= String(s%60).padStart(2,'0');
  return m+':'+ss;
}

function rmv_tick(){
  rmv_state.seg++;
  $('#rmv_tiempo').textContent = rmv_fmt(rmv_state.seg);
}

function rmv_toggleMenu(){
  const nav = $('#rmv_nav');
  const hamburger = $('#rmv_hamburger');
  const overlay = $('#rmv_overlay');
  
  const isActive = nav.classList.toggle('active');
  hamburger.classList.toggle('active', isActive);
  overlay.classList.toggle('active', isActive);
  hamburger.setAttribute('aria-expanded', isActive);
  
  document.body.style.overflow = isActive ? 'hidden' : '';
}

function rmv_closeMenu(){
  const nav = $('#rmv_nav');
  const hamburger = $('#rmv_hamburger');
  const overlay = $('#rmv_overlay');
  
  nav.classList.remove('active');
  hamburger.classList.remove('active');
  overlay.classList.remove('active');
  hamburger.setAttribute('aria-expanded', 'false');
  document.body.style.overflow = '';
}

function rmv_bind(){

  document.querySelectorAll('.rmv-link').forEach(b=>{
    b.onclick = () => rmv_go(b.dataset.go);
  });
  
  $('#rmv_hamburger').onclick = rmv_toggleMenu;
  $('#rmv_overlay').onclick = rmv_closeMenu;
  
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') rmv_closeMenu();
  });
  
  $('#rmv_btn_empezar').onclick  = rmv_empezar;
  $('#rmv_btn_siguiente').onclick= rmv_siguiente;
  $('#rmv_form_score').onsubmit  = rmv_guardarPuntaje;
  $('#rmv_btn_nuevo').onclick    = rmv_empezar;
}

function rmv_reset(){
  rmv_state.idx = 0;
  rmv_state.score = 0;
  rmv_state.seg   = 0;
  rmv_state.finished = false;
  $('#rmv_puntaje').textContent = 0;
  $('#rmv_idx').textContent = 1;
  $('#rmv_total').textContent = '10';
  $('#rmv_feedback').textContent = '';
  $('#rmv_btn_siguiente').disabled = true;
  if (rmv_state.timer) clearInterval(rmv_state.timer);
  rmv_state.timer = setInterval(rmv_tick, 1000);
  $('#rmv_tiempo').textContent = '00:00';
}

async function rmv_empezar(){
  rmv_state.cat = $('#rmv_categoria').value;
  rmv_state.dif = $('#rmv_dificultad').value;

  const btn = $('#rmv_btn_empezar');
  btn.classList.add('loading');
  btn.disabled = true;

  rmv_reset();

  try {
    const url = `api/RMV_get_preguntas.php?cat=${encodeURIComponent(rmv_state.cat)}&dif=${encodeURIComponent(rmv_state.dif)}&n=10`;
    const res = await fetch(url);
    rmv_state.pregs = await res.json();

    if(!Array.isArray(rmv_state.pregs) || rmv_state.pregs.length===0){
      alert('No hay preguntas disponibles para esa categoría/dificultad.');
      return;
    }

    rmv_go('juego');
    rmv_pintar();
  } catch(err) {
    alert('Error al cargar preguntas: ' + err.message);
  } finally {
    btn.classList.remove('loading');
    btn.disabled = false;
  }
}

function rmv_pintar(){
  const p = rmv_state.pregs[rmv_state.idx];
  $('#rmv_pregunta').textContent = p.texto;
  const ul = $('#rmv_opciones');
  ul.innerHTML = '';
  $('#rmv_idx').textContent = rmv_state.idx + 1;
  $('#rmv_btn_siguiente').disabled = true;
  $('#rmv_feedback').textContent = '';

  p.opciones.forEach(o=>{
    const li = document.createElement('li');
    li.textContent = o.texto;
    li.dataset.rmvId = o.id;
    li.tabIndex = 0;
    li.onclick = () => rmv_check(o.id, p.correcta_id);
    li.onkeypress = e => { if(e.key==='Enter') li.click(); };
    ul.appendChild(li);
  });
}

function rmv_check(selId, okId){
  const lis = [...document.querySelectorAll('#rmv_opciones li')];
  lis.forEach(x=>x.onclick=null);

  const clicked = lis.find(x => Number(x.dataset.rmvId) === selId);
  if (clicked) clicked.classList.add(selId===okId ? 'rmv-ok' : 'rmv-bad');

  const liOk = lis.find(x => Number(x.dataset.rmvId) === okId);
  if (liOk) liOk.classList.add('rmv-ok');

  if (selId === okId) {
    rmv_state.score += 10;
    $('#rmv_feedback').textContent = '¡Correcto! +10';
  } else {
    $('#rmv_feedback').textContent = 'Incorrecto';
  }
  $('#rmv_puntaje').textContent = rmv_state.score;
  $('#rmv_btn_siguiente').disabled = false;
}

function rmv_siguiente(){
  if (rmv_state.idx < rmv_state.pregs.length - 1) {
    rmv_state.idx++;
    rmv_pintar();
  } else {
    rmv_fin();
  }
}

function rmv_fin(){
  clearInterval(rmv_state.timer);
  rmv_state.finished = true;
  $('#rmv_puntaje_final').textContent   = rmv_state.score;
  $('#rmv_duracion_final').textContent  = rmv_fmt(rmv_state.seg);
  rmv_go('resultados');
  rmv_cargarTop();
}

async function rmv_guardarPuntaje(e){
  e.preventDefault();
  const nombre = $('#rmv_nombre').value.trim().slice(0,30);
  if(!nombre) return;

  const btn = e.submitter;
  btn.classList.add('loading');
  btn.disabled = true;

  try {
    const data = new URLSearchParams({
      nombre,
      puntaje: rmv_state.score,
      duracion: rmv_state.seg,
      categoria: rmv_state.cat,
      dificultad: rmv_state.dif
    });

    const res = await fetch('api/RMV_guardar_puntaje.php', {
      method:'POST',
      headers:{'Content-Type':'application/x-www-form-urlencoded'},
      body:data
    });
    const r = await res.json();
    rmv_pintarTop(r.top||[]);
    $('#rmv_nombre').value = '';
  } catch(err) {
    alert('Error al guardar: ' + err.message);
  } finally {
    btn.classList.remove('loading');
    btn.disabled = false;
  }
}

async function rmv_cargarTop(){
  try {
    const res = await fetch('api/RMV_guardar_puntaje.php');
    const r = await res.json();
    rmv_pintarTop(r.top||[]);
  } catch(err) {
    console.error('Error al cargar ranking:', err);
  }
}

function rmv_pintarTop(arr){
  const tb = $('#rmv_tabla_top tbody'); 
  tb.innerHTML = '';
  
  if(arr.length === 0) {
    tb.innerHTML = '<tr><td colspan="5" style="text-align:center; padding:20px; color:var(--rmv-sub)">No hay registros aún</td></tr>';
    return;
  }
  
  arr.forEach((x,i)=>{
    const tr = document.createElement('tr');
    tr.innerHTML = `<td>${i+1}</td><td>${x.nombre}</td><td>${x.puntaje}</td><td>${rmv_fmt(x.duracion_seg)}</td><td>${x.creado_en}</td>`;
    tb.appendChild(tr);
  });
}

document.addEventListener('DOMContentLoaded', rmv_bind);