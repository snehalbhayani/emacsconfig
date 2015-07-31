;; Theme
(setq spacemacs-theme-comment-bg nil)
(load-theme 'spacemacs-light t)
;; (load-theme 'zenburn t)

;; Mode line theme
(powerline-default-theme)

;; Font
(set-frame-font "Source Code Pro 13")

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Start in maximized mode
(toggle-frame-maximized)

;; Show line number
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; No GUI
(dolist (mode '(menu-bar-mode
                tool-bar-mode
                tooltip-mode
                scroll-bar-mode
                blink-cursor-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Some GUI
(dolist (mode '(column-number-mode))
    (when (fboundp mode) (funcall mode 1)))

;; Confirm before killing
(setq confirm-kill-emacs 'y-or-n-p)

;; Replace yes-no questions with y-n questions
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'rk-ui)
