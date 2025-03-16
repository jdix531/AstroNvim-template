require("lazy").setup({
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    version = "^5.0.0", -- pin major version, include fixes and features that do not have breaking changes
    config = function() require("kitty-scrollback").setup() end,
  },
  {
    "AstroNvim/AstroNvim",
    version = "^5", -- Remove version tracking to elect for nightly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { import = "plugins" },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function() require("venv-selector").setup() end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },

  {
    "https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
    enabled = true,
    -- Activate when a file is created/opened
    event = { "BufReadPre", "BufNewFile" },
    -- Activate when a supported filetype is open
    ft = { "go", "javascript", "python", "ruby", "cs", "lua" },
    cond = function()
      -- Only activate if token is present in environment variable.
      -- Remove this line to use the interactive workflow.
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
    end,
    opts = {
      gitlab_url = "https://gitlab.com",
      statusline = {
        enabled = true,
      },
      resource_editing = {
        enabled = false,
      },
      minimal_message_level = 0,
      code_suggestions = {
        auto_filetypes = {
          "c", -- C
          "cpp", -- C++
          "csharp", -- C#
          "go", -- Golang
          "java", -- Java
          "javascript", -- JavaScript
          "javascriptreact", -- JavaScript React
          "kotlin", -- Kotlin
          "markdown", -- Markdown
          "objective-c", -- Objective-C
          "objective-cpp", -- Objective-C++
          "php", -- PHP
          "python", -- Python
          "ruby", -- Ruby
          "rust", -- Rust
          "scala", -- Scala
          "sql", -- SQL
          "swift", -- Swift
          "terraform", -- Terraform
          "typescript", -- TypeScript
          "typescriptreact", -- TypeScript React
          "sh", -- Shell scripts
          "html", -- HTML
          "css", -- CSS
        },
        enabled = true,
        fix_newlines = true,
        lsp_binary_path = "node",
        offset_encoding = "utf-16",
        redact_secrets = true,
      },
      language_server = {
        workspace_settings = {
          codeCompletion = {
            enableSecretRedaction = true,
          },
          telemetry = {
            enabled = false,
            trackingUrl = nil,
          },
        },
      },
    },
  },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
