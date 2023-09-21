local M = {
    "nvim-telescope/telescope.nvim"
}

M.lazy = false

M.tag = "0.1.3"

M.dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
}

function M.config()
    local telescope = require("telescope")
    telescope.setup {
        pickers = {
            find_files = {
                find_command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "--glob", "!.git",
                }
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }
    require("telescope").load_extension("fzf")
end

M.keys = function()
    local builtin = require("telescope.builtin")
    return {
        { "<leader>ff", builtin.find_files, desc = "Find Files" },
        { "<leader>fs", builtin.live_grep, desc = "Live Grep" },
    }
end

return M
