return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  lazy = false,
  branch = 'master',
  build = ':TSUpdate'
}
