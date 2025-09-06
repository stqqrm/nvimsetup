local nvim_lsp = vim.lsp

-- Setup function for clangd
local function setup_clangd()
  nvim_lsp.start({
    name = "clangd",
    cmd = { "clangd", "--background-index" }, -- command and arguments
    root_dir = nvim_lsp.util.root_pattern("compile_commands.json", ".git"),
    filetypes = { "c", "cpp", "objc", "objcpp" },
    -- Optional: add callbacks
    on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- Example keymaps for LSP functions:
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)
    end,
  })
end

-- Start the server
setup_clangd()
