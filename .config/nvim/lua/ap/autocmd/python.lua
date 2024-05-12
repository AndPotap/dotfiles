local autocmd = vim.api.nvim_create_autocmd
local grp_python = vim.api.nvim_create_augroup("pythonops", { clear = true })

local function noremap(k, v)
    vim.keymap.set("n", k, v, { silent = true, noremap = true })
end

local function setup_greek_letters()

    local greek_mode_pairs = {
        ["<C-G>a"] = "<C-G>uα",
        ["<C-G>b"] = "<C-G>uβ",
        ["<C-G>c"] = "<C-G>uψ",
        ["<C-G>d"] = "<C-G>uδ",
        ["<C-G>D"] = "<C-G>uΔ",
        ["<C-G>e"] = "<C-G>uε",
        ["<C-G>f"] = "<C-G>uφ",
        ["<C-G>g"] = "<C-G>uγ",
        ["<C-G>h"] = "<C-G>uη",
        ["<C-G>i"] = "<C-G>uι",
        ["<C-G>j"] = "<C-G>uξ",
        ["<C-G>k"] = "<C-G>uκ",
        ["<C-G>l"] = "<C-G>uλ",
        ["<C-G>m"] = "<C-G>uμ",
        ["<C-G>n"] = "<C-G>uν",
        ["<C-G>o"] = "<C-G>uω",
        ["<C-G>p"] = "<C-G>uπ",
        ["<C-G>q"] = "<C-G>uϕ",
        ["<C-G>r"] = "<C-G>uρ",
        ["<C-G>s"] = "<C-G>uσ",
        ["<C-G>t"] = "<C-G>uθ",
        ["<C-G>y"] = "<C-G>uτ",
        ["<C-G>v"] = "<C-G>uυ",
        ["<C-G>z"] = "<C-G>uζ",
    }

    for letter, cmd in pairs(greek_mode_pairs) do
        vim.keymap.set("i", letter, cmd, { noremap = true })
    end
end

local function enable_python_keys()
    noremap("<leader>b", "A<Enter>breakpoint()<Esc>")
    noremap("<leader>ff", "/def<Space><Enter>")
    noremap("<leader>cl", "/class<Space><Enter>")
    noremap("<leader>cc", "^<C-V>I#<Space><Esc>j^")
    noremap("<leader>un", "^xxj^")
    setup_greek_letters()
end

autocmd("FileType", { pattern = { "python" },
    callback = enable_python_keys,
    group = grp_python
})
