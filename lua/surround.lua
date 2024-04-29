-- Operation type to run --
local visual = false
local special_chars = {' ', ',', '.', '!', '?'} 

local pairs = {
  ["("] = {"(", ")"},
  ["{"] = {"{", "}"},
  ["["] = {"[", "]"}
}

function surround()
  if not visual then
    surround_normal()
  else
    surround_visual()
    visual = false
  end
end

-- find_word_bounds(sequence, index)
-- sequence is a string to go through
-- index is location of a cursor; assumed not to be " "
function find_word_bounds(seq, index) 
  assert(#seq > index, "Error: index is greater than the sequence length")
  local word_start, word_end

  if index == 1 then word_start = index end 
  if index == (#seq - 1) then word_end = index end

  for i = index, 1, -1 do
    if word_start then break end

    for _, special_char in ipairs(special_chars) do
      if seq:sub(i, i) == special_char then
        word_start = i + 1
        break
      end
    end
  end

  for i = index, #seq, 1 do
    if word_end then break end

    for _, special_char in ipairs(special_chars) do
      if seq:sub(i, i) == special_char then
        word_end = i - 1
        break
      end 
    end
  end

  if not word_start then error("Error: word_start is nil") end
  if not word_end then error("Error: word_end is nil") end 

  return word_start, word_end
end

function surround_normal()
  local cur_win = vim.api.nvim_get_current_win()
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_pos = vim.api.nvim_win_get_cursor(cur_win)

  local line = vim.api.nvim_buf_get_lines(cur_buf, cur_pos[1] - 1, cur_pos[1], false)[1]
  
  for _, special_char in ipairs(special_chars) do
    if line:sub(cur_pos[2] + 1, cur_pos[2] + 1) == special_char then return end
  end
  
  local open_char = vim.fn.nr2char(vim.fn.getchar())
  local close_char = nil

  if pairs[open_char] then
    close_char = pairs[open_char][2]
  else
    close_char = open_char
  end

  local start_pos, end_pos = find_word_bounds(line, cur_pos[2]+1)

  vim.api.nvim_buf_set_text(cur_buf, cur_pos[1] - 1, start_pos - 1, cur_pos[1] - 1, start_pos - 1, {open_char})
  vim.api.nvim_buf_set_text(cur_buf, cur_pos[1] - 1, end_pos + 1, cur_pos[1] - 1, end_pos + 1, {close_char})
end

function surround_visual()
  local cur_win = vim.api.nvim_get_current_win()
  local cur_buf = vim.api.nvim_get_current_buf()
  local cur_pos = vim.api.nvim_win_get_cursor(cur_win)

  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local open_char = vim.fn.nr2char(vim.fn.getchar())
  local close_char = nil

  if pairs[open_char] then
    close_char = pairs[open_char][2]
  else
    close_char = open_char
  end

  vim.api.nvim_buf_set_text(cur_buf, start_pos[2] - 1, start_pos[3] - 1, start_pos[2] - 1, start_pos[3] - 1, {open_char})
  vim.api.nvim_buf_set_text(cur_buf, end_pos[2] - 1, end_pos[3] + 1, end_pos[2] - 1, end_pos[3] + 1, {close_char})
end

vim.keymap.set("n", "<A-s>", function()
  vim.cmd("lua surround()")
end, { noremap = true })

vim.keymap.set("v", "<A-s>", function()
  vim.api.nvim_input("<Esc>")
  visual = true
end, { noremap = true })
