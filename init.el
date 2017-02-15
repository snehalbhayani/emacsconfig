;; Ensure we are using atleast GNU Emacs 24.4
(when (version< emacs-version "24.4")
  (error "Requires at least GNU Emacs 24.4, but you're running %s. Please upgrade and try again!" emacs-version))

;; Initialize cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Initialize pallet
(require 'pallet)
(pallet-mode t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Activate installed packages
(package-initialize)

;; Enable async byte compilation for all packages
(require 'async-bytecomp)
(setq async-bytecomp-allowed-packages '(all))
(async-bytecomp-package-mode)

;; Always load newest byte code
(setq load-prefer-newer t)

;; Enable auto-compile mode
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

;; Enable all disabled commands
(setq disabled-command-function nil)

;; Fix load path
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Increase the frequency of garbage collection
(setq gc-cons-threshold (* 128 1024 1024))

;; Warn when opening files bigger than 100MB
(setq large-file-warning-threshold (* 100 1024 1024))

(projectile-global-mode)
(setq projectile-require-project-root nil)

(require 'helm-projectile)
(helm-projectile-on)

;; Set path
;; (defvar root-dir (file-name-directory load-file-name))
(defvar root-dir "~/.emacs.d")
(defvar core-dir (concat root-dir "/core"))
(defvar hooks-dir (concat root-dir "/hooks"))
(defvar lang-dir (concat root-dir "/lang"))
(defvar custom-dir (concat root-dir "/custom"))

(add-hook 'js2-mode-hook #'setup-tide-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; format options
(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))
;; Load core files
(add-to-list 'load-path core-dir)

(require 'package)
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)

(setq ac-math-unicode-in-math-p t)

(defun nolinum ()
  (global-linum-mode 0)
)
(add-hook 'org-mode-hook 'nolinum)

(require 'rk-ui)
(require 'rk-editor)
(require 'rk-windows)
(require 'rk-keybindings)
(require 'switch-window)

(global-set-key (kbd "C-x o") 'switch-window)


(mapc 'load (directory-files hooks-dir t "\\.el\\'"))
(mapc 'load (directory-files lang-dir t "\\.el\\'"))
(mapc 'load (directory-files custom-dir t "\\.el\\'"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-candidate-face ((t (:inherit popup-face :foreground "yellow"))))
 '(font-lock-comment-face ((t (:foreground "lemon chiffon" :inverse-video nil :underline nil :slant italic :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue1" :inverse-video nil :underline nil :slant normal :weight normal))))
 '(font-lock-string-face ((t (:foreground "lemon chiffon" :inverse-video nil :underline nil :weight bold))))
 '(sp-show-pair-match-face ((t (:inherit show-paren-match :foreground "turquoise3")))))
