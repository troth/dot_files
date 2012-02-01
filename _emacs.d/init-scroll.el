;;; Put the scrollbars on the right.
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

;;; Enable scrolling with the mouse wheel
(mouse-wheel-mode t)
(setq mouse-wheel-follow-mouse t)
(setq mouse-wheel-progressive-speed nil)

;;; Default is to scroll one line at a time. Hold shift to scroll 5 lines at
;;; a time. Hold control to scroll 20 lines at a time.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5) ((control) . 20)))

;;; Scroll one line at a time
(setq scroll-step 1)

