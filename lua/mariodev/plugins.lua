vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup({
    function(use)

        --------------------
        -- Packages start --
        --------------------

        use("wbthomason/packer.nvim")

        use({
            "catppuccin/nvim",
            config = function()
                require("mariodev.plugins.catppuccin")
            end,
        })

        use({
            "nvim-telescope/telescope.nvim",
            tag = "0.1.0",
            requires = { { "nvim-lua/plenary.nvim" } },
        })

        -------------------
        --   LSP start   --
        -------------------

        use({
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        })

        use({
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup()
            end,
        })

        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("mariodev.plugins.lspconfig")
            end,
        })

        -----------------
        --   LSP end   --
        -----------------

        use({
            "zbirenbaum/copilot.lua",
            event = "InsertEnter",
            config = function()
                require("mariodev.plugins.copilot")
            end,
        })

        use({
            {
                "nvim-lualine/lualine.nvim",
                event = "BufEnter",
                config = function()
                    require("mariodev.plugins.lualine")
                end,
            },
            {
                "j-hui/fidget.nvim",
                after = "lualine.nvim",
                config = function()
                    require("fidget").setup()
                end,
            },
        })

        use({
            {
                "nvim-treesitter/nvim-treesitter",
                event = "CursorHold",
                run = ":TSUpdate",
                config = function()
                    require("mariodev.plugins.treesitter")
                end,
            },
            { "nvim-treesitter/playground", after = "nvim-treesitter" },
            { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
            { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
            { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
            { "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
