// Function to load JSON file from a real file
async function loadScaleforms() {
    try {
        const response = await fetch("scaleforms.json")
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`)
        }
        const scaleformsData = await response.json()

        // Add HOME element to scaleforms object
        scaleformsData["HOME"] = {
            file: "HOME",
            isHome: true,
            content: {
                title: "DECOMPILED SCALEFORMS",
                lastUpdated: "15-07-2026",
                description: [
                    "This WIKI format is based from: https://vespura.com/fivem/scaleform/",
                    "THIS ONE ITS JUST UPDATED",
                    "Decompiled from GTA V build 1.0.3889.0 (DLC mp2026_01).",
                    "Each scaleform is tagged Vanilla (shipped in the base game files), with the DLC that introduced it, or Post-launch when it came after release but the DLC can't be pinned down. The date next to it is the last time Rockstar modified that .gfx, which is NOT when it was introduced: cellphone_ifruit ships with the base game but was last touched in 2024.",
                    "The game never records which DLC brought a scaleform in, since they all live in update.rpf, a cumulative blob with no per-file origin. The DLC tags here are recovered from three indirect traces: the minimap interior movies (int<hash>.gfx) are named after the joaat of an MLO archetype, and that interior's .ytyp does live inside a specific dlc.rpf; scaleforms calling SET_TEXT_WITH_TRANSLATION carry GXT keys that only one DLC's .gxt2 defines; and scaleformpreallocation.xml turns out to be hand-edited in insertion order, so it doubles as a timeline. That covers 645 of the 817 .gfx files. The rest stay Post-launch rather than being guessed.",
                    "Here is a list of all decompiled scaleforms and all of their functions (duplicate entries removed). Note this is all auto generated so not all of these functions may work in-game. In most cases, only the UPPERCASE function names are the ones that work in-game. I've not removed the lowercase functions however, because sometimes lowercase functions DO work.",
                    "Note that most pausemenu / frontend menu scaleforms can NOT be manually drawn on the screen. You will need to use global scaleform natives to call those functions using frontend menus. This is a LOT harder because almost nothing is documented.",
                    "If you want to acces all the decompiled scaleforms you can check it here: https://github.com/floppystudiodev/GTAV-Scaleforms-Decompiled"
                ],
                codeExample: `
                int    RequestScaleformMovie(scalename)
                bool   HasScaleformMovieLoaded(scale)
                bool   HasScaleformMovieFilenameLoaded(scalename)

                bool   BeginScaleformMovieMethodOnFrontend(funcname)      // (global/frontend menu scaleform functions, not used very often)
                bool   BeginScaleformMovieMethodOnFrontendHeader(funcname) // (global/frontend menu scaleform functions, not used very often)

                bool   BeginScaleformMovieMethod(scale, funcname)
                void   CallScaleformMovieMethod(scale, funcname)

                void   ScaleformMovieMethodAddParamInt(int)
                void   ScaleformMovieMethodAddParamFloat(float)
                void   ScaleformMovieMethodAddParamBool(bool)
                void   ScaleformMovieMethodAddParamTextureNameString(string)

                void   EndScaleformMovieMethod()
                int    EndScaleformMovieMethodReturnValue()
                bool   IsScaleformMovieMethodReturnValueReady(int methodReturn)
                int    GetScaleformMovieMethodReturnValueInt(int methodReturn)`,
            },
        }

        return scaleformsData
    } catch (error) {
        console.error("Error al cargar los scaleforms:", error)
        return {}
    }
}

// Mapa scaleform -> scripts .c que lo cargan. Si el fetch falla devolvemos {} y la
// wiki sigue: la seccion "Loaded in N scripts" simplemente no se pinta.
async function loadScaleformScripts() {
    try {
        const response = await fetch("scaleform_scripts.json")
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`)
        }
        return await response.json()
    } catch (error) {
        console.error("Error al cargar el mapa de scripts:", error)
        return {}
    }
}

