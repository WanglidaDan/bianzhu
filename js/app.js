const songs = [
  {
    id: "pink-moon",
    title: "Pink Moon",
    lang: "en",
    artist: "Nick Drake",
    album: "Pink Moon",
    year: "1972",
    duration: 126,
    dek: "两个夜晚，一把吉他。",
    paragraphs: [
      "1971 年秋，Nick Drake 在伦敦只录了两个夜晚。他把能拿掉的都拿掉了，最后剩下吉他和他的声音。《Pink Moon》短，也几乎不肯被解释。",
      "月亮在这里不是情歌的布景，更像一盏亮着、却不打算靠近的灯。这张专辑当时没有被多少人接住。几十年后，人们反而学会把音量调低，在这点光里坐一会儿。"
    ]
  },
  {
    id: "landslide",
    title: "Landslide",
    lang: "en",
    artist: "Fleetwood Mac",
    album: "Fleetwood Mac",
    year: "1975",
    duration: 199,
    dek: "山还在，路要自己选。",
    paragraphs: [
      "歌是在科罗拉多的山里写成的。Stevie Nicks 看着那些山，问自己还要不要继续走音乐这条路。那时后头还没有那么大的名声，选择本身更重。",
      "1975 年，它被收进专辑《Fleetwood Mac》。吉他一直很轻，像坐在旁边，并不催促。歌里没有给出方向，只留下时间：人还没想清楚自己是谁，日子已经在往前走。",
      "很多人会在自己的路口听见它。旋律没有变，听的人却会忽然算出自己的年纪。"
    ]
  },
  {
    id: "by-your-side",
    title: "By Your Side",
    lang: "en",
    artist: "Sade",
    album: "Lovers Rock",
    year: "2000",
    duration: 274,
    dek: "不解释爱，只说明在场。",
    paragraphs: [
      "Sade 几乎不抬高声音。《By Your Side》收在 2000 年的《Lovers Rock》里，像一句放在桌角的话：不必一个人留在这儿。",
      "贝斯走得很慢，人声靠得很近。它不去定义爱，只做一件更难一直做到的事——留在原地。整支乐队保持着惯有的克制，让安静承担大部分工作。",
      "若要认真听，最好别同时做太多别的。低音会把房间拉慢，慢到你得决定，要不要真的陪着谁。"
    ]
  },
  {
    id: "hill",
    title: "山丘",
    lang: "zh",
    artist: "李宗盛",
    album: "",
    year: "2013",
    duration: 302,
    dek: "走到一半，才回头看。",
    paragraphs: [
      "李宗盛唱《山丘》时，声音里已经有走路走出来的砂。这首歌不急着安慰人。它只是把一个走到半途、终于愿意回头的下午摊开。",
      "吉他像步伐，一句一句，不赶。有些话年轻时没说出口，后来也未必补得上。他仍把那段上坡再走了一遍，走得很慢，好让听的人把自己的路也放进来。",
      "适合开着，却不必跟着唱。像有人在对面坐下，并不要求你马上回答。"
    ]
  },
  {
    id: "holocene",
    title: "Holocene",
    lang: "en",
    artist: "Bon Iver",
    album: "Bon Iver, Bon Iver",
    year: "2011",
    duration: 336,
    dek: "人很小，记忆却很具体。",
    paragraphs: [
      "Bon Iver 用我们所在的地质年代给这首歌命名。人被放进一段长得几乎可以忽略个人的时间里。可歌里记得住的，反而是某处的光，某一次没有说出口的离开。",
      "Justin Vernon 把声音叠得很薄，像冷天停在湖面上的雾。很大的尺度，最后只托住一件小事：你确实在那里站过。",
      "标题来自地质学，歌本身却几乎不谈知识。它谈的是，在很长的时间旁边，一个普通人的下午仍然算数。"
    ]
  },
  {
    id: "cranes",
    title: "Cranes in the Sky",
    lang: "en",
    artist: "Solange",
    album: "A Seat at the Table",
    year: "2016",
    duration: 250,
    dek: "用忙碌，躲开一种情绪。",
    paragraphs: [
      "《Cranes in the Sky》在 Solange 心里放了多年，才落进 2016 年的《A Seat at the Table》。旋律慢，也不肯随便给一个松开的副歌。",
      "歌名里的 crane，可以听成天上的鸟，也可以听成城市里一直升着的吊臂。她写的是一种停不下来的忙：用工作，用远行，用不断地移动，绕开一个还没准备好面对的心情。",
      "听完未必觉得被安慰。它只是把那条绕开的路线画出来，让人看见自己也在上面。"
    ]
  },
  {
    id: "mine",
    title: "My Love Mine All Mine",
    lang: "en",
    artist: "Mitski",
    album: "The Land Is Inhospitable and So Are We",
    year: "2023",
    duration: 137,
    dek: "留得住的，也许只有爱。",
    paragraphs: [
      "在《The Land Is Inhospitable and So Are We》里，Mitski 把声音放回更靠近土地的地方。这首歌很短，站得却稳。踏板吉他把夜色拉长，人声不炫耀，像把一句话放到枕边。",
      "月亮在歌里只负责作证。许多东西最终留不住。若还有什么真的算作自己的，也许只是曾经认真付出的爱。",
      "短歌容易被听成一句口号。这一首不是。它把「属于我」说得很轻，轻到更像夜里的自言自语。"
    ]
  }
];

