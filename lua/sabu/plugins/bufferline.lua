return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local bufferline = require("bufferline")

		local function hl(name)
			return vim.api.nvim_get_hl(0, { name = name, link = false })
		end

		local function fg_or_nil(group)
			local value = hl(group)
			return value and value.fg or nil
		end

		local function sync_fill_highlight()
			local tabline_fill = hl("TabLineFill")
			local tabline = hl("TabLine")
			local normal = hl("Normal")
			local fill_bg = (tabline_fill and tabline_fill.bg) or (tabline and tabline.bg) or (normal and normal.bg)
			if fill_bg then
				vim.api.nvim_set_hl(0, "BufferLineFill", { bg = fill_bg })
			end
		end

		local function sync_tab_highlights()
			local base_fg = fg_or_nil("Normal") or "#ffffff"

			vim.api.nvim_set_hl(0, "BufferLineBufferSelected", {
				fg = "#ffffff",
				bg = "NONE",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "BufferLineDuplicate", {
				bg = "NONE",
				fg = base_fg,
			})
			vim.api.nvim_set_hl(0, "BufferLineDuplicateVisible", {
				bg = "NONE",
				fg = base_fg,
			})
			vim.api.nvim_set_hl(0, "BufferLineDuplicateSelected", {
				bg = "NONE",
				fg = "#ffffff",
				bold = true,
			})
			vim.api.nvim_set_hl(0, "BufferLineModified", {
				bg = "NONE",
				fg = fg_or_nil("DiagnosticWarn") or base_fg,
			})
			vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", {
				bg = "NONE",
				fg = fg_or_nil("DiagnosticWarn") or base_fg,
			})
			vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", {
				bg = "NONE",
				fg = "NONE",
			})
			-- Separadores transparentes
			vim.api.nvim_set_hl(0, "BufferLineSeparator", {
				bg = "NONE",
				fg = "NONE",
			})
			vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", {
				bg = "NONE",
				fg = "NONE",
			})
			vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", {
				bg = "NONE",
				fg = "NONE",
			})
			vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", {
				bg = "NONE",
				fg = "NONE",
			})
		end

		local function sync_devicon_highlights()
			local all_hl = vim.api.nvim_get_hl(0, {})
			for name, _ in pairs(all_hl) do
				if name:match("^BufferLineDevIcon") then
					local icon_hl = hl(name)
					if icon_hl then
						icon_hl.bg = nil
						icon_hl.ctermbg = nil
						vim.api.nvim_set_hl(0, name, icon_hl)
					end
				end
			end
		end

		local options = {
			options = {
				mode = "buffers",
				separator_style = "thin",
				always_show_bufferline = true,
				sort_by = "insert_after_current",
				diagnostics = false,
				modified_icon = "",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		}

		bufferline.setup(options)
		sync_fill_highlight()
		sync_tab_highlights()
		sync_devicon_highlights()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("SalarBufferlineThemeSync", { clear = true }),
			callback = function()
				bufferline.setup(options)
				sync_fill_highlight()
				sync_tab_highlights()
				sync_devicon_highlights()
			end,
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>h", ":BufferLineMovePrev<CR>", { silent = true, desc = "Move buffer left" })
		vim.keymap.set("n", "<leader>l", ":BufferLineMoveNext<CR>", { silent = true, desc = "Move buffer right" })
	end,
}
