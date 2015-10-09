(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))

;; make web-mode play nice with smartparens
(setq web-mode-enable-auto-pairing nil)

;; (eval-after-load 'json-mode
;;   '(add-hook 'json-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; (eval-after-load 'css-mode
;;   '(add-hook 'css-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

(dolist (hook '(css-mode-hook html-mode-hook))
  (add-hook hook 'rainbow-mode))
