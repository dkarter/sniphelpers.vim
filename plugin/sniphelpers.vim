" Helper functions for use in snippets and other vim scripts
" Last Change: Sun 19 Feb 2017
" Maintainer: Dorian Karter
" License: MIT

scriptencoding utf-8

" Prevent execution if already loaded ------------------   {{{
if exists('g:sniphelpers_loaded')
  finish
endif
let g:sniphelpers_loaded = 1
" Prevent execution if already loaded ------------------   }}}

fun! CurrentBufferPath()
  return buffer_name('%')
endfun

fun! CurrentBufferFileName()
  return split(CurrentBufferPath(), '/')[-1]
endfun

fun! CurrentBufferFileNameNoExt()
  return split(CurrentBufferFileName(), '\.')[0]
endfun

fun! CurrentBufferFileNameExt()
  return split(CurrentBufferFileName(), '\.')[-1]
endfun

fun! CurrentBufferFileNameToBumpyCase()
  return s:snake_case_to_bumpy_case(CurrentBufferFileNameNoExt())
endfun

fun! s:snake_case_to_bumpy_case(word)
  return join(map(split(a:word, '_'), 'toupper(v:val[0]) . v:val[1:-1]'), '')
endfun
