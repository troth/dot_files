;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ECB (Emacs Code Browser)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; The path to ecb is a symlink to the actual soruce which is usually
;;; a git repo.
(add-to-list 'load-path "~/.emacs.d/site-el/ecb")

(require 'ecb)
;(require 'ecb-autoloads)
(setq ecb-tip-of-the-day nil)
;(setq ecb-compile-window-height 20)

