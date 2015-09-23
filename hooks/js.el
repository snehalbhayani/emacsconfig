(add-hook 'after-init-hook
          #'(lambda ()
              (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))))

;; (eval-after-load 'js2-mode
;;   '(add-hook 'js2-mode-hook
;;              (lambda ()
;;                (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
