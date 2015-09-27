(require 'doc-view)
(setq doc-view-continuous t)

(defun rk/install-pdf-tools ()
  (add-hook 'doc-view-mode-hook #'pdf-tools-install))

(add-hook 'after-init-hook #'rk/install-pdf-tools t)
