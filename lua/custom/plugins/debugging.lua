local rust_tools_config = {
	-- Points to mason's codelldb
	dap = function()
		local install_root_dir = vim.fn.stdpath "data" .. "/mason"
		local extension_path = install_root_dir .. "/packages/codelldb/extension/"
		local codelldb_path = extension_path .. "adapter/codelldb"
		local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

		return {
			adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
		}
	end,
}

local mason_lspconfig_handlers = {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have a dedicated handler.
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,

	["rust_analyzer"] = function()
		require("rust-tools").setup({
			-- rust_tools specific settings
			tools = rust_tools_config,
		})
	end,
}

return {
	'williamboman/mason-lspconfig.nvim',
	opts = { handlers = mason_lspconfig_handlers },
	dependencies = {
		'simrat39/rust-tools.nvim',
	}
}
