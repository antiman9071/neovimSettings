vim.keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/anthony/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><loader>", function()
   vim.cmd("so")
end)
vim.keymap.set("n", "<leader>pv", function()
    vim.cmd(":w")
    vim.cmd.Ex()
end)
vim.keymap.set("n", "<leader><Enter>", function()
    local file_ext = vim.fn.expand('%:e')
    local filepath = vim.fn.expand('%:p')
    local filedir = vim.fn.expand('%:p:h')
    local filename = vim.fn.expand('%:t')
    
    
    -- Open terminal in the current file's directory
    vim.cmd(':w')
    vim.cmd('split')
    vim.cmd('wincmd j')
    vim.cmd('terminal')
    os.execute("sleep " .. tonumber(0.2))
    
    -- Switch to terminal insert mode
    vim.cmd('startinsert')
    vim.api.nvim_chan_send(vim.b.terminal_job_id, "cd " .. filedir .. "\n")
    -- Send the gcc command
    if file_ext == 'c' then
        vim.api.nvim_chan_send(vim.b.terminal_job_id, "gcc " .. filepath .. "\n./a.out ")
    end
    if file_ext == 'cpp' then
        vim.api.nvim_chan_send(vim.b.terminal_job_id, "g++ " .. filepath .. "\n./a.out ")
    end
    if file_ext == 'java' then
        vim.api.nvim_chan_send(vim.b.terminal_job_id, "java " .. filepath .. " ")
    end
    if file_ext == 'py' then
        vim.api.nvim_chan_send(vim.b.terminal_job_id, "python " .. filepath .. " ")
    end
    if file_ext == 'sh' then
        vim.api.nvim_chan_send(vim.b.terminal_job_id, "./" .. filename .. " ")
    end
end, { silent = false, noremap = true, desc = "Compile current file" })

