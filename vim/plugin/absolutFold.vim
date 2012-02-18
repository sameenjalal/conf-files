" File: absolutFold.vim
" Author: juanpabloaj https://github.com/juanpabloaj
" Description: a folding plugin
" Doc: :h fold-expr 
if exists('did_absolutFold') || &cp || version < 700
	finish
endif
let did_absolutFold = 1
function! AFoldLevel(lnum)
  let line = getline(a:lnum)
	if line =~ '{{{'
		return "a1"
	elseif line =~ '}}}'
		return "s1"
	endif
	if line =~ 'main(.*){'
		return "a1"
	elseif line =~ '}'
		return "s1"
	endif
  return "="
endfunction

function! AFoldText()
  " Look through all of the folded text for the function signature.
  let signature = ''
  let i = v:foldstart
  while signature == '' && i < v:foldend
    let line = getline(i)
    if line =~ '{{{[ ]*$'
      let signature = line
    endif 
	if line =~ 'main(.*){'
      let signature = line
    endif 
    let i = i + 1
  endwhile

  " Return what the fold should show when folded.
  return '+-- ' . (v:foldend - v:foldstart) . ' Lines: ' . signature . ' '
endfunction

function! AbsolutFold()               
  set foldenable
  set foldlevel=0   
  set foldmethod=expr
  set foldexpr=AFoldLevel(v:lnum)
  set foldtext=AFoldText()
  set foldnestmax=1
endfunction
map <Leader>f  :call AbsolutFold()<cr>

if &ft == "cpp"
	call s:AbsolutFold()
endif
