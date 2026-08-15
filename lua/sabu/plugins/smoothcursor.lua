return {
  "gen740/SmoothCursor.nvim",
  event = "VeryLazy",
  config = function()
    require("smoothcursor").setup({
      type = "default", -- "default" | "fade" | "matrix" | "railgun" | "pipe" | "rainbow"
      cursor = "❤", -- símbolo del cursor animado
      texthl = "SmoothCursor", -- grupo de resaltado
      linehl = nil, -- puedes poner algo como "CursorLine" para resaltar la línea
      fancy = {
        enable = true, -- efecto de "cola" al moverse
        head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
        body = {
          { cursor = "󰝥", texthl = "SmoothCursorRed" },
          { cursor = "󰝥", texthl = "SmoothCursorOrange" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" },
      },
      speed = 25, -- velocidad de la animación (más alto = más rápido)
      intervals = 35, -- fluidez de la animación
      priority = 10,
      timeout = 3000,
      threshold = 3,
      disable_float_win = false,
      enabled_filetypes = nil, -- restringir a ciertos filetypes si quieres
      disabled_filetypes = { "TelescopePrompt", "NvimTree" },
    })
  end,
}
