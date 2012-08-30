(set-background-color "#EBE6E2")

(set-default-font "Monospace-8")

(require 'whitespace)

;;; Disable the annoying splash screen.
(setq inhibit-startup-message t)

;;; Disable the toolbar that I never use and interferes with the mouse wheel
;;; by accidently "undoing" many things and then I can't get them back.
(tool-bar-mode -1)

;;; Don't beep. Use a visible bell instead.
(setq visible-bell t)

;;; Show column number in mode line
(setq column-number-mode t)

;;; Stay at end of line when moving cursor vertically
(setq track-eol t)

;;; No autosave
(setq auto-save-default nil)

;;; Don't make foo.~1.2~ cvs backups.
;(setq version-control nil)
;(setq vc-cvs-stay-local nil)

;;; Don't create a bunch of garbage files--- version control
;;; accomplishes much more, much more nicely
(setq make-backup-files nil)

;;; Don't add new lines when cursor downing at end of buffer
(setq next-line-add-newlines nil)

;;; kill-line with no arguments kill the whole line
(setq kill-whole-line t)

;;; Make sure that there is newline at the end of a file
(setq require-final-newline t)

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

;;; Tab width / tab stops / fill column
(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 80
					  88 96 104 112 120 124 128 132))
(setq fill-column 78)

;;; Turn on font-lock-mode automatically for all modes
;;; (add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
;(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
