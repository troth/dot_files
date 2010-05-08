;;; Map some F-keys for commonly used functions when in text-mode

;;; Paragraph filling.
(global-set-key [f5] 'fill-paragraph)
(global-set-key [f6] 'fill-region)

;;; quick access to compile function.
(global-set-key [f8] 'compile)

;;; Make F9 run the goto-line function for all modes
(global-set-key [f9] 'goto-line)

;; (global-unset-key [f12])
;; (global-set-key [f12] 'c-new-func)
