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
                lastUpdated: "30-09-2025",
                description: [
                    "This WIKI format is based from: https://vespura.com/fivem/scaleform/",
                    "THIS ONE ITS JUST UPDATED",
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

// Function to render scaleforms list in sidebar
function renderScaleformList(scaleforms) {
    const scaleformList = document.getElementById("scaleform-list")
    const homeButton = document.getElementById("home-button")
    scaleformList.innerHTML = "" // Clear current content

    // Set up HOME button
    homeButton.addEventListener("click", () => {
        // Remove active class from all elements
        document.querySelectorAll(".scaleform-item, .home-button").forEach((item) => {
            item.classList.remove("active")
        })

        // Add active class to HOME button
        homeButton.classList.add("active")

        // Display HOME details
        renderScaleformDetails(scaleforms["HOME"])
    })

    // Create elements for each scaleform (excluding HOME)
    Object.keys(scaleforms)
        .filter((key) => key !== "HOME")
        .sort()
        .forEach((key) => {
            const scaleformItem = document.createElement("div")
            scaleformItem.className = "scaleform-item"
            scaleformItem.textContent = key
            scaleformItem.dataset.key = key
            
            scaleformItem.addEventListener("click", () => {
                // Remove active class from all elements
                document.querySelectorAll(".scaleform-item").forEach((item) => {
                    item.classList.remove("active")
                })
            
                // Add active class to selected element
                scaleformItem.classList.add("active")
            
                // Display selected scaleform details
                renderScaleformDetails(scaleforms[key])
            })
        
            scaleformList.appendChild(scaleformItem)
            })

    homeButton.click()
}

// Function to render scaleform details
function renderScaleformDetails(scaleform) {
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
        code.innerHTML = formatCode(scaleform.content.codeExample);
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
        title.textContent = scaleform.file
        scaleformDetails.appendChild(title)

        // Create functions list
        const functionList = document.createElement("div")
        functionList.className = "function-list"

        // Add each function to list
        scaleform.functions.forEach((func) => {
            const functionItem = document.createElement("div")
            functionItem.className = "function-item"

            const functionCode = document.createElement("code")
            functionCode.className = "function-code"

            // Format function name and arguments
            const functionName = document.createElement("span")
            functionName.className = "function-name"
            functionName.textContent = func.name

            functionCode.appendChild(functionName)
            functionCode.appendChild(document.createTextNode("("))

            // Highlight each argument in blue
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
            functionList.appendChild(functionItem)
        })

        scaleformDetails.appendChild(functionList)
    }
}

function convertLinksToHTML(text) {
    return text.replace(/(https?:\/\/[^\s]+)/g, '<a href="$1" target="_blank" class="external-link">$1</a>');
}

function formatCode(code) {
    return code
        .replace(/(int|bool|void|string|float)/g, '<span class="type">$1</span>') // Data types in red
        .replace(/([A-Za-z_]+)\(/g, '<span class="function">$1</span>(') // Functions in blue
        .replace(/\/\/(.*)/g, '<span class="comment">//$1</span>'); // Comments in gray
}

// Function to filter scaleforms based on search text
function filterScaleforms(searchText) {
    const scaleformItems = document.querySelectorAll(".scaleform-item")
    let visibleCount = 0

    scaleformItems.forEach((item) => {
        const scaleformName = item.textContent.toLowerCase()
        if (scaleformName.includes(searchText.toLowerCase())) {
            item.classList.remove("hidden")
            visibleCount++
        } else {
            item.classList.add("hidden")
        }
    })

    // Show message if no results
    const noResultsElement = document.getElementById("no-results")
    if (visibleCount === 0) {
        if (!noResultsElement) {
            const noResults = document.createElement("div")
            noResults.id = "no-results"
            noResults.className = "no-results"
            noResults.textContent = "No se encontraron resultados"
            document.getElementById("scaleform-list").appendChild(noResults)
        }
    } else if (noResultsElement) {
        noResultsElement.remove()
    }
}

// Initialize app when DOM is loaded
document.addEventListener("DOMContentLoaded", async () => {
    const scaleforms = await loadScaleforms();
    renderScaleformList(scaleforms);

    // Set up search bar
    const searchInput = document.getElementById("search-input");
    searchInput.addEventListener("input", (e) => {
        filterScaleforms(e.target.value);
    });

    // Function to handle URL hash
    function handleHashChange() {
        const hash = window.location.hash.substring(1); // Remove "#"
        if (hash && scaleforms[hash]) {
            renderScaleformDetails(scaleforms[hash]);

            // Highlight scaleform in list
            document.querySelectorAll(".scaleform-item").forEach(item => {
                item.classList.remove("active");
            });

            const activeItem = document.querySelector(`.scaleform-item[data-key="${hash}"]`);
            if (activeItem) {
                activeItem.classList.add("active");
            }
        }
    }

    // Call function when page loads with hash
    handleHashChange();

    // Listen for URL hash changes
    window.addEventListener("hashchange", handleHashChange);

    // Modify button events to update hash on click
    document.querySelectorAll(".scaleform-item").forEach(item => {
        item.addEventListener("click", () => {
            window.location.hash = item.dataset.key;
        });
    });

    document.getElementById("home-button").addEventListener("click", () => {
        window.location.hash = "HOME";
    });
});