local nmap = require('fracalo.keymap').nmap
local nnoremap = require('fracalo.keymap').nnoremap
local vnoremap = require('fracalo.keymap').vnoremap
local inoremap = require('fracalo.keymap').inoremap


nnoremap("<leader>p", function()
	require("telescope.builtin").find_files({hidden = true})
end);
nnoremap("<leader>s", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grepping: >")})
end);

--nmap <leader>w :w<cr>
nmap("<leader>w", ":w<CR>");

-- nmap <leader>T :enew<cr>
-- To open a new empty buffer
nmap("<leader>T", ":enew<cr>");

-- nmap <leader>l :bnext<CR>
-- move next buffer
nmap("<leader>l", ":bnext<CR>");

-- nmap <leader>h :bprevious<CR>
-- move prev buffer
nmap("<leader>h", ":bprevious<CR>");

-- close a buf
-- nmap <leader>bq :bp <BAR> bd #<CR>
nmap("<leader>bq", ":bp <BAR> bd #<CR>");

-- show buffer & statuses
-- nmap <leader>bl :ls<CR>
nmap("<leader>bl", ":ls<CR>");



-- " Show only selected in Visual Mode
-- nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
nmap("<silent> <leader>th", ":cal ToggleSelected(0)<cr>")
-- vmap <silent> <leader>th :cal ToggleSelected(1)<cr>
vim.keymap.set(
	"v",
	"<silent> <leader>th",
	":cal ToggleSelected(1)<cr>", 
	vim.tbl_extend("force", {noremap = false}, {})
)



-- nmap <leader><bar> :vsplit<cr>
-- nmap <leader>- :split<cr>
-- Split the window using some nice shortcuts
nmap("<leader><bar>", ":vsplit<cr>")
nmap("<leader>-", ":split<cr>")

-- use <C + h j k l keys to move through windows
nnoremap("<C-J>",  "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")

-- nn <silent> <cr> :nohlsearch<cr><cr>
-- Unhighlight the last search pattern on Enter
nnoremap("nn <silent> <cr>", "nohlsearch<cr><cr>")

vnoremap('J:m ', "'>+1<cr>gv=gv")

-- 
-- 
-- " Control enhancements in insert mode
-- imap <C-F> <right>
-- imap <C-B> <left>
-- imap <M-BS> <esc>vBc
-- imap <C-P> <up>
-- imap <C-N> <down>
--
-- there is now a better way to do keymaps in lua (look at lsp_cmp.lua for examples

