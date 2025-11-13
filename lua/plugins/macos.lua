if vim.uv.os_uname().sysname == "Darwin" then
  return {
    {
      "Cliffback/netcoredbg-macOS-arm64.nvim",
      dependencies = { "mfussenegger/nvim-dap" },
    },
  }
  -- elseif sysname == "Linux" then
  --   -- Code specific to Linux
  --   print("Running on Linux")
else
  return {}
end
