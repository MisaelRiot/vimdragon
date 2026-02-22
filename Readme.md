# 🐉 Vimdragon - Neovim 0.12 (Edición 2026)

Vimdragon es una configuración de Neovim ultrarrápida y modular, diseñada bajo una filosofía de **"Carga Perezosa" (Lazy Loading) estricta**. Ofrece la experiencia de un IDE completo y moderno sin el consumo excesivo de memoria, permitiéndote volar entre archivos, errores y despliegues.

Está especialmente optimizada para el desarrollo de microservicios, APIs y frameworks pesados, con soporte nativo y configuraciones específicas para **Python (FastAPI/Django), PHP (CakePHP), JavaScript/TypeScript** y **Lua**.

## 🔥 Filosofía del Sistema

* **100% Nativo:** Utiliza la API moderna `vim.lsp.config` de Neovim 0.12, eliminando la dependencia del framework legacy `nvim-lspconfig`.
* **Velocidad Basada en Rust:** Delega el trabajo pesado a binarios compilados en Rust (`ripgrep`, `ruff`, `blink.cmp`) para búsquedas y autocompletado en milisegundos.
* **Single Source of Truth:** Los LSPs y Formateadores se gestionan desde diccionarios de datos centralizados (`core/servers.lua` y `core/formatters.lua`).
* **UI No Bloqueante:** Toda la interacción de red y terminal (Git, GitHub PRs, descargas de Mason) se ejecuta de forma asíncrona usando `plenary.nvim`.
* **Estética Limpia:** Fondo transparente, bordes redondeados integrados y soporte nativo para temas modernos (Catppuccin/Nordic) intercambiables al vuelo con `fzf-lua`.

## 🧩 Plugins y Herramientas

Esta configuración integra un ecosistema de 18 plugins de alta performance:

*   **Autocompletado y LSP:**
    *   `blink.cmp`: Motor de autocompletado ultrarrápido basado en Rust.
    *   `nvim-lspconfig`: Configuración centralizada de servidores LSP (Pyright, Vtsls, Intelephense, Lua_ls).
    *   `conform.nvim`: Formateo de código asíncrono y flexible.
    *   `nvim-treesitter`: Resaltado de sintaxis avanzado e indentación inteligente.

*   **Interfaz y Estética:**
    *   `nordic.nvim`: Tema principal (con soporte para transparencia).
    *   `lualine.nvim`: Barra de estado elegante y altamente personalizable.
    *   `nvim-tree.lua`: Explorador de archivos en sidebar.
    *   `noice.nvim`: Rediseño de la interfaz de mensajes, cmdline y popups de LSP.
    *   `nvim-ufo`: Fold moderno y visual de bloques de código usando LSP.

*   **Búsqueda y Navegación:**
    *   `fzf-lua`: Buscador difuso de alto rendimiento para archivos, texto y comandos.
    *   `which-key.nvim`: Asistente visual de atajos de teclado.

*   **Control de Versiones (Git):**
    *   `vim-fugitive`: Interfaz completa para comandos de Git.
    *   `gitsigns.nvim`: Marcas de cambios de Git en la columna de signos y navegación de hunks.
    *   `diffview.nvim`: Visor avanzado de diferencias e historial de archivos.
    *   `octo.nvim`: Integración con GitHub para gestionar PRs e Issues.

*   **Inteligencia Artificial (IA):**
    *   `opencode.nvim`: Cliente de chat IA que usa la herramienta `opencode` CLI para sugerencias y generación de código.

*   **Productividad:**
    *   `nvim-autopairs`: Cierre automático de paréntesis, corchetes y comillas.
    *   `nvim-surround`: Manipulación rápida de caracteres envolventes (paréntesis, comillas, tags).

*   **Tema y Extras:**
    *   `themes.lua`: Incluye soporte para cambiar entre múltiples temas (Catppuccin, Nightfox, Tokyonight, Rose-pine).

## 🛠️ Dependencias del Sistema

Vimdragon está construido sobre binarios modernos para garantizar velocidad. Asegúrate de instalar estas herramientas en tu sistema operativo antes de usar la configuración.

### 1. Requisitos Base

*   **Neovim:** Versión `>= 0.12.0` (recomendado compilar desde la rama `nightly`/`master`).
*   **Nerd Font:** Recomendado `JetBrainsMono Nerd Font` (necesaria para los iconos en Lualine, Nvim-tree y FZF).
*   **Git:** Para control de versiones y la descarga inicial de plugins.

### 2. Motores de Búsqueda y Compilación (Críticos)

*   **Rust / Cargo:** Requerido para compilar `blink.cmp` y maximizar la velocidad de autocompletado.
    *   **Instalación (Todas las distros):** `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

*   **Fzf:** El binario del buscador difuso en terminal.
    *   **Ubuntu/Debian:** `sudo apt install fzf`
    *   **Arch Linux:** `sudo pacman -S fzf`

*   **Ripgrep (`rg`):** Motor de búsqueda de texto ultrarrápido (ignora `.gitignore` por defecto).
    *   **Ubuntu/Debian:** `sudo apt install ripgrep`
    *   **Arch Linux:** `sudo pacman -S ripgrep`

### 3. Entornos de Ejecución y Herramientas Mason

*   **Node.js y npm:** Requeridos por Mason para instalar servidores LSP basados en TypeScript/JavaScript (como `vtsls`).
    *   **Ubuntu/Debian:** `sudo apt install nodejs npm`
    *   **Arch Linux:** `sudo pacman -S nodejs npm`

*   **Python Venv & Pip:** Mason necesita crear entornos virtuales para instalar herramientas como `ruff`. Si tu SO usa un Python "recortado", instala estos módulos.
    *   **Ubuntu/Debian:** `sudo apt install python3-venv python3-pip`
    *   **Arch Linux:** `sudo pacman -S python-pip`

### 4. Herramientas Opcionales pero Recomendadas

*   **GitHub CLI (`gh`):** Necesario para usar `octo.nvim` y gestionar Pull Requests.
    *   **Ubuntu/Debian:** `sudo apt install gh`
    *   **Arch Linux:** `sudo pacman -S github-cli`
    *   **Autenticación:** Ejecutar `gh auth login` después de instalar.

*   **OpenCode CLI:** Necesario para el plugin `opencode.nvim`. Asegúrate de tener el binario `opencode` en tu PATH.
    *   Consulta la documentación oficial de [opencode](https://github.com/sst/opencode) para las instrucciones de instalación más recientes.



## 📂 Estructura de Directorios Clave

*   `lua/core/`: Configuraciones centrales de Neovim.
    *   `options.lua`: Opciones globales de editor (indentación, búsqueda, etc.).
    *   `keymaps.lua`: Atajos de teclado personalizados y globales.
    *   `formatters.lua`: Diccionario centralizado que mapea tipos de archivo a formateadores.
    *   `autocmds.lua`: Comandos automáticos (autocomandos) para eventos de Neovim.
*   `lua/plugins/`: Declaraciones de plugins usando `lazy.nvim`. Cada archivo corresponde a una funcionalidad o familia de plugins.
    *   Ejemplo: `lsp.lua`, `fuzzy-finder.lua`, `git.lua`, `opencode.lua`, etc.
*   `init.lua`: Punto de entrada principal que carga el gestor de plugins `lazy.nvim` e importa los módulos del directorio `lua/`.

---
**Vimdragon** - Configuración creada y mantenida para maximizar la velocidad y el flujo de trabajo en el desarrollo de software moderno.

