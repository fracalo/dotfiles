
vim.keymap.set('n', "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', "<F1>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', "<F2>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', "<F3>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', "<leader>b", ":lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set('n', "<leader>B", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set('n', "<leader>lp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set('n', "<leader>dr", ":lua require('dap').repl.open()<CR>")
vim.keymap.set('n', "<leader>dt", ":lua require('dap-go').debug_test()<CR>")

require('dap-go').setup()
require('nvim-dap-virtual-text').setup({})
local dap, dapui = require('dap'), require('dapui')
dapui.setup()

dap.listeners.after.event_initialized["dapui-conf"] = function () 
    dapui.open()
end
dap.listeners.after.event_terminated["dapui-conf"] = function () 
    dapui.close()
end
dap.listeners.after.event_exited["dapui-conf"] = function () 
    dapui.close()
end
