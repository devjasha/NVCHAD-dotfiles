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

M.autotag = {
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}

M.lspconfig = {
  override_options = function ()
    local lspconfig = require("lspconfig")

      lspconfig.tsserver.setup {
        on_attach = M.on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.js" },
        cmd = { "typescript-language-server", "--stdio" },
        capabilities = M.capabilities
      }

      lspconfig.tailwindcss.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities
      }

      lspconfig.cssls.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities
      }
  end,
}

return {
  ["akinsho/flutter-tools.nvim"] = M.flutterTools,
  ["mfussenegger/nvim-dap"] = M.dap,
  ["beauwilliams/focus.nvim"] = M.focus,
  ["dart-lang/dart-vim-plugin"] = {},
  ["windwp/nvim-ts-autotag"] = M.autotag,
  ["windwp/nvim-autopairs"] = {},
  ["neovim/nvim-lspconfig"] = M.lspconfig,
}


