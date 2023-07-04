-- Computes the maximum fold level in the file
local function max_fold_level()
	local last_line = vim.fn.line("$")
	local max_lvl = 0
	for i = 1, last_line do
		max_lvl = math.max(max_lvl, vim.fn.foldlevel(i))
	end
	return max_lvl
end

-- See https://www.jmaguire.tech/posts/treesitter_folding/
local configure_folds = function()
	vim.wo.foldmethod = "expr"
	vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
	vim.wo.foldenable = true
	vim.wo.foldminlines = 5
	vim.wo.foldlevel = max_fold_level()
end
configure_folds() -- We call it once, because the augroup doesn't run on the first ever window.

local fold_group = vim.api.nvim_create_augroup("thebutlah.FoldSettings", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = fold_group,
	pattern = "*",
	callback = configure_folds,
})