const STORE = "bianzhu.saved.v1";
const ICON_PLAY = '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M8.2 5.8v12.4L18.2 12 8.2 5.8z"/></svg>';
const ICON_PAUSE = '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M7 6h3.2v12H7V6zm6.8 0H17v12h-3.2V6z"/></svg>';

const state = {
  screen: "read",
  from: "read",
  index: 0,
  playing: false,
  elapsed: 0,
  saved: loadSaved(),
  motion: "fade"
};

let lastFrame = 0;
let drag = null;
let suppressClick = false;
let prevScreen = "";
let prevIndex = -1;

const app = document.getElementById("app");

function loadSaved() {
  try {
    const raw = JSON.parse(localStorage.getItem(STORE) || "[]");
    if (!Array.isArray(raw)) return [];
    const ids = raw.filter((id) => songs.some((song) => song.id === id));
    return [...new Set(ids)];
  } catch (err) {
    return [];
  }
}

function persist() {
  try {
    localStorage.setItem(STORE, JSON.stringify(state.saved));
  } catch (err) {
    /* ignore private-mode storage failures */
  }
}

function current() {
  return songs[state.index];
}

function esc(value) {
  return String(value).replace(/[&<>"']/g, (ch) => ({
    "&": "&amp;",
    "<": "&lt;",
    ">": "&gt;",
    '"': "&quot;",
    "'": "&#39;"
  }[ch]));
}

function pad(n) {
  return String(n).padStart(2, "0");
}

function fmt(sec) {
  const s = Math.max(0, Math.floor(sec + 1e-6));
  return `${Math.floor(s / 60)}:${pad(s % 60)}`;
}

function metaLine(song) {
  return [song.artist, song.album, song.year].filter(Boolean).join(" · ");
}

