local nmap = require('fracalo.keymap').nmap
local nnoremap = require('fracalo.keymap').nnoremap
local vnoremap = require('fracalo.keymap').vnoremap
local inoremap = require('fracalo.keymap').inoremap


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



-- Split the window using some nice shortcuts
nmap("<leader><bar>", ":vsplit<cr>")
nmap("<leader>-", ":split<cr>")

-- use <C + h j k l keys to move through windows
nnoremap("<C-J>",  "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")

-- remove highlight the last search pattern on Enter
nnoremap("<leader>(", ":nohlsearch<cr><cr>")

-- vnoremap('J:m ', "'>+1<cr>gv=gv")

-- " Control enhancements in insert mode
-- imap <C-F> <right>
-- imap <C-B> <left>
-- imap <M-BS> <esc>vBc
-- imap <C-P> <up>
-- imap <C-N> <down>
local telescopeBuiltIn = require("telescope.builtin")
nnoremap("<C-W>", function()
	telescopeBuiltIn.marks()
end);
nnoremap("<C-P>", function()
	telescopeBuiltIn.registers({hidden = true})
end);
nnoremap("<leader>p", function()
	telescopeBuiltIn.find_files({hidden = true})
end);
nnoremap("<leader>s", function()
    telescopeBuiltIn.grep_string({ search = vim.fn.input("Grepping: >")})
end);

nnoremap("<C-N>", "<cmd>NvimTreeToggle<cr>")

nnoremap("<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>")

vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", {silent = true })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", {silent = true })

