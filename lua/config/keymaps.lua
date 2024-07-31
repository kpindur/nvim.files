local map = vim.keymap.set

local Maps = {}

Maps.init = function()
  local telescope = require('telescope.builtin')
  local trouble = require('trouble')

  map('n', ']q', ':cnext<CR>', { desc = "Next quickfix" })
  map('n', '[q', ':cprevious<CR>', { desc = "Prev quickfix" })
  map('n', ']Q', ':clast<CR>', { desc = "Last quickfix" })
  map('n', '[Q', ':cfirst<CR>', { desc = "First quickfix" })

  map('n', ']l', ':lnext<CR>', { desc = "Next loclist" })
  map('n', '[l', ':lprevious<CR>', { desc = "Prev loclist" })
  map('n', ']L', ':llast<CR>', { desc = "Last loclist" })
  map('n', '[L', ':lfirst<CR>', { desc = "First loclist" })

  -- map('t', '<Esc>', "<C-\\><C-n>")

  map('n', '<leader>d', ':Neotree toggle=true<CR>', { desc = "Neotree" })
  map('n', '<leader>t', ':Trouble diagnostics toggle<CR>', { desc = "Diagnostics" })

  map('n', '<leader>es', ':e ~/workspaces/other/org/scratch.dat<CR>', { desc = "Scratch" })
  map('n', '<leader>ej', ':e ~/workspaces/other/org/journal.dat<CR>', { desc = "Journal" })
  map('n', '<leader>eg', ':e ~/workspaces/other/org/goals.dat<CR>', { desc = "Goals" })
  map('n', '<leader>eh', ':e ~/workspaces/other/org/habits.dat<CR>', { desc = "Habits" })

  map('n', 'gs', ':Neogit<CR>', { desc = "Git status" })
  map('n', 'gb', function() telescope.git_branches() end,{ silent = true, desc = "Git branches" })

  map('n', '<leader>ff', function() telescope.find_files() end, { silent = true, desc = "Find files" })
  map('n', '<leader>fg', function() telescope.live_grep() end, { silent = true, desc = "Find in files" })
  map('n', '<leader>fb', function() telescope.buffers() end, { silent = true, desc = "Buffers" })
  map('n', '<leader>fh', function() telescope.help_tags() end, { silent = true, desc = "Help tags" })
  map('n', '<leader>fo', function() telescope.oldfiles() end, { silent = true, desc = "Old files" })

  -- map('n', '<leader>rW', '<cmd>SearchReplaceSingleBufferCWORD<CR>', { desc = "Replace CWORD" })
  -- map('v', '<leader>rS', '<cmd>SearchReplaceSingleBufferCExpr<CR>', { desc = "Replace selection" })

  map('n', ']t', function() trouble.next({ skip_groups = true, jump = true }) end, { silent = true, desc = "Next trouble" })
  map('n', '[t', function() trouble.prev({ skip_groups = true, jump = true }) end, { silent = true, desc = "Previous trouble" })
  map('n', ']T', function() trouble.last({ skip_groups = true, jump = true }) end, { silent = true, desc = "Last trouble" })
  map('n', '[T', function() trouble.first({ skip_groups = true, jump = true }) end, { silent = true, desc = "First trouble" })

  map('n', '<leader>w', ":Trouble symbols toggle<CR>", { silent = true, buffer, desc = "Document symbols" })
end

Maps.neotest = function(buffer)
  local neotest = require('neotest')

  map('n', '<leader>x', function() neotest.run.run() end, { buffer = buffer, desc = "Neotest run test at cursor" })
  map('n', '<leader>X', function() neotest.run.run(vim.fn.expand("%")) end, { buffer = buffer, desc = "Neotest run test in a file" })
  map('n', '<leader>m', function() neotest.run.run(vim.loop.cwd()) end, { buffer = buffer, desc = "Neotest run tests in workspace" })

  map('n', '<leader>n', function() neotest.output_panel.toggle() end, { buffer = buffer, desc = "Neotest toggle panel tab" })
  map('n', '<leader>N', function() neotest.summary.toggle() end, { buffer = buffer, desc = "Neotest toggle summary tab" })
end

Maps.lsp_buf = function(_, buffer)
  local lsp_buf = vim.lsp.buf

  map('n', '<localleader>gd', lsp_buf.declaration, { silent = true, buffer = buffer, desc = "Declaration" })
  map('n', '<localleader>gD', lsp_buf.definition, { silent = true, buffer = buffer, desc = "Definition" })
  map('n', '<localleader>gr', lsp_buf.references, { silent = true, buffer = buffer, desc = "References" })
  map('n', '<localleader>gi', lsp_buf.implementation, {silent = true, buffer = buffer, desc = "Implementation" })
  map('n', '<localleader>gt', lsp_buf.type_definition, {silent = true, buffer = buffer, desc = "Type definition" })
  map('n', '<localleader>gh', lsp_buf.hover, { silent = true, buffer = buffer, desc = "Hover" })
  map('n', '<localleader>gs', lsp_buf.signature_help, { silent = true, buffer = buffer, desc = "Signature help" })
  map('n', '<localleader>gx', lsp_buf.code_action, { silent = true, buffer = buffer, desc = "Code action" })
  map('n', '<localleader>gR', lsp_buf.rename, { silent = true, buffer = buffer, desc = "Rename" })
end

Maps.gitsigns = function(buffer)
  local gitsigns = package.loaded.gitsigns

  map('n', ']h', gitsigns.next_hunk, { silent = true, buffer = buffer, desc = "Next hunk" })
  map('n', '[h', gitsigns.prev_hunk, { silent = true, buffer = buffer, desc = "Previous hunk" })
  map('n', '<leader>hs', gitsigns.stage_hunk, { silent = true, buffer = buffer, desc = "Stage hunk" })
  map('n', '<leader>hr', gitsigns.reset_hunk, { silent = true, buffer = buffer, desc = "Reset hunk" })

  map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { silent = true, buffer = buffer, desc = "Stage hunk" })
  map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { silent = true, buffer = buffer, desc = "Reset hunk" })
  map('v', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, { silent = true, buffer = buffer, desc = "Blame hunk" })
end

return Maps
