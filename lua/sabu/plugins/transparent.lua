return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      extra_groups = {
        "NormalFloat",
        "NvimTreeNormal",
        "NeoTreeNormal",
        "TelescopeNormal",
        "TelescopeBorder",
        "WhichKeyFloat",
      },
      exclude_groups = {},
    })
  end,
}
