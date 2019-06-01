# vim配合中的问题

## 修改 .vim/bundle/vim-latex/ftplugin/latex-suite/texrc
```
-if has('osx') || has('macunix')
-       TexLet g:Tex_DefaultTargetFormat = 'pdf'
-else
-       TexLet g:Tex_DefaultTargetFormat = 'dvi'
-endif
+""""added by linc
+TexLet g:Tex_DefaultTargetFormat = 'pdf'
+
+" if has('osx') || has('macunix')
+"      TexLet g:Tex_DefaultTargetFormat = 'pdf'
+" else
+"      TexLet g:Tex_DefaultTargetFormat = 'dvi'
+" endif
```

```
+""""added by linc
+       TexLet g:Tex_ViewRule_ps = 'open -a texshop'
+       TexLet g:Tex_ViewRule_pdf = 'open -a texshop'
+       TexLet g:Tex_ViewRule_dvi = 'open -a texshop'
+
+"if has('win32')
+"      TexLet g:Tex_ViewRule_ps = 'gsview32'
+"      TexLet g:Tex_ViewRule_pdf = 'AcroRd32'
+"      TexLet g:Tex_ViewRule_dvi = 'yap -1'
+"elseif has('osx') || has('macunix')
+"      " Let the system pick.  If you want, you can override the choice here.
+"      TexLet g:Tex_ViewRule_ps = ''
+"      TexLet g:Tex_ViewRule_pdf = ''
+"      " TexLet g:Tex_ViewRule_pdf = 'Acrobat\ Reader\ 5.1'
+"      TexLet g:Tex_ViewRule_dvi = ''
+"      " Set this to 1 to disable opening a viewer with 'open -a'
+"      " Note: If you do this, you need to specify viewers above
+"      " TexLet g:Tex_TreatMacViewerAsUNIX = 1
+"else
+"      if executable('xdg-open')
+"              TexLet g:Tex_ViewRule_ps = 'xdg-open'
+"              TexLet g:Tex_ViewRule_pdf = 'xdg-open'
+"              TexLet g:Tex_ViewRule_dvi = 'xdg-open'
+"      else
+"              TexLet g:Tex_ViewRule_ps = 'gv'
+"              TexLet g:Tex_ViewRule_pdf = 'xpdf'
+"              TexLet g:Tex_ViewRule_dvi = 'xdvi'
+"      endif
+"      " the option below specifies an editor for the dvi viewer while starting
+"      " up the dvi viewer according to Dimitri Antoniou's tip on vim.sf.net (tip
+"      " #225)
+"      TexLet g:Tex_UseEditorSettingInDVIViewer = 0
+"endif
```

## 修改 .vim/bundle/vim-latex-live-preview/plugin/latexlivepreview.vim
```
-    if exists('g:livepreview_engine')
-        let s:engine = g:livepreview_engine
-    else
-        for possible_engine in ['pdflatex', 'xelatex']
-            if executable(possible_engine)
-                let s:engine = possible_engine
-                break
-            endif
-        endfor
-    endif
+       let s:engine = 'xelatex'
+       " added by linc
+    " if exists('g:livepreview_engine')
+    "     let s:engine = g:livepreview_engine
+    " else
+    "     for possible_engine in ['pdflatex', 'xelatex']
+    "         if executable(possible_engine)
+    "             let s:engine = possible_engine
+    "             break
+    "         endif
+    "     endfor
+    " endif
```

## 防止vim失焦

console下：  
```
defaults write TeXShop BringPdfFrontOnAutomaticUpdate NO
```

## 编译后直接返回vim界面

ftplugin/latex-suite/compiler.vim

```
@@ -905,8 +905,8 @@ function! <SID>Tex_SetCompilerMaps()
        endif
        let s:ml = '<Leader>'

-       nnoremap <buffer> <Plug>Tex_Compile :call Tex_RunLaTeX()<cr>
-       xnoremap <buffer> <Plug>Tex_Compile :call Tex_PartCompile()<cr>
+       nnoremap <buffer> <Plug>Tex_Compile :silent call Tex_RunLaTeX()<cr>
+       xnoremap <buffer> <Plug>Tex_Compile :silent call Tex_PartCompile()<cr>
        nnoremap <buffer> <Plug>Tex_View :call Tex_ViewLaTeX()<cr>
        nnoremap <buffer> <Plug>Tex_ForwardSearch :call Tex_ForwardSearchLaTeX()<cr>
```

