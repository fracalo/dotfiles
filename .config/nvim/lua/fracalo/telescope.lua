
-- telescope
require("telescope").setup({
    defaults = {
    	file_sorter = require("telescope.sorters").get_fzy_sorter,
    	prompt_prefix = " >",
    	color_devicons = true,
    	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    },
    extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})
