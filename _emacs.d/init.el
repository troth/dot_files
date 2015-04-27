;;;
;;; Emacs init file for Theodore A. Roth
;;;

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-el")

(load "init-misc")
(load "init-scroll")
(load "init-font-lock")

;;; Mode customizations.
(load "init-cedet")
(load "init-ecb")
(load "init-speedbar")
(load "init-asm-mode")
(load "init-c-mode")
(load "init-python-mode")
(load "init-cmake-mode")
(load "init-shell-mode")
;;(load "init-auto-complete")

;;; Customize key mappings.
;;; Must be last since it uses functions defined in other modules.
(load "init-key-map")
