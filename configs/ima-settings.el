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

;; No GUI
(dolist (mode '(tool-bar-mode tooltip-mode scroll-bar-mode))
    (when (fboundp mode) (funcall mode -1)))

;; Some GUI
(dolist (mode '(column-number-mode size-indication-mode))
    (when (fboundp mode) (funcall mode 1)))

;; Scratch buffer configuration
(setq initial-scratch-message nil)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

(provide 'ima-settings)
;;; ima-settings ends here
