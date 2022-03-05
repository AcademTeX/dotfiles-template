local utils = require('utils') 

-- UltiSnips plugin provides hands down the best snippet engine
-- Reference: https://github.com/SirVer/ultisnips
vim.g.UltiSnipsSnippetDirectories={"UltiSnips", "snips"}

-- Configure nvim-cmp and lspconfig with UltiSnips
-- References: https://github.com/neovim/nvim-lspconfig
-- Define borders for lsp windows
local borders = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- Set borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = borders })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = borders })
configure('lspconfig', function(lspconfig)
  -- on_attach function
  -- This function creates mappings that execute the language server default capabilities but only 
  -- on buffers where the language server is active and available (e.g. to avoid errors) 
  local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)


    if client.resolved_capabilities.document_formatting then 
      vim.cmd [[ 
        augroup LSP_FORMAT
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 5000)
        augroup END
      ]]
    end
  end

  -- Add capabilities for snippets, and other standard capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
      },
  }

  local servers = {
    'pyright',
    'tsserver',
    'eslint',
    'texlab', 
  }
  for _, lsp in ipairs(servers) do 
    lspconfig[lsp].setup{
      on_attach = on_attach,
      capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
      flags = { debounce_text_changes = 500 },
    }
  end
end)

-- cmp plugin provides autocompletition with integration for various sources, including snippets
-- References: https://github.com/hrsh7th/nvim-cmp 
--             https://github.com/quangnguyen30192/cmp-nvim-ultisnips
configure('cmp', function(cmp)
  local cmp_ultisnip_mappings = require("cmp_nvim_ultisnips.mappings")
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          cmp_ultisnip_mappings.expand_or_jump_forwards(fallback)
        end,
        { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(
        function(fallback)
          cmp_ultisnip_mappings.jump_backwards(fallback)
        end,
        { "i", "s"}),
    },
    sources = cmp.config.sources({
      { name = "ultisnips" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    }),
  }
end) 
