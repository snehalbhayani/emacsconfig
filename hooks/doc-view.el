(defun rk/install-pdf-tools ()
  (setq doc-view-continuous t)
  (add-hook 'doc-view-mode-hook #'pdf-tools-install))

(add-hook 'after-init-hook #'rk/install-pdf-tools t)