// Indice de busqueda: se construye una vez al arrancar. Cada entrada guarda el
// nombre y todas sus funciones ya en minusculas para no recalcularlo en cada tecla.
const searchIndex = []

// Relleno en el arranque desde scaleform_scripts.json. Vacio si ese fetch falla.
let scaleformScripts = {}

// Function to render scaleforms list in sidebar
function renderScaleformList(scaleforms) {
    const scaleformList = document.getElementById("scaleform-list")
    scaleformList.innerHTML = "" // Clear current content

    const keys = Object.keys(scaleforms)
        .filter((key) => key !== "HOME")
        .sort()

    const fragment = document.createDocumentFragment()

    keys.forEach((key) => {
        const scaleformItem = document.createElement("div")
        scaleformItem.className = "scaleform-item"
        scaleformItem.textContent = key
        scaleformItem.dataset.key = key
        fragment.appendChild(scaleformItem)

        const functions = scaleforms[key].functions || []
        searchIndex.push({
            key: key,
            haystack: key.toLowerCase(),
            functions: functions.map((f) => f.name).join(" ").toLowerCase(),
            el: scaleformItem,
        })
    })

    scaleformList.appendChild(fragment)
    document.getElementById("sidebar-count").textContent = keys.length

    // Un solo listener delegado para los 506 items (antes eran 1012)
    scaleformList.addEventListener("click", (e) => {
        const item = e.target.closest(".scaleform-item")
        if (item) window.location.hash = item.dataset.key
    })
}

