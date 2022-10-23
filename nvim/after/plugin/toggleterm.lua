require('toggleterm').setup({
  size= 20,
  direction = "float",
  open_mapping = [[<c-\>]],
  start_in_insert = true,
  insert_mappings = true,
  close_on_exit = true,
  shell = os.getenv("SHELL")
})

