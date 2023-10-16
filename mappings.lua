-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    U = { "<C-r>", desc = "Redo" },

    ["<leader>gR"] = require("astronvim.utils").is_available "gitsigns.nvim" and {
      function() require("gitsigns").reset_buffer() end,
      desc = "Reset Git buffer",
    } or nil,

    ["<leader>gr"] = require("astronvim.utils").is_available "gitsigns.nvim" and {
      function() require("gitsigns").reset_hunk() end,
      desc = "Reset Git hunk",
    } or nil,
    ["<leader>gh"] = false,

    ["<leader><leader>"] = {
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      desc = "Find files",
    },
    ["<leader><cr>"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find history" },
    ["<leader>fR"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" },
    ["<leader>/"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["<leader>fg"] = {
      function()
        require("telescope.builtin").live_grep {
          additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
        }
      end,
      desc = "Find words in all files",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>fo"] = false,
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