// `key` es el nombre del .gfx (el que va en RequestScaleformMovie y en el ancla).
// `scaleform.file` es solo el .as del que se sacaron las funciones, que en 219 de
// 506 entradas NO coincide: BUSY_SPINNER comparte ActionScript con INSTRUCTIONAL_BUTTONS.
function renderScaleformDetails(scaleform, key) {
    const scaleformDetails = document.getElementById("scaleform-details")
    scaleformDetails.innerHTML = "" // Clear current content

    // Check if it's HOME page
    if (scaleform.isHome) {
        // Render HOME content
        const homeContent = document.createElement("div")
        homeContent.className = "home-content"

        // Title and date
        const title = document.createElement("h1")
        title.textContent = scaleform.content.title
        homeContent.appendChild(title)

        const lastUpdated = document.createElement("div")
        lastUpdated.className = "last-updated"
        lastUpdated.textContent = `Last updated: ${scaleform.content.lastUpdated}`
        homeContent.appendChild(lastUpdated)

        // Content section
        const contentSection = document.createElement("div")
        contentSection.className = "content-section"

        // Description paragraphs
        scaleform.content.description.forEach((paragraph) => {
            const p = document.createElement("p")
            p.innerHTML = convertLinksToHTML(paragraph);
            contentSection.appendChild(p)
        })

        // Title for code example
        const codeTitle = document.createElement("h2")
        codeTitle.textContent = "Common Scaleform Natives"
        contentSection.appendChild(codeTitle)

        const codeParagraph = document.createElement("p")
        codeParagraph.textContent = "Here is a list of most common scaleform natives that you'll likely end up using:"
        contentSection.appendChild(codeParagraph)

        // Code block
        const codeBlock = document.createElement("div")
        codeBlock.className = "code-block"

        const pre = document.createElement("pre")
        const code = document.createElement("code");
        code.className = "manual-format";
        code.innerHTML = formatCode(dedent(scaleform.content.codeExample));
        pre.appendChild(code)
        codeBlock.appendChild(pre)

        contentSection.appendChild(codeBlock)
        homeContent.appendChild(contentSection)

        scaleformDetails.appendChild(homeContent)
    } else {
        // Render normal scaleform content
        // Create title
        const title = document.createElement("h2")
        title.className = "scaleform-title"
        title.textContent = key
        scaleformDetails.appendChild(title)

        const meta = renderOriginMeta(scaleform, key)
        if (meta) scaleformDetails.appendChild(meta)

        // Va aqui, antes del return de "0 funciones", para que tambien se vea en los
        // scaleforms que son puro arte (fonts/texturas) y no tienen ActionScript.
        const scripts = renderScriptUsage(key)
        if (scripts) scaleformDetails.appendChild(scripts)

        const functions = scaleform.functions || []

        if (functions.length === 0) {
            const empty = document.createElement("div")
            empty.className = "empty-functions"
            empty.textContent = "No functions were found in this .gfx. It's either pure artwork (fonts, textures) or its ActionScript didn't survive decompilation."
            scaleformDetails.appendChild(empty)
            return
        }

        // Filtro solo cuando la lista es larga: la mediana son 6 funciones, pero
        // SOCIAL_CLUB2 tiene 142 y ahi buscar a ojo no es viable.
        if (functions.length > 12) {
            scaleformDetails.appendChild(renderFunctionFilter(functions.length))
        }

        // Create functions list
        const functionList = document.createElement("div")
        functionList.className = "function-list"
        functionList.id = "function-list"

        // Add each function to list
        functions.forEach((func) => {
            const functionItem = document.createElement("div")
            functionItem.className = "function-item"
            functionItem.dataset.name = func.name.toLowerCase()

            const functionCode = document.createElement("code")
            functionCode.className = "function-code"

            // Format function name and arguments
            const functionName = document.createElement("span")
            functionName.className = "function-name"
            functionName.textContent = func.name

            // Las minusculas normalmente no funcionan in-game (lo dice el HOME),
            // asi que pesan menos visualmente en vez de mentir por omision.
            if (func.name !== func.name.toUpperCase()) {
                functionName.classList.add("is-lowercase")
                functionName.title = "Not uppercase: usually these don't work in-game, but sometimes they do"
            }

            functionCode.appendChild(functionName)
            functionCode.appendChild(document.createTextNode("("))

            // Highlight each argument
            func.args.forEach((arg, index) => {
                const argElement = document.createElement("span");
                argElement.className = "function-arg";
                argElement.textContent = arg;

                functionCode.appendChild(argElement);

                // Add comma if not last argument
                if (index < func.args.length - 1) {
                    functionCode.appendChild(document.createTextNode(", "));
                }
            });

            functionCode.appendChild(document.createTextNode(")"))
            functionItem.appendChild(functionCode)

            const copyButton = document.createElement("button")
            copyButton.type = "button"
            copyButton.className = "fn-copy"
            copyButton.textContent = "COPY"
            copyButton.dataset.copy = func.name
            copyButton.title = `Copy "${func.name}" to the clipboard`
            functionItem.appendChild(copyButton)

            functionList.appendChild(functionItem)
        })

        scaleformDetails.appendChild(functionList)
    }
}

function renderFunctionFilter(total) {
    const row = document.createElement("div")
    row.className = "fn-filter-row"

    const input = document.createElement("input")
    input.type = "text"
    input.id = "fn-filter"
    input.className = "fn-filter"
    input.placeholder = "Filter functions..."
    input.autocomplete = "off"
    input.spellcheck = false

    const count = document.createElement("span")
    count.className = "fn-filter-count"
    count.id = "fn-filter-count"
    count.textContent = `${total} functions`

    row.appendChild(input)
    row.appendChild(count)
    return row
}

function filterFunctions(query) {
    const list = document.getElementById("function-list")
    if (!list) return

    const q = query.trim().toLowerCase()
    const items = list.querySelectorAll(".function-item")
    let visible = 0

    items.forEach((item) => {
        const hit = !q || item.dataset.name.includes(q)
        item.classList.toggle("hidden", !hit)
        if (hit) visible++
    })

    const count = document.getElementById("fn-filter-count")
    if (count) {
        count.textContent = q
            ? `${visible} of ${items.length} functions`
            : `${items.length} functions`
    }
}

