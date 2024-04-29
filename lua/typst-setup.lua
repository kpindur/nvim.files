-- Global vars --
local is_preview_open = false
local preview = ".preview.pdf"
local render_timer = nil
-- Floating window control? --
local win = nil
local prev_error = nil

function render_typst_to_pdf()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n")

	local temp_file = "temp.typst"
	local file = io.open(temp_file, "w")
	file:write(content)
	file:close()

	local cmd = "typst compile " .. temp_file .. " " .. preview
	local handle = io.popen(cmd .. " 2>&1", "r")
	local output = handle:read("*a")
	handle:close()
	
	if win then
		vim.api.nvim_win_close(win, true)
		win = nil
	end

	if #output ~= 0 then
		local height = 6
		local width = 50
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)

		local lines = "Error while rendering typst to PDF:"
		local opts = {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "double",
		}
		local buf = vim.api.nvim_create_buf(false, true)
		local output = vim.split(output, '\n')
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

		win = vim.api.nvim_open_win(buf, false, opts)
	end
end

function open_preview()
	if not is_preview_open then
		vim.loop.spawn("zathura", { args = { preview }})
		is_preview_open = true
	else
		vim.loop.spawn("pkill", { args = { "-x", "zathura" }})
		is_preview_open = false
	end
end

function toggle_preview()
	open_preview()
end

-- Commands to use from nvim --
vim.cmd[[command! TypstCompile lua render_typst_to_pdf()]]
vim.cmd[[command! TypstPreviewOpen lua open_preview()]]
vim.cmd[[command! TypstPreviewToggle lua toggle_preview()]]

-- Autocommands --
vim.api.nvim_create_autocmd("TextChangedI", {
	pattern = {"*.typst"},
	callback = function()
		if render_timer then
			vim.loop.timer_stop(render_timer)
		end

		render_timer = vim.loop.new_timer()
		render_timer:start(500, 0, vim.schedule_wrap(render_typst_to_pdf))
	end
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {"*.typst"},
	callback = render_typst_to_pdf
})
