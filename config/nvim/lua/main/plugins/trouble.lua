local M = {
    "folke/trouble.nvim",
}

M.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

function M.keys()
    local trouble = require("trouble")
    return {
        { "<leader>xx", trouble.open, desc = "Show problems" },
    }
end

function M.config()
    require('trouble').setup {
        position = 'bottom',
        height = 10,
    }
end

return M
