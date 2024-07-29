local map = vim.keymap.set

-- key mappings
map('n', '<LocalLeader>r', ':MagmaEvaluateOperator<CR>', { silent = true, expr = true})
map('n', '<LocalLeader>rr', ':MagmaEvaluateLine<CR>', { silent = true })
map('x', '<LocalLeader>r', ':<C-u>MagmaEvaluateVisual<CR>', { silent = true })
map('n', '<LocalLeader>rc', ':MagmaReevaluateCell<CR>', { silent = true })
map('n', '<LocalLeader>rd', ':MagmaDelete<CR>', { silent = true })
map('n', '<LocalLeader>ro', ':MagmaShowOutput<CR>', { silent = true })

-- Options
vim.g.magma_automatically_open_output = false
vim.g.magma_image_provider = "ueberzug"
