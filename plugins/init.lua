
local M = {}

M.dap = {
  config = function()
    local dap = require "dap"

    dap.adapters.dart = {
      type = "executable",
      command = "dart",
      args = { "debug_adapter" },
    }
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Dart Program",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }
  end,
}

M.focus = {
  config = function()
    require("focus").setup()
  end,
}

M.flutterTools = {
  config = function()
    require("flutter-tools").setup {
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          app_version = false,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "ErrorMsg",
        prefix = "//",
        enabled = true,
      },
      lsp = {
        color = {
          enabled = false,
          background = false,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          enableSnippets = true,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = false,
      },
      -- dev_log = {
      --   enabled = true,
      --   open_cmd = "tabedit", -- command to use to open the log buffer
      -- },
    }
  end,
}

M.lspconfig = {
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.plugins.lspconfig"
  end,
}

-- M.lspInstaller = {
--   config = function()
--     require("nvim-lsp-installer").setup{
--       automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--       ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--       }
--     }
--   end
-- }

return {
  ["akinsho/flutter-tools.nvim"] = M.flutterTools,
  ["mfussenegger/nvim-dap"] = M.dap,
  ["beauwilliams/focus.nvim"] = M.focus,
  ["dart-lang/dart-vim-plugin"] = {},
  ["williamboman/nvim-lsp-installer"] = M.lspInstaller,
  ["neovim/nvim-lspconfig"] = M.lspconfig,
}


