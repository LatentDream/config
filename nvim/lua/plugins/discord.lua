return {
  'vyfor/cord.nvim',
  build = './build || .\\build',
  event = 'VeryLazy',
  opts = {
    timestamp = {
      enabled = false
    },
    text = {
      workspace = function(opts) return 'In ' .. opts.workspace end,
      editing = 'Editing a file',
      viewing = 'Viewing a file',
    }
  }, -- calls require('cord').setup()
}
