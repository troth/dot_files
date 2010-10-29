;;;
;;; Emacs init file for Theodore A. Roth
;;;

(setq load-path (cons "~/.emacs.d" load-path))

(load "init-misc")
(load "init-font-lock")

;;; Mode customizations.
(load "init-cedet")
(load "init-ecb")
(load "init-asm-mode")
(load "init-c-mode")
(load "init-python-mode")
;;(load "init-auto-complete")

;;; Customize key mappings.
;;; Must be last since it uses functions defined in other modules.
(load "init-key-map")
