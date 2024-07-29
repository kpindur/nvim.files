local status, molten = pcall(require, "molten")
if not status then
  return
end

molten.setup({
  open_cmd = "vsplit",
  shell = vim.o.shell,

  mappings = {
    run               = "<localleader>mr",
    run_cell          = "<localleader>mc",
    run_all           = "<localleader>ma",
    clear_output      = "<localleader>md",
    clear_all_output  = "<localleader>mD"
  },

  use_icons = true,
  default_kernel_type = "python3",
  output_win_max_height = 20,
  highlight_output = true,
  virt_text_cell = true,
  virt_text_output = true,
})
