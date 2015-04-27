;;; Scons files are just python scriptlets.
(setq auto-mode-alist
 (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
 (cons '("SConscript" . python-mode) auto-mode-alist))


;;; Python-mode does play nice with CEDET. :-(
;;;(require 'pycomplete)
;(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;(setq interpreter-mode-alist(cons '("python" . python-mode)
;                             interpreter-mode-alist))
;(autoload 'python-mode "python-mode" "Python editing mode." t)

;;;(autoload 'pymacs-load "pymacs" nil t)
;;;(autoload 'pymacs-eval "pymacs" nil t)
;;;(autoload 'pymacs-apply "pymacs")
;;;(autoload 'pymacs-call "pymacs")

;(defun my-python-hook ()
  ;; my customizations for all of python and related modes
  ;(setq indent-tabs-mode nil)
  ;(setq py-smart-indentation nil)
  ;(setq py-indent-offset 4)
  ;(setq py-python-command "python")
  ;)

;(add-hook 'python-mode-hook 'my-python-hook)
