;; Enable company mode
(require 'company)
(setq company-idle-delay 0.5
      company-tooltip-limit 10
      company-minimum-prefix-length 2
      company-tooltip-flip-when-above t)

(setq company-global-modes '(not erlang-mode python-mode))

(setq rekenerd-default-company-backends '(company-capf company-dabbrev company-files))
(setq-default company-backends rekenerd-default-company-backends)

(make-variable-buffer-local 'company-backends)
(global-company-mode)
