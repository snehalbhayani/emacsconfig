(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=149"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)

;; Disable eldoc for python mode
(add-hook 'python-mode-hook (lambda () (eldoc-mode -1)))
