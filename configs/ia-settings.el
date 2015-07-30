;; Theme
(setq spacemacs-theme-comment-bg nil)
(load-theme 'spacemacs-dark t)

(powerline-default-theme)

;; Font
(set-frame-font "Source Code Pro 13")

;; Start in maximized mode
(toggle-frame-maximized)

;; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; Show line number
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; Save buffer at end of session
(setq desktop-restore-frames nil)
(desktop-save-mode 1)

;; Stop on error
;; (setq debug-on-error t)

;; No GUI
(dolist (mode '(menu-bar-mode tool-bar-mode tooltip-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Some GUI
(dolist (mode '(column-number-mode))
    (when (fboundp mode) (funcall mode 1)))

;; projectile
(require 'projectile)
(require 'grizzl)
(projectile-global-mode)
;; (setq projectile-enable-caching nil)
(setq projectile-indexing-method 'alien)
(setq projectile-use-git-grep t)
(setq projectile-completion-system 'grizzl)

;; Pallet
(require 'pallet)
(pallet-mode t)

;; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; magit
(setq magit-last-seen-setup-instructions "2.1.0")

;; smex
(require 'smex)
(smex-initialize)

;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set guru mode
(guru-global-mode +1)

;; Enable company mode
(global-company-mode t)

;; diff-hl
(global-diff-hl-mode)

;; which-key
(which-key-mode)
(which-key-setup-side-window-right)

;; Scratch buffer configuration
(setq initial-scratch-message nil)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))

;; UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; confirm before killing
(setq confirm-kill-emacs 'y-or-n-p)

;; Replace yes-no questions with y-n questions
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'ia-settings)
