-- Plugin spec manifest
local spec = {
    { 'lukelbd/vim-toggle' },
    { 'matze/vim-move' },
    { 'mhinz/vim-startify' },
    { 'qpkorr/vim-bufkill' },
    { 'tpope/vim-commentary' },
    { 'tpope/vim-surround' },
    { 'lewis6991/gitsigns.nvim' },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "vim", "vimdoc", "query", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            clickable = false,
            highlight_visible = false,
            icons = {
                button = '',
                separator = { left = '', right = '' },
                separator_at_end = false,
            },
            sidebar_filetypes = {
                NvimTree = true,
            }
        },
    },
    {
        'neoclide/coc.nvim',
        branch = 'release',
        init = function()
            vim.g.coc_global_extensions = {
                "coc-docker",
                "coc-docthis",
                -- "coc-go",
                "coc-html",
                "coc-jest",
                "coc-json",
                -- "coc-protobuf",
                "coc-pyright",
                -- "coc-rust-analyzer",
                "coc-sh",
                "coc-spell-checker",
                "coc-sql",
                "coc-tailwindcss",
                "coc-toml",
                "coc-tsserver",
                "coc-yaml",
            }
        end,
    }
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = spec,
    install = { colorscheme = { "neonchalk" } },
    checker = { enabled = false },
})

require("gitsigns").setup()

require("nvim-tree").setup({
    disable_netrw = true,
    sort = {
        sorter = 'extension'
    },
    view = {
        width = 40,
        side = "right",
    },
    filters = {
        dotfiles = true,
    },
    renderer = {
        group_empty = true,
        icons = {
            padding = "  ",
            show = {
                folder_arrow = false,
                git = false
            }
        }
    }
})

require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_files_number = 10
vim.g.startify_session_autoload = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_sort = 1
vim.g.startify_custom_header = 'startify#pad(startify#fortune#boxed())'

vim.g.startify_lists = {
    { type = 'sessions',  header = { '   Projects' } },
    { type = 'files',     header = { '   Recently opened' } },
    { type = 'bookmarks', header = { '   Bookmarks' } },
    { type = 'commands',  header = { '   Commands' } },
}

vim.g.startify_skiplist = { 'COMMIT_EDITMSG' }
