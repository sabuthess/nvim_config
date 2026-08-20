return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "css", "scss", "html", "javascript", "typescriptreact", "javascriptreact" },
    user_default_options = {
      tailwind = true, -- esto activa el soporte de clases de Tailwind
    },
  },
}
