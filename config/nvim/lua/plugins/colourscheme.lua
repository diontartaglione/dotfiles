return {

  -- Configure LazyVim to load colour schemes --
  --
  {
    "chriskempson/base16-vim",
    lazy = true,
    config = function()
      vim.cmd("colorscheme base16-default-dark")
    end,
  },
}
