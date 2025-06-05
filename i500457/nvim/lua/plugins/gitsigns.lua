return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup()
  end
}
