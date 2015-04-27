(defun my-sh-mode-hook ()
  (message "loading my-sh-mode-hook()")
  ;; my customizations for all of shell-mode and related modes
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
)

(add-hook 'sh-mode-hook 'my-sh-mode-hook)
