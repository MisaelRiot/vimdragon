-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
	"windwp/nvim-autopairs",
	-- Lazy-load: It ONLY loads the exact millisecond you press 'i' to enter Insert Mode
	event = "InsertEnter",
	opts = {
		check_ts = true, -- Tell it to use Treesitter to check context
		-- Prevents auto-pairing if the next character is alphanumeric
		ignored_next_char = "[%w%.]",
	},
}