// En que scripts .c se pide este scaleform. 339 de 506 los carga el motor y no aparece
// ninguno; otros llegan a 249, asi que los largos se pintan en diferido: solo 8 nodos
// en el DOM hasta que se expande o se filtra. Devuelve null si el mapa no cargo.
function renderScriptUsage(key) {
    const usage = scaleformScripts[key]
    if (!usage) return null

    const sortNames = (arr) =>
        (arr || []).slice().sort((a, b) => a.localeCompare(b, undefined, { sensitivity: "base" }))

    // Orden fijo: primero direct, luego indirect, luego via_helper; alfabetico dentro.
    const items = [
        ...sortNames(usage.direct).map((name) => ({ name, kind: "direct" })),
        ...sortNames(usage.indirect).map((name) => ({ name, kind: "indirect" })),
        ...sortNames(usage.via_helper).map((name) => ({ name, kind: "helper" })),
    ]
    const total = items.length

    // Motor: nadie lo pide desde un script.
    if (total === 0) {
        const section = document.createElement("section")
        section.className = "sf-scripts sf-scripts--engine"
        section.setAttribute("aria-label", "Load source")
        const p = document.createElement("p")
        p.className = "sf-scripts__engine"
        p.textContent = "Loaded by the engine (no script requests it)"
        section.appendChild(p)
        return section
    }

    const section = document.createElement("section")
    section.className = "sf-scripts"
    section.setAttribute("aria-label", "Scripts that load this scaleform")

    const head = document.createElement("div")
    head.className = "sf-scripts__head"

    const title = document.createElement("h3")
    title.className = "sf-scripts__title"
    title.appendChild(document.createTextNode("Loaded in "))
    const count = document.createElement("span")
    count.className = "sf-scripts__count"
    count.textContent = total
    title.appendChild(count)
    title.appendChild(document.createTextNode(total === 1 ? " script" : " scripts"))
    head.appendChild(title)

    const list = document.createElement("ul")
    list.className = "sf-scripts__list"

    // Colapso y filtro solo tienen sentido pasados los 8; por debajo se ve todo.
    const collapsible = total > 8
    let toggle = null
    let filter = null
    let expanded = false

    function itemEl(item) {
        const li = document.createElement("li")
        li.className = "sf-scripts__item"
        const name = document.createElement("span")
        name.className = "sf-scripts__name"
        name.textContent = item.name
        const tag = document.createElement("span")
        tag.className = `sf-scripts__tag sf-scripts__tag--${item.kind}`
        tag.textContent = item.kind
        li.appendChild(name)
        li.appendChild(tag)
        return li
    }

    // Repinta la lista segun el estado. Con filtro se ven TODOS los matches (ignora el
    // colapso) y el boton sobra; sin filtro, o los 8 primeros o todos si esta expandido.
    function renderList() {
        const q = filter ? filter.value.trim().toLowerCase() : ""
        const shown = q
            ? items.filter((it) => it.name.toLowerCase().includes(q))
            : (collapsible && !expanded ? items.slice(0, 8) : items)

        list.innerHTML = ""
        if (q && shown.length === 0) {
            const empty = document.createElement("li")
            empty.className = "sf-scripts__empty"
            empty.textContent = "no matches"
            list.appendChild(empty)
        } else {
            const fragment = document.createDocumentFragment()
            shown.forEach((it) => fragment.appendChild(itemEl(it)))
            list.appendChild(fragment)
        }
        if (toggle) toggle.classList.toggle("hidden", !!q)
    }

    if (collapsible) {
        filter = document.createElement("input")
        filter.type = "text"
        filter.className = "sf-scripts__filter"
        filter.placeholder = "filter scripts…"
        filter.setAttribute("aria-label", "Filter scripts")
        filter.autocomplete = "off"
        filter.spellcheck = false
        filter.addEventListener("input", renderList)
        head.appendChild(filter)

        toggle = document.createElement("button")
        toggle.type = "button"
        toggle.className = "sf-scripts__toggle"
        toggle.setAttribute("aria-expanded", "false")
        toggle.textContent = `Show all ${total}`
        toggle.addEventListener("click", () => {
            expanded = !expanded
            toggle.setAttribute("aria-expanded", String(expanded))
            toggle.textContent = expanded ? "Show less" : `Show all ${total}`
            renderList()
        })
    }

    section.appendChild(head)
    section.appendChild(list)
    if (toggle) section.appendChild(toggle)

    renderList()
    return section
}

