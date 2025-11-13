if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      coreclr = function(source_name)
        local dap = require "dap"
        dap.adapters.coreclr = {
          type = "executable",
          command = "/Users/joshdix/.local/share/nvs/AstroNvim/mason/bin/netcoredbg",
          args = { "--interpreter=vscode" },
        }
        dap.configurations.cs = {
          {
            type = "coreclr",
            name = "launch - netcoredbg",
            request = "launch",
            program = function() return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net9.0/", "file") end,
          },
        }
      end,
    },
  },
}
