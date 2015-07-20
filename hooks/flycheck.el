(add-hook 'after-init-hook #'global-flycheck-mode)
;; Check syntax automatically after a second of inactivity
(setq flycheck-idle-change-delay 1)
;; Disable syntax checking on newline
(eval-after-load 'flycheck
  '(setq flycheck-check-syntax-automatically (delq 'new-line flycheck-check-syntax-automatically)))
;; Disable checkdoc warning
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))