// Procedencia: "vanilla" = venia en el disco base, "dlc" = lo trajo el pack que dice `dlc`,
// "post-launch" = llego despues del lanzamiento pero no hay dato que diga con que DLC.
// lastModified es la ultima vez que Rockstar toco el archivo, NO cuando aparecio:
// cellphone_ifruit es vanilla de 2013 y su fecha es de 2024.
function originTag(text, cls, hint) {
    const el = document.createElement("span")
    el.className = `origin-tag ${cls}`
    el.textContent = text
    el.title = hint
    return el
}

function metaFact(text, hint) {
    const el = document.createElement("span")
    el.className = "meta-fact"
    if (text) el.textContent = text
    if (hint) el.title = hint
    return el
}

function metaStrong(text) {
    const el = document.createElement("span")
    el.className = "meta-strong"
    el.textContent = text
    return el
}

function renderOriginMeta(scaleform, key) {
    const { origin, dlc, dlcDate, dlcRange, lastModified, file } = scaleform

    const meta = document.createElement("div")
    meta.className = "scaleform-meta"

    // El tag dice siempre la categoria; el texto de al lado, el detalle concreto.
    const facts = []

    if (origin === "dlc" && dlc) {
        meta.appendChild(originTag("DLC", "origin-dlc", "Traced back to the DLC that introduced it"))
        const f = metaFact(null)
        f.appendChild(document.createTextNode("added by "))
        f.appendChild(metaStrong(dlc))
        if (dlcDate) f.appendChild(document.createTextNode(` (${dlcDate})`))
        facts.push(f)
    } else if (origin === "vanilla") {
        // El tag ya lo dice todo, no hace falta repetirlo en texto.
        meta.appendChild(originTag("VANILLA", "origin-vanilla", "Shipped with the base game"))
    } else if (origin === "post-launch") {
        meta.appendChild(originTag("POST-LAUNCH", "origin-post-launch",
            "Added after release. The game never records which DLC a scaleform came with, so this one can't be pinned to one"))
        if (dlcRange) {
            const f = metaFact(null, "Narrowed down by its slot in scaleformpreallocation.xml, which is hand-edited in insertion order. Not pinned to a single DLC")
            f.appendChild(document.createTextNode("added between "))
            f.appendChild(metaStrong(dlcRange[0]))
            f.appendChild(document.createTextNode(" and "))
            f.appendChild(metaStrong(dlcRange[1]))
            facts.push(f)
        } else {
            facts.push(metaFact("DLC not recoverable",
                "Everything lives in update.rpf, a cumulative blob with no per-file origin, and this one leaves no GXT or preallocation trace"))
        }
    }

    if (lastModified) {
        facts.push(metaFact(`.gfx last modified ${lastModified.slice(0, 10)}`,
            "When Rockstar last touched the .gfx file itself. NOT when the scaleform was introduced"))
    }

    const count = (scaleform.functions || []).length
    facts.push(metaFact(count === 1 ? "1 function" : `${count} functions`))

    // Si las funciones salen de otro .as, decirlo: explica por que aparecen
    // funciones "ajenas" y avisa de los matches flojos (FIB_PC -> mousecursor).
    if (file && key && file.toUpperCase() !== key.toUpperCase()) {
        const f = metaFact(null, `The functions listed here were read from ${file}.as inside this .gfx. Its name doesn't match the scaleform, so the list may belong to a shared or wrongly matched class. Request the movie by its own name: ${key}`)
        f.appendChild(document.createTextNode("functions read from "))
        f.appendChild(metaStrong(`${file}.as`))
        facts.push(f)
    }

    facts.forEach((fact, i) => {
        if (i > 0) {
            const sep = document.createElement("span")
            sep.className = "meta-sep"
            sep.textContent = "·"
            meta.appendChild(sep)
        }
        meta.appendChild(fact)
    })

    return meta
}

