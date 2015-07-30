;; Don't downcase completions by company mode
(add-hook 'company-mode-hook '(lambda ()
                                (setq company-dabbrev-downcase nil)
                                (setq company-dabbrev-ignore-case nil)
                                ))
(add-hook 'after-init-hook 'global-company-mode)
