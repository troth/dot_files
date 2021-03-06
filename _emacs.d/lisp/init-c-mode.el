;;(require 'doxymacs)  ;; Not in Debian 8 due to outstanding bugs.
(require 'xcscope)

;; Create my personal style. Inherits from 'gnu' style.
(defconst troth-c-style
  '("gnu"
    (c-basic-offset             . 4)
    (tab-width                  . 4)
    (indent-tabs-mode           . nil)
    (c-offsets-alist            . ((case-label          . 4)
				   (substatement-open   . 0)
				   (statement-case-open . 0)))
  )
  "TRoth C Programming Style")
(c-add-style "troth" troth-c-style)

;; Force 'linux' style to use tabs. Inherits from 'linux' style.
(defconst linux-troth-c-style
  '("linux"
    (tab-width                  . 8)
    (indent-tabs-mode           . t))
  "Linux C Programming Style (undoes things set in 'troth' style)")
(c-add-style "linux-troth" linux-troth-c-style)

(setq c-default-style '((python-mode . "python")
			(awk-mode    . "awk")
			(other       . "troth")))

(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode and related modes
  (setq c-echo-syntactic-information-p 1)
  (setq c-tab-always-indent t)
  (setq cscope-option-use-inverted-index t)
  (setq cscope-option-do-not-update-database t)
  (setq cscope-use-relative-paths t)
  (setq cscope-index-recursively nil)
  ;;;(setq c-font-lock-extra-types 
  ;;; (quote ("FILE" "\\sw+_t" "\\sw+_T" "byte" "word" "dword" "qword")))
  ;; other customizations can go here
  ;; we like auto-newline and hungry-delete
  ;;(c-toggle-auto-hungry-state 1)
  ;;(c-toggle-auto-state nil)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
    (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; (defun c-new-func (ret-type func args)
;;   "Insert a new C function definition into current buffer."
;;   (interactive "sReturn type: \nsFunction name: \nsArgument list: ")
;;   (setq func-str (format "%s %s( %s )" ret-type func args))
;;   (insert (format "\n%s;\n" func-str))
;;   (insert (concat "/" (make-string 75 ?*) "\\\n"))
;;   (insert " \*\n")
;;   (insert (format " \* Function %s\n" func))
;;   (insert " \*\n")
;;   (insert (concat "\\" (make-string 75 ?*) "/\n"))
;;   (insert (format "%s\n" func-str))
;;   (insert "{\n\n}\n")
;; )


