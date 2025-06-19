return {
  'terryma/vim-expand-region',
  version = false,
  keys = {
    { 'v', mode = { 'x' }, '<Plug>(expand_region_expand)', desc = 'Expand region' },
    { 'V', mode = { 'x' }, '<Plug>(expand_region_shrink)', desc = 'Shrink region' },
  },
  init = function()
    vim.cmd([[
      let g:expand_region_text_objects = {
        \ 'iw'  :0,
        \ 'iW'  :0,
        \ 'iq'  :0,
        \ 'i)'  :1,
        \ 'i}'  :1,
        \ 'ic'  :0,
        \ 'if'  :0,
        \ 'im'  :0,
        \ 'af'  :0,
      \ }
    ]])
  end,
}
