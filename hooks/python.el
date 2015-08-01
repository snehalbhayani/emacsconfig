(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

(setq python-indent 4)

(defun rekenerd-python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'rekenerd-python-mode-hook)
