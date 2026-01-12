return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        ["P"] = { "toggle_preview", config = { use_float = true } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      git_status = {
        symbols = {
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "󰁯",
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        },
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
  },
  keys = {
    { "<leader>e", false }, -- تعطيل الاختصار الافتراضي
    {
      "<leader>e",
      function()
        local manager = require("neo-tree.sources.manager")
        local renderer = require("neo-tree.ui.renderer")
        local state = manager.get_state("filesystem")
        if renderer.window_exists(state) then
          local current_win = vim.api.nvim_get_current_win()
          local neo_tree_win = state.winid
          if current_win == neo_tree_win then
            vim.cmd("wincmd p")
          else
            vim.cmd("Neotree focus")
          end
        else
          vim.cmd("Neotree show")
        end
      end,
      desc = "Explorer Focus Toggle",
    },
    {
      "<C-e>",
      "<cmd>Neotree close<cr>",
      desc = "Close Explorer",
    },
  },
}
