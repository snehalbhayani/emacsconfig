(add-hook 'after-init-hook
          #'(lambda ()
              (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))))

(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; Setup tern backend for auto-completion if ternjs is available
(require 'tern-auto-complete)
(require 'company-tern)

(setq tern-ac-on-dot nil)
(define-key tern-mode-keymap "." nil)
(add-to-list 'company-backends 'company-tern)

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
