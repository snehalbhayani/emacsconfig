(add-hook 'after-init-hook
          #'(lambda ()
              (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))))

;; Setup tern backend for auto-completion if ternjs is available
(require 'company-tern)
(defun rk/enable-tern ()
  (tern-mode t)
  (define-key tern-mode-keymap "." nil)
  (add-to-list 'company-backends 'company-tern))

(add-hook 'js2-mode-hook #'rk/enable-tern)

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
