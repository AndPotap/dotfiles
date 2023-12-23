local M = {}

M.setup_tex_keymaps = function ()
    vim.fn.setreg("p", "\\begin{proof}\n\\end{proof}\n")

    vim.opt.spell = true
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.textwidth = 0
    vim.opt.wrapmargin = 0

    -- This lines below did not fix the issue
    -- vim.o.autoindent = false
    -- vim.o.smartindent = false
    -- vim.bo.autoindent = false
    -- vim.bo.smartindent = false

    vim.api.nvim_buf_set_keymap(0, "n", vim.g.mapleader .. "EE", ":!build_tex %:r<CR><CR>", { noremap = true, silent = false})
    vim.api.nvim_buf_set_keymap(0, "n", "<C-E>", ":!compiletex %<CR><CR>", { noremap = true, silent = false})

    vim.keymap.set("i", "<Left>", "<nop>", { noremap = true })
    vim.keymap.set("i", "<Up>", "<nop>", { noremap = true })
    vim.keymap.set("i", "<Down>", "<nop>", { noremap = true })
    vim.keymap.set("i", "<Right>", "<Esc>/<++><Enter>c4l")
    vim.keymap.set("n", "<Right>", "<Esc>/<++><Enter>c4l")
    vim.keymap.set("i", "<Tab>", "<Esc>/<++><Enter>c4l")
    vim.keymap.set("n", "<Tab>", "<Esc>/<++><Enter>c4l")

    local other_n_pairs = {
        ["<Up>"] =  "k",
        ["<Down>"] =  "j",
        ["k"] =  "gk",
        ["j"] =  "gj",
        ["<leader>pa"] = "mavipgq`a:%s/\\s\\s/ \n",
        ["<leader>au"] = ":%s/\\s\\+$//e\n",
        ["<leader> "] = "g^",
        ["<leader>no"] = "i\\noindent ",
        ["<leader>tc"] = "i\\textcolor{}{<++>}<++><esc>F{F{a",
        ["<leader>pp"] = "i\\begin{prop}\n\\end{prop}<esc>F\\kf}a[]<esc>T[i",
        ["<leader>Eq"] = "o\\begin{equation}<Esc>o<Space><Space>\\begin{split}<Enter>\\end{split}<Enter>\\end{equation}<Esc>^2k<leader>o<C-G>u",
        ["<leader>eq"] = "o\\begin{equation*}<Esc>o<Space><Space>\\begin{split}<Enter>\\end{split}<Enter>\\end{equation*}<Esc>^2k<leader>o<C-G>u",
        ["<leader>ew"] = "o\\begin{equation*}<Esc>o\\end{equation*}<Esc>^k<leader>o<C-G>u",
        ["<leader>Ew"] = "o\\begin{equation}<Esc>o\\end{equation}<Esc>^k<leader>o<C-G>u",
        [",5"] = "o<C-G>u\\textcolor{blue}{\\textbf{Note:}} \\textcolor{gray}{}<Esc>T{",
        [",4"] = "o\\begin{itemize}<Enter>\\end{itemize}<Esc>ko<Space><Space>\\item<Space><Space>",
        [",3"] = "o\\begin{figure}<Esc>o\\centering<Esc>o\\includegraphics[<++>]{<++>}<Esc>o\\caption{<++>}\\label{<++>}<Esc>o\\end{figure}<Esc>2k^/<++><CR>h",
        [",2"] = "o\\begin{equation}<Esc>o<Space><Space>\\begin{split}<Enter>\\end{split}<Enter>\\end{equation}<Esc>^2X2k<leader>o<Space><Space><C-G>u",
        [",1"] = "i<C-G>u \\textcolor{}{<++>}<Esc>T{2ha",
    }

    for letter, cmd in pairs(other_n_pairs) do
        vim.keymap.set("n", letter, cmd, { noremap = true })
    end

    local other_i_pairs = {
        ["<C-D>"] = "<nop>",
        ["<C-B>"] = "<C-G>u\\bm{}<++><Esc>T{ha",
        ["<C-T>"] = "<C-G>u\\text{}<++><Esc>T{ha",
        ["SS"] = "SS",
        [",f"] = "\\",
        [",u"] = "<C-G>u\\left|\\right|<++><Esc>10hi",
        [",h"] = "<C-G>u\\hspace{0.2cm} ",
        [",i"] = "<C-G>u\\infty",
        [",bb"] = "<C-G>u\\textbf{}<++><Esc>T{i",
        [",bm"] = "<C-G>u\\mathbf{}<++><Esc>T{i",
        [",em"] = "<C-G>u\\emph{}<++><Esc>T{i",
        [",sc"] = "<C-G>u\\textsc{}<++><Esc>T{i",
        [",tt"] = "<C-G>u\\texttt{}<++><Esc>T{i",
        ["<C-C>"] = "<C-G>u\\cdots",
        ["<C-O>"] = "<C-G>u\\left(\\right)<++><Esc>10hi",
        ["<C-Y>"] = "<C-G>u\\left[\\right]<++><Esc>10hi",
        ["<C-E>"] = "<C-G>u\\mathbb{E}\\left[ \\right]<++><Esc>11hi",
        ["<C-H>"] = "<C-G>u^{}<++><Esc>F{a",
        ["<C-L>"] = "<C-G>u_{}<++><Esc>F{a",
        ["<C-F>"] = "<C-G>u$$<++><Esc>F$i",
    }

    for letter, cmd in pairs(other_i_pairs) do
        vim.keymap.set("i", letter, cmd, { noremap = true })
    end

    local ctrl_s_pairs = {
        ["<C-S>a"] = ",1,",
        ["<C-S>b"] = "<C-G>u\\mathbb{}<++><Esc>4hi",
        ["<C-S>c"] = "<C-G>u\\mathcal{}<++><Esc>4hi",
        ["<C-S>d"] = "<C-G>u\\dotprod{}<++><Esc>T{i",
        ["<C-S>e"] = "<C-G>u\\under{\\mathbb{E}}{ \\sim <++>}<Esc>2T{4li",
        ["<C-S>f"] = "<C-G>u\\frac{}{<++>}<++><Esc>10hi",
        ["<C-S>g"] = "<C-G>u\\quad \\text{} \\quad <++><Esc>T{i",
        ["<C-S>i"] = "<C-G>u\\int_{}^{<++>} <++><Esc>2T{i",
        ["<C-S>p"] = "<C-G>u\\prod_{}^{<++>} <++><Esc>2T{i",
        ["<C-S>q"] = "<C-G>u\\hat{}<++><Esc>T{ha",
        ["<C-S>o"] = "<C-G>u\\overline{}<++><Esc>T{ha",
        ["<C-S>n"] = "<C-G>u\\norm{}<++><Esc>T{i",
        ["<C-S>N"] = "<C-G>u\\Norm{}<++><Esc>T{i",
        ["<C-S>r"] = "<C-G>u\\mathrm{}<++><Esc>4hi",
        ["<C-S>s"] = "<C-G>u\\sum_{}^{<++>} <++><Esc>2T{i",
        ["<C-S>t"] = "<C-G>u\\tilde{}<++><Esc>T{ha",
        ["<C-S>T"] = "<C-G>u\\intercal",
        ["<C-S>x"] = "<C-G>u\\times ",
        ["<C-S>z"] = "<C-G>u\\bar{}<++><Esc>T{ha",
    }
    for letter, cmd in pairs(ctrl_s_pairs) do
        vim.keymap.set("i", letter, cmd, { noremap = true })
    end

    local greek_mode_pairs = {
        ["<C-G>a"] = "<C-G>u\\alpha",
        ["<C-G>b"] = "<C-G>u\\beta",
        ["<C-G>c"] = "<C-G>u\\psi",
        ["<C-G>C"] = "<C-G>u\\Psi",
        ["<C-G>d"] = "<C-G>u\\delta",
        ["<C-G>D"] = "<C-G>u\\Delta",
        ["<C-G>e"] = "<C-G>u\\epsilon",
        ["<C-G>E"] = "<C-G>u\\varepsilon",
        ["<C-G>f"] = "<C-G>u\\varphi",
        ["<C-G>F"] = "<C-G>u\\varPhi",
        ["<C-G>g"] = "<C-G>u\\gamma",
        ["<C-G>G"] = "<C-G>u\\Gamma",
        ["<C-G>h"] = "<C-G>u\\eta",
        ["<C-G>i"] = "<C-G>u\\iota",
        ["<C-G>j"] = "<C-G>u\\xi",
        ["<C-G>J"] = "<C-G>u\\Xi",
        ["<C-G>k"] = "<C-G>u\\kappa",
        ["<C-G>l"] = "<C-G>u\\lambda",
        ["<C-G>L"] = "<C-G>u\\Lambda",
        ["<C-G>m"] = "<C-G>u\\mu",
        ["<C-G>n"] = "<C-G>u\\nu",
        ["<C-G>o"] = "<C-G>u\\omega",
        ["<C-G>O"] = "<C-G>u\\Omega",
        ["<C-G>p"] = "<C-G>u\\pi",
        ["<C-G>P"] = "<C-G>u\\Pi",
        ["<C-G>q"] = "<C-G>u\\phi",
        ["<C-G>Q"] = "<C-G>u\\Phi",
        ["<C-G>r"] = "<C-G>u\\rho",
        ["<C-G>s"] = "<C-G>u\\sigma",
        ["<C-G>S"] = "<C-G>u\\Sigma",
        ["<C-G>t"] = "<C-G>u\\theta",
        ["<C-G>T"] = "<C-G>u\\Theta",
        ["<C-G>y"] = "<C-G>u\\tau",
        ["<C-G>y"] = "<C-G>u\\Tau",
        ["<C-G>w"] = "<C-G>u\\varsigma",
        ["<C-G>v"] = "<C-G>u\\upsilon",
        ["<C-G>z"] = "<C-G>u\\zeta",
        ["<C-G>Z"] = "<C-G>u\\Zeta",
    }

    for letter, cmd in pairs(greek_mode_pairs) do
        vim.keymap.set("i", letter, cmd, { noremap = true })
    end

    local greek_cmds_pairs = {
        ["α"] =  "<C-G>u\\alpha",
        ["β"] = "<C-G>u\\beta",
        ["ψ"] = "<C-G>u\\psi",
        ["δ"] = "<C-G>u\\delta",
        ["ε"] = "<C-G>u\\epsilon",
        ["φ"] = "<C-G>u\\phi",
        ["γ"] = "<C-G>u\\gamma",
        ["η"] = "<C-G>u\\eta",
        ["ι"] = "<C-G>u\\iota",
        ["ξ"] = "<C-G>u\\xi",
        ["κ"] = "<C-G>u\\kappa",
        ["λ"] = "<C-G>u\\lambda",
        ["μ"] = "<C-G>u\\mu",
        ["ν"] = "<C-G>u\\nu",
        ["π"] = "<C-G>u\\pi",
        ["ρ"] = "<C-G>u\\rho",
        ["σ"] = "<C-G>u\\sigma",
        ["θ"] = "<C-G>u\\theta",
        ["τ"] = "<C-G>u\\tau",
        ["ς"] = "<C-G>u\\varsigma",
        ["ω"] = "<C-G>u\\omega",
        ["υ"] = "<C-G>u\\upsilon",
        ["ζ"] = "<C-G>u\\zeta",
        ["Γ"] = "<C-G>u\\Gamma",
        ["Δ"] = "<C-G>u\\Delta",
        ["Φ"] = "<C-G>u\\Phi",
        ["Ξ"] = "<C-G>u\\Xi",
        ["Λ"] = "<C-G>u\\Lambda",
        ["Π"] = "<C-G>u\\Pi",
        ["Σ"] = "<C-G>u\\Sigma",
        ["Θ"] = "<C-G>u\\Theta",
        ["Ω"] = "<C-G>u\\Omega",
    }

    for letter, cmd in pairs(greek_cmds_pairs) do
        vim.keymap.set("i", letter, cmd, { noremap = true })
    end
end

return M