function convertLinksToHTML(text) {
    return text.replace(/(https?:\/\/[^\s]+)/g, '<a href="$1" target="_blank" class="external-link">$1</a>');
}

// El ejemplo de natives viene indentado con la sangria del fuente
function dedent(code) {
    const lines = code.replace(/^[ \t]*\n/, "").replace(/\s+$/, "").split("\n")
    const indents = lines.filter((l) => l.trim()).map((l) => l.match(/^ */)[0].length)
    const pad = Math.min.apply(null, indents)
    return lines.map((l) => l.slice(pad)).join("\n")
}

function formatCode(code) {
    return code
        .replace(/(int|bool|void|string|float)/g, '<span class="type">$1</span>') // Data types
        .replace(/([A-Za-z_]+)\(/g, '<span class="function">$1</span>(') // Functions
        .replace(/\/\/(.*)/g, '<span class="comment">//$1</span>'); // Comments
}

// Function to filter scaleforms based on search text
function filterScaleforms(searchText) {
    const query = searchText.trim().toLowerCase()
    let visibleCount = 0

    for (const entry of searchIndex) {
        const hit = !query || entry.haystack.includes(query)
        entry.el.classList.toggle("hidden", !hit)
        if (hit) visibleCount++
    }

    // Si ningun nombre encaja, probamos por nombre de funcion antes de rendirnos:
    // "SET_TICK" es una busqueda legitima y hasta ahora devolvia "no results".
    let byFunction = 0
    if (query && visibleCount === 0) {
        for (const entry of searchIndex) {
            const hit = entry.functions.includes(query)
            entry.el.classList.toggle("hidden", !hit)
            if (hit) byFunction++
        }
    }

    setSearchNote(byFunction > 0 ? `No scaleform is called <b>${escapeHTML(searchText.trim())}</b>. These ${byFunction} have a function that matches:` : null)
    setNoResults(visibleCount === 0 && byFunction === 0)
}

function escapeHTML(text) {
    const div = document.createElement("div")
    div.textContent = text
    return div.innerHTML
}

function setSearchNote(html) {
    const list = document.getElementById("scaleform-list")
    let note = document.getElementById("search-note")
    if (!html) {
        if (note) note.remove()
        return
    }
    if (!note) {
        note = document.createElement("div")
        note.id = "search-note"
        note.className = "search-note"
        list.insertBefore(note, list.firstChild)
    }
    note.innerHTML = html
}

function setNoResults(show) {
    const existing = document.getElementById("no-results")
    if (!show) {
        if (existing) existing.remove()
        return
    }
    if (existing) return
    const noResults = document.createElement("div")
    noResults.id = "no-results"
    noResults.className = "no-results"
    noResults.textContent = "No scaleform name or function matches that."
    document.getElementById("scaleform-list").appendChild(noResults)
}

// Copia el NOMBRE, que es lo que acaba dentro de BeginScaleformMovieMethod(sf, "...")
async function copyToClipboard(text) {
    try {
        await navigator.clipboard.writeText(text)
        return true
    } catch (err) {
        const ta = document.createElement("textarea")
        ta.value = text
        ta.style.position = "fixed"
        ta.style.opacity = "0"
        document.body.appendChild(ta)
        ta.select()
        const ok = document.execCommand("copy")
        ta.remove()
        return ok
    }
}

let copyResetTimer = null

// Initialize app when DOM is loaded
document.addEventListener("DOMContentLoaded", async () => {
    // Los dos fetch son independientes: en paralelo para no encadenar latencias.
    const [scaleforms, scripts] = await Promise.all([loadScaleforms(), loadScaleformScripts()]);
    scaleformScripts = scripts;
    renderScaleformList(scaleforms);

    const searchInput = document.getElementById("search-input");
    const homeButton = document.getElementById("home-button");
    const sidebar = document.getElementById("sidebar");
    const indexToggle = document.getElementById("index-toggle");
    const mobileCurrent = document.getElementById("mobile-current");
    const scaleformList = document.getElementById("scaleform-list");

    searchInput.addEventListener("input", (e) => {
        filterScaleforms(e.target.value);
    });

    // Enter abre el primer resultado visible: buscar -> encontrar sin tocar el raton
    searchInput.addEventListener("keydown", (e) => {
        if (e.key !== "Enter") return
        const first = searchIndex.find((entry) => !entry.el.classList.contains("hidden"))
        if (first) window.location.hash = first.key
    });

    document.addEventListener("keydown", (e) => {
        if (e.key !== "/" || e.metaKey || e.ctrlKey) return
        const tag = document.activeElement && document.activeElement.tagName
        if (tag === "INPUT" || tag === "TEXTAREA") return
        e.preventDefault()
        searchInput.focus()
        searchInput.select()
    });

    // Filtro y copia dentro del detalle: delegados, para no meter 142 listeners por ficha
    const details = document.getElementById("scaleform-details");

    details.addEventListener("input", (e) => {
        if (e.target.id === "fn-filter") filterFunctions(e.target.value)
    });

    details.addEventListener("click", async (e) => {
        const button = e.target.closest(".fn-copy")
        if (!button) return
        const ok = await copyToClipboard(button.dataset.copy)
        clearTimeout(copyResetTimer)
        document.querySelectorAll(".fn-copy.copied").forEach((b) => {
            b.classList.remove("copied")
            b.textContent = "COPY"
        })
        button.textContent = ok ? "COPIED" : "FAILED"
        button.classList.add("copied")
        copyResetTimer = setTimeout(() => {
            button.classList.remove("copied")
            button.textContent = "COPY"
        }, 1200)
    });

    if (indexToggle) {
        indexToggle.addEventListener("click", () => {
            const open = sidebar.classList.toggle("open")
            indexToggle.textContent = open ? "CLOSE" : "INDEX"
            indexToggle.setAttribute("aria-expanded", String(open))
            if (open) ensureActiveVisible()
        })
    }

    function ensureActiveVisible() {
        const active = scaleformList.querySelector(".scaleform-item.active")
        if (!active) return
        const top = active.offsetTop - scaleformList.scrollTop
        if (top < 0 || top > scaleformList.clientHeight - active.offsetHeight) {
            scaleformList.scrollTop = active.offsetTop - scaleformList.clientHeight / 2
        }
    }

    // Function to handle URL hash
    function handleHashChange() {
        const hash = decodeURIComponent(window.location.hash.substring(1)); // Remove "#"
        const key = hash && scaleforms[hash] ? hash : "HOME"
        const scaleform = scaleforms[key]
        if (!scaleform) return

        renderScaleformDetails(scaleform, key);

        document.title = key === "HOME" ? "GTA V Scaleforms" : `${key} - GTA V Scaleforms`
        if (mobileCurrent) mobileCurrent.textContent = key

        // Highlight in list
        document.querySelectorAll(".scaleform-item.active, .home-button.active").forEach(item => {
            item.classList.remove("active");
        });

        if (key === "HOME") {
            homeButton.classList.add("active")
        } else {
            const activeItem = scaleformList.querySelector(`.scaleform-item[data-key="${CSS.escape(key)}"]`);
            if (activeItem) {
                activeItem.classList.add("active");
                // Al entrar por un enlace directo el item activo puede estar a 3000px
                // de scroll: sin esto no sabes donde estas en la lista.
                ensureActiveVisible()
            }
        }

        // En movil el indice tapa la pantalla; al elegir algo, sobra
        sidebar.classList.remove("open")
        if (indexToggle) {
            indexToggle.textContent = "INDEX"
            indexToggle.setAttribute("aria-expanded", "false")
        }

        document.querySelector(".main-content").scrollTop = 0
    }

    homeButton.addEventListener("click", () => {
        window.location.hash = "HOME";
    });

    // Unico punto de entrada: el hash manda y renderiza una sola vez
    handleHashChange();
    window.addEventListener("hashchange", handleHashChange);
});
