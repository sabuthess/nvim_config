return {

{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
},


{
  "williamboman/mason-lspconfig.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
  },

config = function()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "ts_ls",
      "eslint",
    },
  })

  -- Nueva forma (sin require("lspconfig"))
  vim.lsp.config("ts_ls", {})
  vim.lsp.enable("ts_ls")

  vim.lsp.config("eslint", {})
  vim.lsp.enable("eslint")
end
}

}
