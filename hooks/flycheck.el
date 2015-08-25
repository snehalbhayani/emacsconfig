(add-hook 'after-init-hook #'global-flycheck-mode)

;; Check syntax automatically after a second of inactivity
(setq flycheck-idle-change-delay 1)

;; Disable syntax checking on newline
(with-eval-after-load 'flycheck
  (setq flycheck-check-syntax-automatically (delq 'new-line flycheck-check-syntax-automatically)))

;; Disable checkdoc warning
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;;; Underline only errors in buffer
;; Disable underlining provided by flycheck
(setq flycheck-highlighting-mode nil)

;; Add a custom function for underlining errors
(require 'flycheck)

(defun rekenerd-add-lines-for-errors (err)
  "Credit: https://github.com/iqbalansari"
  (flycheck-error-with-buffer err
    (when (equal (flycheck-error-level err) 'error)
      (pcase-let* ((`(,beg . ,end) (flycheck-error-region-for-mode
                                    err 'lines))
                   (overlay (make-overlay beg end))
                   (level (flycheck-error-level err))
                   (category (flycheck-error-level-overlay-category level)))
        (overlay-put overlay 'flycheck-overlay t)
        (overlay-put overlay 'flycheck-error err)
        (overlay-put overlay 'category category)
        (when flycheck-indication-mode
          (overlay-put overlay 'before-string
                       (flycheck-error-level-make-fringe-icon
                        level flycheck-indication-mode)))
        (overlay-put overlay 'help-echo (flycheck-error-message err))
        overlay))))

(with-eval-after-load 'flycheck
  (add-to-list 'flycheck-process-error-functions #'rekenerd-add-lines-for-errors))

;; Enable flycheck-cask
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))
