local M = {}
local variant_overrides = {
	dark = {
		bg = "NONE",
		line = "#NONE",
	},
	moss = {
		bg = "#090d0e",
		line = "#151d1e",
	},
}
local function variant_for(name)
	if name == "koda-dark" then
		return "dark"
	end
	if name == "koda-moss" then
		return "moss"
	end
	if name == "koda" then
		return vim.o.background == "light" and "light" or "dark"
	end
	if name == "koda-light" then
		return "light"
	end
	if name == "koda-glade" then
		return "glade"
	end
	return nil
end
function M.setup(name)
	local variant = variant_for(name)
	if not variant then
		return
	end
	require("koda").setup({
		colors = variant_overrides[variant] or {},
		on_highlights = function(hl, c)
			hl.TabLineSel = { fg = c.bg, bg = "NONE", bold = true }
			hl.TabLine = { fg = c.muted, bg = "NONE"}
			hl.TabLineFill = { bg = "NONE" }
		end,
	})
end
return M
