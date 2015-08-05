(defun rekenerd-install-pdf-tools ()
  (setq doc-view-continuous t)
  (add-hook 'doc-view-mode-hook #'pdf-tools-install))

(add-hook 'after-init-hook #'rekenerd-install-pdf-tools t)
