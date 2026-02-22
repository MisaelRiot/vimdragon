# 🚀 Neovim 0.12 - Arquitectura Modular (Edición 2026)

Esta es una configuración de Neovim ultrarrápida, construida con una filosofía de **"Carga Perezosa" (Lazy Loading) estricta** y separación atómica de responsabilidades. Está diseñada para no estorbar y ofrecer la experiencia de un IDE moderno sin el consumo excesivo de memoria.

Especialmente optimizada para el desarrollo de microservicios, APIs y frameworks pesados, con soporte nativo y configuraciones específicas listas para **Go (Golang), Python (FastAPI/Django) y PHP (CakePHP)**.

## 🧠 Filosofía del Sistema

* **100% Nativo:** Utiliza la API moderna `vim.lsp.config` de Neovim 0.12, eliminando la dependencia del framework legacy `nvim-lspconfig`.
* **Velocidad Basada en Rust:** Delega el trabajo pesado a binarios compilados en Rust (`ripgrep`, `ruff`, `blink.cmp`) para búsquedas y autocompletado en milisegundos.
* **Single Source of Truth:** Los LSPs y Formateadores se gestionan desde diccionarios de datos centralizados (`core/servers.lua` y `core/formatters.lua`).
* **UI No Bloqueante:** Toda la interacción de red y terminal (Git, GitHub PRs, descargas de Mason) se ejecuta de forma asíncrona usando `plenary.nvim`.
* **Estética Limpia:** Fondo transparente, bordes redondeados integrados y soporte nativo para temas modernos (Catppuccin/Nordic) intercambiables al vuelo con `fzf-lua`.

## 🛠️ Dependencias del Sistema (Requisitos Previos)

Para que todos los motores externos funcionen correctamente en tu entorno Linux/WSL, asegúrate de tener instalados los siguientes paquetes a nivel de sistema operativo *antes* de abrir Neovim.

### 1. Herramientas Base

* **Neovim:** Versión `>= 0.12.0` (o compilado desde la rama `nightly`/`master`).
* **Nerd Font:** Recomendado `JetBrainsMono Nerd Font` (necesaria para los iconos de UI, Lualine y Nvim-tree).
* **Git:** Para el control de versiones y descarga de plugins.
* **Node.js y npm:** Requerido por Mason para instalar servidores LSP basados en TypeScript/JavaScript (como `vtsls`, `prettier`).

### 2. Motores de Búsqueda y Compilación

* **Rust / Cargo:** Estrictamente necesario para compilar el motor de búsqueda difusa de `blink.cmp` directamente en tu máquina.
* *Instalación:* `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`


* **Fzf:** El binario del buscador difuso en terminal.
* *Instalación (Debian/Kali):* `sudo apt install fzf`
* *Instalación (Arch):* `sudo pacman -S fzf`


* **Ripgrep (`rg`):** Motor de búsqueda de texto ultrarrápido (ignora `.gitignore` por defecto).
* *Instalación (Debian/Kali):* `sudo apt install ripgrep`
* *Instalación (Arch):* `sudo pacman -S ripgrep`



### 3. Entornos Virtuales (Para Mason)

* **Python Venv & Pip:** Mason necesita crear entornos virtuales aislados para instalar herramientas como `ruff`. Si tu SO usa un Python "recortado", debes instalar estos módulos.
* *Instalación (Debian/Kali):* `sudo apt install python3-venv python3-pip`



### 4. Integración con GitHub (Octo.nvim)

* **GitHub CLI (`gh`):** Necesario para listar, buscar y hacer Code Reviews de Pull Requests directamente en el editor.
* *Instalación (Debian/Kali):* `sudo apt install gh`
* *Instalación (Arch):* `sudo pacman -S github-cli`
* *Autenticación:* Ejecutar `gh auth login` y seguir los pasos en la terminal.



## 📂 Estructura de Directorios Clave

* `lua/core/`: Diccionarios de datos base (atajos globales, listas de LSPs, mapa de formateadores).
* `lua/plugins/`: Declaraciones de plugins usando `lazy.nvim` estrictamente bajo el patrón `opts`.
* `lsp/`: Archivos atómicos de configuración nativa por cada servidor (ej. `intelephense.lua`, `pyright.lua`).

