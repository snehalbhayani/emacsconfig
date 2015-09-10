(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(require 'jedi)
;; (setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
(add-hook 'python-mode-hook 'jedi:setup)

(setq python-indent 4)
