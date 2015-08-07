(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-hook 'yaml-mode-hook 'whitespace-mode)
(add-hook 'yaml-mode-hook 'subword-mode)