function cnNumber(n) {
  const digit = ["", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
  if (n < 10) return digit[n];
  if (n === 10) return "十";
  if (n < 20) return `十${digit[n - 10]}`;
  const tens = Math.floor(n / 10);
  const ones = n % 10;
  return `${digit[tens]}十${digit[ones]}`;
}

function dateline() {
  const now = new Date();
  const months = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"];
  return `${months[now.getMonth()]}月${cnNumber(now.getDate())}日`;
}

function playWord() {
  const song = current();
  if (state.playing) return "播放中";
  if (state.elapsed > 0 && state.elapsed >= song.duration - 0.05) return "已播完";
  if (state.elapsed > 0) return "已暂停";
  return "未播放";
}

function isSaved(id) {
  return state.saved.includes(id);
}

function art(id) {
  const common = 'viewBox="0 0 400 240" preserveAspectRatio="xMidYMid slice" aria-hidden="true"';
  const motifs = {
    "pink-moon": `<svg ${common}><rect width="400" height="240" fill="#1b2430"/><circle cx="248" cy="104" r="86" fill="none" stroke="#e5d9c4" stroke-opacity="0.35"/><circle cx="248" cy="104" r="68" fill="#e5d9c4"/></svg>`,
    landslide: `<svg ${common}><rect width="400" height="240" fill="#e6d9cc"/><polygon points="0,146 400,104 400,136 0,178" fill="#f4eee6"/><polygon points="0,178 400,136 400,168 0,210" fill="#c4a890"/><polygon points="0,210 400,168 400,206 0,240" fill="#7e624f"/><polygon points="0,240 400,206 400,240" fill="#5c4538"/></svg>`,
    "by-your-side": `<svg ${common}><rect width="400" height="240" fill="#221c19"/><line x1="32" y1="156" x2="368" y2="156" stroke="#c6a36b" stroke-width="1.4"/></svg>`,
    hill: `<svg ${common}><rect width="400" height="240" fill="#d5e0d6"/><g fill="none" stroke="#234037" stroke-width="1.15" stroke-linecap="round"><path d="M-10 210C80 210 140 150 230 96c70-40 130-16 190 24"/><path d="M-10 188c100 0 160-48 242-88 68-32 128-10 188 28"/><path d="M-10 166c110 0 170-34 244-58 58-18 116-4 186 28"/><path d="M-10 146c130 2 186-18 246-30 50-10 104 0 174 24"/><path d="M40 128c110 4 160-4 198-8 38-4 82 4 152 20"/></g></svg>`,
    holocene: `<svg ${common}><rect width="400" height="240" fill="#e4e7e3"/><rect y="162" width="400" height="78" fill="#d0d6d1"/><line x1="0" y1="162" x2="400" y2="162" stroke="#8e9992"/><circle cx="72" cy="146" r="6" fill="#9c4a38"/></svg>`,
    cranes: `<svg ${common}><rect width="400" height="240" fill="#d7e0e4"/><g fill="none" stroke="#3c525c" stroke-width="1.25"><path d="M64 214V78l82 40"/><path d="M168 214V46l100 58"/><path d="M292 214V96l60 36"/></g></svg>`,
    mine: `<svg ${common}><rect width="400" height="240" fill="#16141c"/><circle cx="108" cy="162" r="16" fill="#e3c5a2"/></svg>`
  };
  return motifs[id] || motifs["pink-moon"];
}

function saveButton(song) {
  const on = isSaved(song.id);
  return `<button class="save" type="button" data-save="${esc(song.id)}" aria-pressed="${on ? "true" : "false"}"><span class="mark" aria-hidden="true"></span>${on ? "已留下" : "留下这篇"}</button>`;
}

function stepButtons() {
  const i = state.index;
  const prev = i > 0 ? songs[i - 1].title : "起首";
  const next = i < songs.length - 1 ? songs[i + 1].title : "这一套听完了";
  return `<div class="steps">
    <button class="step" type="button" data-step="-1" ${i === 0 ? "disabled" : ""}>
      <span>上一则</span><strong>${esc(prev)}</strong>
    </button>
    <button class="step step-next" type="button" data-step="1" ${i === songs.length - 1 ? "disabled" : ""}>
      <span>下一则</span><strong>${esc(next)}</strong>
    </button>
  </div>`;
}

function readView(motionClass) {
  const song = current();
  const n = String(state.index + 1).padStart(2, "0");
  const total = String(songs.length).padStart(2, "0");
  return `<article class="sheet ${motionClass}">
    <div class="art">${art(song.id)}</div>
    <div class="sheet-body">
      <p class="kicker">晚间一套 · ${n} / ${total}<i data-kicker-state>${state.playing ? " · 播放中" : ""}</i></p>
      <h2 class="title" lang="${song.lang}">${esc(song.title)}</h2>
      <p class="meta">${esc(metaLine(song))}</p>
      <p class="lead">${esc(song.paragraphs[0])}</p>
      <div class="actions">
        ${saveButton(song)}
        <button class="link" type="button" data-go="now">阅读全文</button>
      </div>
      ${stepButtons()}
    </div>
  </article>`;
}

function nowView(motionClass) {
  const song = current();
  const essay = song.paragraphs.map((p) => `<p>${esc(p)}</p>`).join("");
  return `<article class="sheet sheet-now ${motionClass}">
    <div class="sheet-body">
      <button class="back" type="button" data-back>返回</button>
      <div class="now-head">
        <div class="art">${art(song.id)}</div>
        <div>
          <p class="kicker">正在听<i data-kicker-state>${state.playing ? " · 播放中" : ""}</i></p>
          <h2 class="title" lang="${song.lang}">${esc(song.title)}</h2>
          <p class="meta">${esc(metaLine(song))}</p>
        </div>
      </div>
      <div class="now-actions">${saveButton(song)}</div>
      <div class="essay">${essay}</div>
      ${stepButtons()}
    </div>
  </article>`;
}

function indexView(motionClass) {
  const rows = songs.map((song, i) => {
    const num = String(i + 1).padStart(2, "0");
    const currentRow = i === state.index ? ' aria-current="true"' : "";
    return `<div class="row"${currentRow}>
      <button class="row-open" type="button" data-open="${i}" data-open-screen="read">
        <span class="num">${num}</span>
        <span class="row-copy">
          <span class="row-title" lang="${song.lang}">${esc(song.title)}</span>
          <span class="row-sub">${esc(song.artist)} · ${esc(song.year)}</span>
        </span>
      </button>
    </div>`;
  }).join("");
  return `<div class="${motionClass}">
    <header class="list-head">
      <h2>目录</h2>
      <p>按一个晚上的顺序排了七则。可以从头听，也可以翻到某一则。播放是本地演示，界面上标为 <span class="keep">Apple Music</span>。</p>
    </header>
    <div class="rows">${rows}</div>
  </div>`;
}

function savedView(motionClass) {
  if (!state.saved.length) {
    return `<div class="${motionClass}">
      <header class="list-head"><h2>书签</h2></header>
      <div class="empty">
        <p>还没有留下的故事。读到想再看的一篇，就把它留在这里。</p>
        <button class="textlink" type="button" data-go="read">回到阅读</button>
      </div>
    </div>`;
  }
  const rows = state.saved.map((id) => {
    const song = songs.find((item) => item.id === id);
    const i = songs.indexOf(song);
    return `<div class="row">
      <button class="row-open" type="button" data-open="${i}" data-open-screen="now">
        <span class="row-art">${art(song.id)}</span>
        <span class="row-copy">
          <span class="row-title" lang="${song.lang}">${esc(song.title)}</span>
          <span class="row-sub">${esc(song.artist)} · ${esc(song.year)}</span>
          <span class="row-dek">${esc(song.dek)}</span>
        </span>
      </button>
      <button class="remove" type="button" data-remove="${esc(song.id)}" aria-label="移出《${esc(song.title)}》">移出</button>
    </div>`;
  }).join("");
  return `<div class="${motionClass}">
    <header class="list-head">
      <h2>书签</h2>
      <p>最近留下的排在前面。</p>
    </header>
    <div class="rows">${rows}</div>
  </div>`;
}

function dock() {
  const song = current();
  const playing = state.playing;
  const label = playing ? `暂停《${song.title}》` : `播放《${song.title}》`;
  const icon = playing ? ICON_PAUSE : ICON_PLAY;
  const on = playing ? " is-on" : "";
  if (state.screen === "saved" || state.screen === "index") {
    if (!state.playing && state.elapsed <= 0) return "";
    return `<footer class="dock dock-slim">
      <button class="play play-sm${on}" type="button" data-play aria-pressed="${playing}" aria-label="${esc(label)}">${icon}</button>
      <button class="slim-open" type="button" data-go="now">
        <span class="slim-kicker">Apple Music · ${esc(playWord())}</span>
        <span class="slim-title">${esc(song.title)}</span>
      </button>
    </footer>`;
  }
  return `<footer class="dock">
    <div class="transport">
      <button class="play${on}" type="button" data-play aria-pressed="${playing}" aria-label="${esc(label)}">${icon}</button>
      <div>
        <div class="svc">Apple Music</div>
        <div class="stat"><b data-state-word>${esc(playWord())}</b> · <span data-elapsed>${fmt(state.elapsed)}</span> / ${fmt(song.duration)}</div>
      </div>
    </div>
    <div class="scrub" role="slider" tabindex="0" aria-label="播放进度" aria-valuemin="0" aria-valuemax="${song.duration}" aria-valuenow="${Math.floor(state.elapsed)}" aria-valuetext="${fmt(state.elapsed)}">
      <div class="scrub-fill" data-fill></div>
    </div>
    <p class="disclaimer">本地演示，没有连接音乐服务</p>
  </footer>`;
}

function header() {
  const savedCount = state.saved.length
    ? `<em>${state.saved.length}</em>`
    : "";
  const on = (screen) => (state.screen === screen ? ' aria-current="page"' : "");
  return `<header class="top">
    <div class="brand">
      <button class="wordmark" type="button" data-go="read" translate="no">边注</button>
      <p class="dateline">${esc(dateline())}</p>
    </div>
    <nav class="nav" aria-label="页面">
      <button type="button" data-go="index"${on("index")}>目录</button>
      <button type="button" data-go="saved"${on("saved")}>书签${savedCount}</button>
    </nav>
  </header>`;
}

function motionClass() {
  if (state.screen !== prevScreen) return state.screen === "read" || state.screen === "now" ? "enter-fade" : "list-enter";
  if (state.index !== prevIndex && (state.screen === "read" || state.screen === "now")) {
    return state.motion === "prev" ? "enter-prev" : "enter-next";
  }
  return "";
}

function render() {
  const motion = motionClass();
  const enter = Boolean(motion);
  let view = "";
  if (state.screen === "read") view = readView(motion);
  else if (state.screen === "now") view = nowView(motion);
  else if (state.screen === "saved") view = savedView(motion);
  else view = indexView(motion);

  const list = state.screen === "saved" || state.screen === "index";
  app.dataset.screen = state.screen;
  app.innerHTML = `${header()}<main class="stage${list ? " stage-list" : ""}">${view}</main>${dock()}`;
  paintProgress();
  writeLocation();
  document.title = titleFor();
  if (enter) {
    const stage = app.querySelector(".stage");
    if (stage) stage.scrollTop = 0;
  }
  prevScreen = state.screen;
  prevIndex = state.index;
}

function titleFor() {
  const song = current();
  if (state.screen === "now") return `正在听 ${song.title} — 边注`;
  if (state.screen === "saved") return "书签 — 边注";
  if (state.screen === "index") return "目录 — 边注";
  return `${song.title} — 边注`;
}

function paintProgress() {
  const song = current();
  const ratio = song.duration ? Math.min(1, state.elapsed / song.duration) : 0;
  const fill = app.querySelector("[data-fill]");
  if (fill) fill.style.width = `${ratio * 100}%`;
  const elapsed = app.querySelector("[data-elapsed]");
  if (elapsed) elapsed.textContent = fmt(state.elapsed);
  const scrub = app.querySelector(".scrub");
  if (scrub) {
    scrub.setAttribute("aria-valuenow", String(Math.floor(state.elapsed)));
    scrub.setAttribute("aria-valuetext", fmt(state.elapsed));
    scrub.setAttribute("aria-valuemax", String(song.duration));
  }
}

function paintPlay() {
  const song = current();
  const playing = state.playing;
  app.querySelectorAll("[data-play]").forEach((button) => {
    button.classList.toggle("is-on", playing);
    button.setAttribute("aria-pressed", playing ? "true" : "false");
    button.setAttribute("aria-label", playing ? `暂停《${song.title}》` : `播放《${song.title}》`);
    button.innerHTML = playing ? ICON_PAUSE : ICON_PLAY;
  });
  const word = playWord();
  app.querySelectorAll("[data-state-word]").forEach((node) => {
    node.textContent = word;
  });
  app.querySelectorAll("[data-kicker-state]").forEach((node) => {
    node.textContent = playing ? " · 播放中" : "";
  });
  app.querySelectorAll(".slim-kicker").forEach((node) => {
    node.textContent = `Apple Music · ${word}`;
  });
  paintProgress();
}

function announce(text) {
  const live = document.getElementById("live");
  if (live) live.textContent = text;
}

function togglePlay() {
  const song = current();
  if (!state.playing && state.elapsed >= song.duration - 0.05) state.elapsed = 0;
  state.playing = !state.playing;
  if ((state.screen === "saved" || state.screen === "index") && !app.querySelector("[data-play]")) {
    render();
  } else {
    paintPlay();
  }
  announce(`${song.title}，${state.playing ? "播放中" : "已暂停"}`);
}

function go(screen) {
  if (screen === state.screen) return;
  if (screen === "now") state.from = state.screen;
  state.motion = "fade";
  state.screen = screen;
  render();
}

function step(dir) {
  const next = state.index + dir;
  if (next < 0 || next >= songs.length) return;
  state.index = next;
  state.elapsed = 0;
  state.motion = dir > 0 ? "next" : "prev";
  render();
}

function openAt(index, screen) {
  if (index !== state.index) {
    state.index = index;
    state.elapsed = 0;
    state.playing = false;
  }
  if (screen === "now") state.from = state.screen === "now" ? state.from : state.screen;
  state.motion = "fade";
  state.screen = screen;
  render();
}

function toggleSave(id) {
  const at = state.saved.indexOf(id);
  if (at >= 0) state.saved.splice(at, 1);
  else state.saved.unshift(id);
  persist();
  render();
  const song = songs.find((item) => item.id === id);
  announce(at >= 0 ? `已移出《${song.title}》` : `已留下《${song.title}》`);
}

function seekRatio(clientX) {
  const scrub = app.querySelector(".scrub");
  if (!scrub) return;
  const rect = scrub.getBoundingClientRect();
  const ratio = Math.min(1, Math.max(0, (clientX - rect.left) / rect.width));
  state.elapsed = ratio * current().duration;
  if (state.elapsed >= current().duration) state.playing = false;
  paintPlay();
}

function clampIndex(n) {
  if (!Number.isFinite(n)) return 0;
  return Math.min(songs.length - 1, Math.max(0, n));
}

function readLocation() {
  const hash = location.hash || "#/";
  if (hash.startsWith("#/saved")) return { screen: "saved" };
  if (hash.startsWith("#/index")) return { screen: "index" };
  let match = hash.match(/^#\/now(?:\/(\d+))?$/);
  if (match) {
    return { screen: "now", index: match[1] === undefined ? undefined : clampIndex(Number(match[1])) };
  }
  match = hash.match(/^#\/(\d+)$/);
  if (match) return { screen: "read", index: clampIndex(Number(match[1])) };
  return { screen: "read" };
}

function writeLocation() {
  let hash = "#/";
  if (state.screen === "saved") hash = "#/saved";
  else if (state.screen === "index") hash = "#/index";
  else if (state.screen === "now") hash = `#/now/${state.index}`;
  else if (state.index > 0) hash = `#/${state.index}`;
  if (location.hash !== hash) history.replaceState(null, "", hash);
}

app.addEventListener("click", (event) => {
  if (suppressClick) {
    suppressClick = false;
    return;
  }
  const play = event.target.closest("[data-play]");
  if (play) {
    togglePlay();
    return;
  }
  const to = event.target.closest("[data-go]");
  if (to) {
    go(to.getAttribute("data-go"));
    return;
  }
  const back = event.target.closest("[data-back]");
  if (back) {
    state.screen = state.from && state.from !== "now" ? state.from : "read";
    state.motion = "fade";
    render();
    return;
  }
  const move = event.target.closest("[data-step]");
  if (move && !move.disabled) {
    step(Number(move.getAttribute("data-step")));
    return;
  }
  const save = event.target.closest("[data-save]");
  if (save) {
    toggleSave(save.getAttribute("data-save"));
    return;
  }
  const remove = event.target.closest("[data-remove]");
  if (remove) {
    toggleSave(remove.getAttribute("data-remove"));
    return;
  }
  const open = event.target.closest("[data-open]");
  if (open) {
    openAt(Number(open.getAttribute("data-open")), open.getAttribute("data-open-screen") || "read");
  }
});

app.addEventListener("pointerdown", (event) => {
  const scrub = event.target.closest(".scrub");
  if (scrub) {
    scrub.setPointerCapture(event.pointerId);
    scrub.dataset.drag = "1";
    seekRatio(event.clientX);
    return;
  }
  if (state.screen !== "read") return;
  const sheet = event.target.closest(".sheet");
  if (!sheet || event.target.closest("button, .scrub")) return;
  drag = { id: event.pointerId, x: event.clientX, y: event.clientY, sheet, dx: 0, locked: "" };
});

app.addEventListener("pointermove", (event) => {
  const scrub = event.target.closest(".scrub");
  if (scrub && scrub.dataset.drag === "1") {
    seekRatio(event.clientX);
    return;
  }
  if (!drag || event.pointerId !== drag.id) return;
  const dx = event.clientX - drag.x;
  const dy = event.clientY - drag.y;
  if (!drag.locked) {
    if (Math.abs(dx) < 8 && Math.abs(dy) < 8) return;
    drag.locked = Math.abs(dx) > Math.abs(dy) ? "x" : "y";
    if (drag.locked === "x") drag.sheet.setPointerCapture(event.pointerId);
  }
  if (drag.locked !== "x") return;
  drag.dx = dx;
  drag.sheet.classList.add("is-dragging");
  const atStart = state.index === 0 && dx > 0;
  const atEnd = state.index === songs.length - 1 && dx < 0;
  const resisted = atStart || atEnd ? dx * 0.28 : dx;
  drag.dx = resisted;
  drag.sheet.style.transform = `translateX(${resisted}px)`;
});

app.addEventListener("pointerup", (event) => {
  const scrub = app.querySelector(".scrub");
  if (scrub && scrub.dataset.drag === "1") delete scrub.dataset.drag;
  if (!drag || event.pointerId !== drag.id) return;
  const dx = drag.dx;
  drag.sheet.classList.remove("is-dragging");
  drag.sheet.style.transform = "";
  if (Math.abs(dx) > 8) {
    suppressClick = true;
    setTimeout(() => {
      suppressClick = false;
    }, 400);
  }
  drag = null;
  if (dx <= -64) step(1);
  else if (dx >= 64) step(-1);
});

app.addEventListener("pointercancel", () => {
  if (!drag) return;
  drag.sheet.classList.remove("is-dragging");
  drag.sheet.style.transform = "";
  drag = null;
});

app.addEventListener("keydown", (event) => {
  const scrub = event.target.closest(".scrub");
  if (!scrub) return;
  if (event.key === "ArrowRight") {
    state.elapsed = Math.min(current().duration, state.elapsed + 5);
    paintPlay();
  } else if (event.key === "ArrowLeft") {
    state.elapsed = Math.max(0, state.elapsed - 5);
    paintPlay();
  } else if (event.key === "Home") {
    state.elapsed = 0;
    paintPlay();
  } else if (event.key === "End") {
    state.elapsed = current().duration;
    state.playing = false;
    paintPlay();
  } else {
    return;
  }
  event.preventDefault();
});

window.addEventListener("hashchange", () => {
  const loc = readLocation();
  let changed = false;
  if (loc.screen !== state.screen) {
    state.screen = loc.screen;
    changed = true;
  }
  if (loc.index !== undefined && loc.index !== state.index) {
    state.index = loc.index;
    state.elapsed = 0;
    state.playing = false;
    changed = true;
  }
  if (!changed) return;
  state.motion = "fade";
  render();
});

function tick(now) {
  if (!lastFrame) lastFrame = now;
  const dt = Math.min(0.1, (now - lastFrame) / 1000);
  lastFrame = now;
  if (state.playing) {
    state.elapsed += dt;
    const song = current();
    if (state.elapsed >= song.duration) {
      state.elapsed = song.duration;
      state.playing = false;
      paintPlay();
      announce(`${song.title}，已播完`);
    } else {
      paintProgress();
    }
  }
  requestAnimationFrame(tick);
}

const initial = readLocation();
state.screen = initial.screen;
if (initial.index !== undefined) state.index = initial.index;
render();
requestAnimationFrame(tick);
