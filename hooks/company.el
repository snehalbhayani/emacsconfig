;; Enable company mode
(require 'company)
(setq company-idle-delay 0.5)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-flip-when-above t)
(global-company-mode t)

;; Don't downcase completions by company mode
(add-hook 'company-mode-hook '(lambda ()
                                (setq company-dabbrev-downcase nil)
                                (setq company-dabbrev-ignore-case nil)))

(add-hook 'after-init-hook 'global-company-mode)
