return {
	on_init = function(client)
		-- Ejecuta 'pyenv which python' para obtener la ruta real del binario
		local handle = io.popen("pyenv which python 2>/dev/null")
		local py_path = handle:read("*a"):gsub("%s+", "")
		handle:close()

		if py_path ~= "" then
			client.config.settings.python.pythonPath = py_path
			-- Notificar al servidor que la configuración ha cambiado
			client.notify("workspace/didChangeConfiguration", {
				settings = client.config.settings,
			})
		end
	end,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				-- Esto ayuda a Pyright a indexar paquetes de terceros en pyenv
				diagnosticMode = "workspace",
			},
		},
	},
}
