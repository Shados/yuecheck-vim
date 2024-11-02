" Author: Alexei Robyn https://github.com/Shados
" Description: yuecheck for linting Yuescript files

call ale#Set('yue_yuecheck_executable', 'yuecheck')
call ale#Set('yue_yuecheck_options', '')

function! ale_linters#yue#yuecheck#Handle(buffer, lines) abort
  " Line format is like:
  " 28:W:W211:unused variable '_globals'
  let l:pattern = '^\(\d\+\):\([WE]\):\([WE]\d\+\):\(.\+\)$'
  let l:output = []

  for l:match in ale#util#GetMatches(a:lines, l:pattern)
    call add(l:output, {
    \   'lnum': l:match[1] + 0,
    \   'type': l:match[2],
    \   'code': l:match[3],
    \   'text': l:match[4],
    \})
  endfor

  return l:output
endfunction

function! ale_linters#yue#yuecheck#GetCommand(buffer) abort
  let l:options = ale#Var(a:buffer, 'yue_yuecheck_options')
  return '%e' . ale#Pad(l:options)
endfunction

call ale#linter#Define('yue', {
\   'name': 'yuecheck',
\   'executable': {b -> ale#Var(b, 'yue_yuecheck_executable')},
\   'command': function('ale_linters#yue#yuecheck#GetCommand'),
\   'callback': 'ale_linters#yue#yuecheck#Handle',
\})
