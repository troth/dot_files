""" Use emacs-style indent mode where lines aren't indented every time you
""" press <Enter> but only if you press <Tab> or Ctrl-F.
"""  NOTE this doesn't seem to be compatible with supertab.
setlocal cinkeys=!<Tab>,!^F

""" GNU Style Indentation
"setlocal cinoptions={1s,>2s,e-1s,^-1s,n-1s,:1s,p5,i4,(0,u0,W1s shiftwidth=2

""" My modified GNU Style Indentation:
setlocal cinoptions=t0,p2s,(0,w1,W4,l1,g0
setlocal shiftwidth=4
setlocal tabstop=4
setlocal comments=sl:/*,mb:\ ,elx:*/
