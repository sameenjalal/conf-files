function ToggleFold()
   if foldlevel('.') == 0
	  " No fold exists at the current line,
	  " so create a fold based on indentation

	  let l_min = line('.')   " the current line number
	  let l_max = line('$')   " the last line number
	  let i_min = indent('.') " the indentation of the current line
	  let l = l_min + 1

	  " Search downward for the last line whose indentation > i_min
	  while l <= l_max
		 " if this line is not blank ...
		 if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
			if indent(l) <= i_min
			   " we've gone too far
			   let l = l - 1    " backtrack one line
			   break
			endif
		 endif
		 let l = l + 1
	  endwhile

	  " Clamp l to the last line
	  if l > l_max
		 let l = l_max
	  endif

	  " Backtrack to the last non-blank line
	  while l > l_min
		 if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
			break
		 endif
		 let l = l - 1
	  endwhile

	  "execute "normal i" . l_min . "," . l . " fold"   " print debug info

	  if l > l_min
		 " Create the fold from l_min to l
		 execute l_min . "," . l . " fold"
	  endif
   else
	  " Delete the fold on the current line
	  normal zd
   endif
endfunction


