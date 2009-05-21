;;;
;;; $Id: .emacs,v 1.2 2004/05/03 16:03:05 roth Exp $
;;;

;;; Set some mail client variables
(setq mail-host-address "openavr.org")
(setq user-mail-address "troth@openavr.org")

;;; Add my load dir to the load path.
;(setq load-path (cons "/home/roth/local/share/elisp/" load-path))

;;; Use more advanced printing menu.
(require 'printing)
(pr-update-menus)

;;; Disable the toolbar that I never use and interferes with the mouse wheel
;;; by accidently "undoing" many things and then I can't get them back.
(tool-bar-mode -1)

;;; Don't beep. Use a visible bell instead.
(setq visible-bell t)

;;; Use ssh instead of rlogin
(setq rlogin-program "ssh")

;;; Show column number in mode line
(setq column-number-mode t)

;;; Enable scrolling with the mouse wheel
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progressive-speed nil)

;;; Default is to scroll one line at a time. Hold shift to scroll 5 lines at
;;; a time. Hold control to scroll 20 lines at a time.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control) . 20)))

;;; Scroll one line at a time
(setq scroll-step 1)

;;; Stay at end of line when moving cursor vertically
(setq track-eol t)

;;; No autosave
(setq auto-save-default nil)

;;; Don't make foo.~1.2~ cvs backups.
(setq version-control nil)
(setq vc-cvs-stay-local nil)

;;; Don't create a bunch of garbage files--- version control
;;; accomplishes much more, much more nicely
(setq make-backup-files nil)

;;; Don't add new lines when cursor downing at end of buffer
(setq next-line-add-newlines nil)

;;; kill-line with no arguments kill the whole line
(setq kill-whole-line t)

;;; Make sure that there is newline at the end of a file
(setq require-final-newline t)

;;; use text-mode by default
(setq default-major-mode 'text-mode)

;;; delete auto-save files when buffer is explicitly saved (should
;;; be redundant)
(setq delete-auto-save-files t)

;;; highlight incremental searches
(setq-default search-highlight t)

;;; Highlight marked region of text
(transient-mark-mode t)

;;; Whenever point is after a closing delimiter, that delimiter and its
;;; matching opening delimiter are both highlighted; otherwise, if point is
;;; before an opening delimiter, the matching closing delimiter is
;;; highlighted.
(show-paren-mode t)

;;; Replace highlighted text with what I type
(delete-selection-mode t)

;;; When compiling, stay at end of output
(setq compilation-scroll-output t)

;;; Stop compile command from using "make -k"
(setq compile-command "make")

;;; Set gdb command
(setq gud-gdb-command-name "arm-elf-gdb --annotate=3")

;;; Set default mode to latex-mode when editing a .tex file
(setq tex-default-mode (quote latex-mode))

;;; Tab width / tab stops / fill column
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 80
					  88 96 104 112 120 124 128 132))
(setq default-fill-column 78)

;;; Make F9 run the goto-line function for all modes
(global-set-key [f9] 'goto-line)

;;; quick access to compile function.
(global-set-key [f8] 'compile)

;;; Map some F-keys for commonly used functions when in text-mode
(global-set-key [f5] 'fill-paragraph)
(global-set-key [f6] 'fill-region)

;;; Predefine some global abbreviations
(define-abbrev-table 'global-abbrev-table
  '(("teh" "the" nil 1)))

(defun my-text-mode-hook ()
  ;; my custmizations for all of text-mode and related modes
  (abbrev-mode 1)
  (auto-fill-mode 1))

(add-hook 'text-mode-hook 'my-text-mode-hook)

;;; Predefine some texinfo mode abbreviations
(defvar texinfo-mode-abbrev-table nil
  "Abbrev table in use in Texinfo-mode buffers.")
(define-abbrev-table 'texinfo-mode-abbrev-table 
  '())

(defun my-texinfo-mode-hook ()
  ;; my custmizations for all of texinfo-mode
  (setq local-abbrev-table texinfo-mode-abbrev-table))

(add-hook 'texinfo-mode-hook 'my-texinfo-mode-hook)

;;;
;;; Set the font-lock colors
;;;
(setq font-lock-face-attributes
 '((font-lock-builtin-face       "DarkCyan")
   (font-lock-comment-face       "ForestGreen")
   (font-lock-constant-face      "SlateBlue")
   (font-lock-function-name-face "Blue")
   (font-lock-keyword-face       "Navy")
   (font-lock-string-face        "Red4")
   (font-lock-type-face          "Red")
   (font-lock-variable-name-face "DeepPink3")
   ;;;(sh-heredoc-face              "yellow1")
  ))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-warning-face ((t (:foreground "pink" :background "black"))))
 '(region ((t (:foreground "black" :background "gray60")))))

(setq font-lock-maximum-decoration t)

;;; Turn on font-lock-mode automatically for all modes
;;; (add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(global-font-lock-mode t)

;;;(require 'pycomplete)
;;;(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;;;(autoload 'python-mode "python-mode" "Python editing mode." t)
;;;(autoload 'pymacs-load "pymacs" nil t)
;;;(autoload 'pymacs-eval "pymacs" nil t)
;;;(autoload 'pymacs-apply "pymacs")
;;;(autoload 'pymacs-call "pymacs")
;;;(setq interpreter-mode-alist(cons '("python" . python-mode)
;;;                             interpreter-mode-alist))

(defun my-python-hook ()
  ;; my customizations for all of python and related modes
  (setq py-smart-indentation nil)
  (setq indent-tabs-mode nil)
  (setq py-indent-offset 4)
  (setq py-python-command "python"))

(add-hook 'python-mode-hook 'my-python-hook)

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

(defun my-asm-mode-hook ()
  ;; my customizations for all of asm-mode
  (setq tab-width 4
		;; this will make sure spaces are used instead of tabs
		indent-tabs-mode nil)
)

(add-hook 'asm-mode-hook 'my-asm-mode-hook)

;;;; I can't seem to make this work. :-(
;; Add nurpa-arm-mode.el to you load-path:
;;(setq load-path (cons '"/home/roth/.emacs.d" load-path))
;;(require 'nurpa-arm-mode)
;;(setq auto-mode-alist
;;      (append auto-mode-alist
;;              '(("\\.s$" . nurpa-arm-mode))))

;;;
;;; My custom functions
;;;

;;; Allow toggling tab-width between 2, 4 and 8
(defvar my-tab-width default-tab-width)
(defun toggle-tab-width ()
  "Toggle the tab width between 2, 4 and 8."
  (interactive)
  (cond
   ((= my-tab-width 2) (setq my-tab-width 4))
   ((= my-tab-width 4) (setq my-tab-width 8))
   ((= my-tab-width 8) (setq my-tab-width 2)))
  (setq tab-width my-tab-width)
  (redraw-display))

(global-unset-key [f1])
(global-set-key [f1] 'toggle-tab-width)

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

;; (global-unset-key [f12])
;; (global-set-key [f12] 'c-new-func)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(transient-mark-mode t))
