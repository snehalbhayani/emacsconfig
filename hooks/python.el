(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

(defun rekenerd-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (setq tab-width 4))

(add-hook 'python-mode-hook 'rekenerd-python-mode-hook)
