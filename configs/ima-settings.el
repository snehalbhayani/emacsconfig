;;; package --- summary

;;; Commentary:
;; General Settings

;;; Code:

;; Theme
(load-theme 'zenburn t)

;; Font
(set-frame-font "Source Code Pro 13")

;; Start in maximized mode
(toggle-frame-maximized)

;; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; Show line number
(global-linum-mode t)

;; Save buffer at end of session
(desktop-save-mode 1)

;; stop on error
(setq debug-on-error t)

;; No GUI
(dolist (mode '(tool-bar-mode tooltip-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Some GUI
(dolist (mode '(column-number-mode))
    (when (fboundp mode) (funcall mode 1)))

;; projectile
(require 'projectile)
(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)
(setq projectile-use-git-grep t)

;; Pallet
(require 'pallet)
(pallet-mode t)

;; magit
(setq magit-last-seen-setup-instructions "2.1.0")

;; smex
(require 'smex)
(smex-initialize)

;; Trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set guru mode
(guru-global-mode +1)

;;; Enable company mode
(global-company-mode t)
;; Don't downcase completions by company mode
(add-hook 'company-mode-hook '(lambda ()
                                (setq company-dabbrev-downcase nil)
                                (setq company-dabbrev-ignore-case nil)
                                ))

;;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;; Check syntax automatically after a second of inactivity
(setq flycheck-idle-change-delay 1)
;; Disable syntax checking on newline
(eval-after-load 'flycheck
  '(setq flycheck-check-syntax-automatically (delq 'new-line flycheck-check-syntax-automatically)))
;; Disable checkdoc warning
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; diff-hl
(global-diff-hl-mode)

;; Scratch buffer configuration
(setq initial-scratch-message nil)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

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

(provide 'ima-settings)
;;; ima-settings ends here
