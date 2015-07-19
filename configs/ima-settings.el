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

;; Hide toolbar
(tool-bar-mode -1)

;; Allows syntax highlighting to work
(global-font-lock-mode 1)

;; Show line number
(global-linum-mode t)

;; Save buffer at end of session
(desktop-save-mode 1)

(provide 'ima-settings)
;;; ima-settings ends here
