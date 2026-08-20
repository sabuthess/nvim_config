return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  enabled = false,
  opts = {
    filetypes = { "css", "scss", "html", "javascript", "typescriptreact", "javascriptreact" },
    user_default_options = {
      tailwind = true, -- esto activa el soporte de clases de Tailwind
    },
  },
}
