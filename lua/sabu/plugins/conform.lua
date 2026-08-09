return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}
