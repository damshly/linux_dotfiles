-- File: lua/plugins/lsp_raw.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvimdev/lspsaga.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Custom handler to filter out imports and go to SOURCE code
      local function filter_definition_handler(err, result, ctx, config)
        if err then return vim.lsp.handlers["textDocument/definition"](err, result, ctx, config) end
        if not result or vim.tbl_isempty(result) then return end

        -- Filter logic: If there are multiple results, exclude the current file (the import)
        if vim.tbl_islist(result) and #result > 1 then
          local current_buf_uri = vim.uri_from_bufnr(ctx.bufnr)
          local filtered = {}
          for _, res in ipairs(result) do
            if res.uri ~= current_buf_uri then
              table.insert(filtered, res)
            end
          end
          if #filtered > 0 then result = filtered end
        end
        
        -- Use Lspsaga to open the filtered result
        vim.lsp.handlers["textDocument/definition"](err, result, ctx, config)
      end

      -- Apply the custom handler globally for definitions
      vim.lsp.handlers["textDocument/definition"] = filter_definition_handler

      -- Setup vtsls with auto-import
      lspconfig.vtsls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local keymap = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    -- Forced Mapping: Go to definition using the filtered handler
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    
    -- Lspsaga Peek (as a backup)
    vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
  end,
  settings = {
    typescript = {
      preferences = { preferSourceFiles = true },
      suggest = { autoImports = true },
      parameterNames = { enabled = "all" },
      parameterTypes = { enabled = true },
      variableTypes = { enabled = true },
      propertyDeclarationTypes = { enabled = true },
      functionLikeReturnTypes = { enabled = true },
    enumMemberValues = { enabled = true },
    },
  },
})    end,
  },
}
