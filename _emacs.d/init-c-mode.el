(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode and related modes
  (setq c-echo-syntactic-information-p 1)
  (setq c-basic-offset 4)
  (c-set-offset 'case-label 4)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  ;;;(setq c-font-lock-extra-types 
  ;;; (quote ("FILE" "\\sw+_t" "\\sw+_T" "byte" "word" "dword" "qword")))
  ;; other customizations can go here
  (setq tab-width 4
		;; this will make sure spaces are used instead of tabs
		indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  ;;(c-toggle-auto-hungry-state 1)
  ;;(c-toggle-auto-state nil)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

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


