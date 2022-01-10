local status_ok, wilder = pcall(require, "wilder")
if not status_ok then
	return
end

local setup = {
	vim.cmd([[
  
        call wilder#setup({'modes': [':', '/' ]})

        call wilder#set_option('pipeline', [
              \   wilder#branch(
              \     wilder#python_file_finder_pipeline({
              \       'file_command': {_, arg -> stridx(arg, '.') != -1 ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
              \       'dir_command': ['fd', '-td'],
              \       'filters': ['cpsm_filter'],
              \     }),
              \     wilder#substitute_pipeline({
              \       'pipeline': wilder#python_search_pipeline({
              \         'skip_cmdtype_check': 1,
              \         'pattern': wilder#python_fuzzy_pattern({
              \           'start_at_boundary': 0,
              \         }),
              \       }),
              \     }),
              \     wilder#cmdline_pipeline({
              \       'fuzzy': 1,
              \       'fuzzy_filter': has('nvim') ? wilder#lua_fzy_filter() : wilder#vim_fuzzy_filter(),
              \     }),
              \     [
              \       wilder#check({_, x -> empty(x)}),
              \       wilder#history(),
              \     ],
              \     wilder#python_search_pipeline({
              \       'pattern': wilder#python_fuzzy_pattern({
              \         'start_at_boundary': 0,
              \       }),
              \     }),
              \   ),
              \ ])

        let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
              \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
              \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
              \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
        let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
              \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
              \ )})
        
  let s:highlighters = [
              \ wilder#pcre2_highlighter(),
              \ has('nvim') ? wilder#lua_fzy_highlighter() : wilder#cpsm_highlighter() ,
              \ ]
       

        let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
              \ 'border': 'rounded',
              \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
              \ 'highlighter': s:highlighters,
              \ 'left': [
              \   ' ',
              \   wilder#popupmenu_devicons(),
              \   wilder#popupmenu_buffer_flags({
              \     'flags': ' a + ',
              \     'icons': {'+': '', 'a': '', 'h': ''},
              \   }),
              \ ],
              \ 'right': [
              \   ' ',
              \   wilder#popupmenu_scrollbar(),
              \ ],
              \ 'highlights': {
              \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
              \   'gradient': s:gradient,
              \ },
              \ }))

        let s:wildmenu_renderer = wilder#wildmenu_renderer({
              \ 'highlighter': s:highlighters,
              \ 'separator': ' · ',
              \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
              \ 'right': [' ', wilder#wildmenu_index()],
              \ })

        call wilder#set_option('renderer', wilder#renderer_mux({
              \ ':': s:popupmenu_renderer,
              \ '/': s:wildmenu_renderer,
              \ 'substitute': s:wildmenu_renderer,
              \ }))
          ]]),
}
