return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "codeium", priority = 700 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
    },
  },
}
