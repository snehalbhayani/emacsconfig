(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(set-face-attribute 'js2-error nil :underline "red" :foreground nil)

(setq js2-basic-offset 4)
(setq js2-indent-switch-body t)
(setq-default js2-global-externs '("module" "require" "setTimeout" "clearTimeout"
                                   "setInterval" "clearInterval" "console" "JSON"))

;; Enhancements for imenu
(js2-imenu-extras-mode)

;; Setup tern backend for auto-completion if ternjs is available
(require 'company-tern)
(defun rk/enable-tern ()
  (tern-mode t)
  (define-key tern-mode-keymap "." nil)
  (add-to-list 'company-backends 'company-tern))

;; Do not create port files
(setq tern-command '("tern" "--no-port-file"))

(add-hook 'js2-mode-hook #'rk/enable-tern)

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
