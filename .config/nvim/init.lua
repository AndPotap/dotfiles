require("ap.maps")
require("ap.autocmd")
require("ap.lazy")
require("ap.lsp")
require("ap.cmp")
require("ap.tree")
require("ap.teles")
require("ap.status")
require("ap.signature")
require("ap.slime")
require("ap.snippets")

vim.diagnostic.config({
  virtual_text = true,  -- Inline error text
  signs = true,         -- Gutter signs
  underline = true,     -- Underline errors
  update_in_insert = false,
})
