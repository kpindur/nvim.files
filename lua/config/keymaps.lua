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

  map('n', ']t', function() trouble.next({ skip_groups = true, jump = true }) end, { silent = true, desc = "Next trouble" })
  map('n', '[t', function() trouble.prev({ skip_groups = true, jump = true }) end, { silent = true, desc = "Previous trouble" })
  map('n', ']T', function() trouble.last({ skip_groups = true, jump = true }) end, { silent = true, desc = "Last trouble" })
  map('n', '[T', function() trouble.first({ skip_groups = true, jump = true }) end, { silent = true, desc = "First trouble" })

  map('n', '<leader>w', ":Trouble symbols toggle<CR>", { silent = true, buffer, desc = "Document symbols" })
end

Maps.neotest = function(buffer)
  local neotest = require('neotest')

  map('n', '<leader>nr', function() neotest.run.run() end, { buffer = buffer, desc = "[n]eotest [r]un test at cursor" })
  map('n', '<leader>nR', function() neotest.run.run(vim.fn.expand("%")) end, { buffer = buffer, desc = "[n]eotest [R]un tests in a file" })
  map('n', '<leader>NR', function() neotest.run.run(vim.loop.cwd()) end, { buffer = buffer, desc = "[N]eotest [R]un tests in workspace" })

  map('n', '<leader>no', function() neotest.output_panel.toggle() end, { buffer = buffer, desc = "[n]eotest toggle [o]utput panel" })
  map('n', '<leader>ns', function() neotest.summary.toggle() end, { buffer = buffer, desc = "[n]eotest toggle [s]ummary panel" })
end

Maps.lsp_buf = function(_, buffer)
  local lsp_buf = vim.lsp.buf

  map('n', '<localleader>gd', lsp_buf.declaration, { silent = true, buffer = buffer, desc = "[g]o to [d]eclaration" })
  map('n', '<localleader>gD', lsp_buf.definition, { silent = true, buffer = buffer, desc = "[g]o to [D]efinition" })
  map('n', '<localleader>gr', lsp_buf.references, { silent = true, buffer = buffer, desc = "[g]o to [r]eference" })
  map('n', '<localleader>gR', lsp_buf.rename, { silent = true, buffer = buffer, desc = "[g]o to [R]ename window" })
  map('n', '<localleader>gi', lsp_buf.implementation, {silent = true, buffer = buffer, desc = "[g]o to [i]mplementation" })
  map('n', '<localleader>gt', lsp_buf.type_definition, {silent = true, buffer = buffer, desc = "[g]o to [t]ype definition" })
  map('n', '<localleader>gh', lsp_buf.hover, { silent = true, buffer = buffer, desc = "[g]o to [h]over" })
  map('n', '<localleader>gs', lsp_buf.signature_help, { silent = true, buffer = buffer, desc = "[g]o to [s]ignature help" })
  map('n', '<localleader>gc', lsp_buf.code_action, { silent = true, buffer = buffer, desc = "[g]o to [c]ode action" })
end

Maps.gitsigns = function(buffer)
  local gitsigns = package.loaded.gitsigns

  map('n', 'nh', gitsigns.next_hunk, { silent = true, buffer = buffer, desc = "[n]ext [h]unk" })
  map('n', 'ph', gitsigns.prev_hunk, { silent = true, buffer = buffer, desc = "[p]revious [h]unk" })
  map('n', '<leader>hs', gitsigns.stage_hunk, { silent = true, buffer = buffer, desc = "[h]unk [s]tage" })
  map('n', '<leader>hr', gitsigns.reset_hunk, { silent = true, buffer = buffer, desc = "[r]eset [h]unk" })

  map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { silent = true, buffer = buffer, desc = "[h]unk [s]tage selection" })
  map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { silent = true, buffer = buffer, desc = "[h]unk [r]eset selection" })
  map('v', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, { silent = true, buffer = buffer, desc = "[h]unk [b]lame selection" })
end

Maps.molten = function()
  map('n', '<localleader>mi', ':MoltenInit<CR>', { silent = true, desc = "[m]olten [i]nit" })

  map('n', '<localleader>ms', ':noautocmd MoltenEnterOutput<CR>', { silent = true, desc = "[m]olten [s]how output" })
  map('n', '<localleader>mh', ':MoltenHideOutput<CR>', { silent = true, desc = "[m]olten [h]ide output" })

  map('n', '<localleader>me', ':MoltenEvaluateLine<CR>', { silent = true, desc = "[m]olten [e]valuate line" })
  map('v', '<localleader>me', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = "[m]olten [e]valuate selection" })

  map('n', '<localleader>mo', ':MoltenOpenInBrowser<CR>', { silent = true, desc = "[m]olten [o]pen in browser"})
end

Maps.quarto = function()
  local quarto = require('quarto.runner')

  map('n', '<localleader>rc', quarto.run_cell, { silent = true, desc = "[r]un [c]ell" })
  map('n', '<localleader>ra', quarto.run_above, { silent = true, desc = "[r]un cell and [a]bove" })
  map('n', '<localleader>rA', quarto.run_all, { silent = true, desc = "[r]un [A]ll cells" })
  map('n', '<localleader>rl', quarto.run_line, { silent = true, desc = "[r]un [l]ine" })
  map('v', '<localleader>r', quarto.run_range, { silent = true, desc = "[r]un visual [r]ange" })
  map('n', '<localleader>RA', function() quarto.run_all(true) end, { silent = true, desc = "[R]un [A]ll cells" })
end

return Maps
