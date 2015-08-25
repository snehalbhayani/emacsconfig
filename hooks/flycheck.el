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

;; Change flycheck face to use straight lines instead of wavy lines
(defun rekenerd-flycheck-use-straight-lines ()
  "Credit: https://github.com/iqbalansari"
  (when (display-graphic-p)
    (let ((error-color (plist-get (face-attribute 'flycheck-error :underline) :color))
          (warning-color (plist-get (face-attribute 'flycheck-warning :underline) :color))
          (info-color (plist-get (face-attribute 'flycheck-info :underline) :color)))
      (set-face-attribute 'flycheck-error nil :underline (list :style 'line :color error-color))
      (set-face-attribute 'flycheck-warning nil :underline (list :style 'line :color warning-color))
      (set-face-attribute 'flycheck-info nil :underline (list :style 'line :color info-color)))))

(add-hook 'flycheck-mode-hook #'rekenerd-flycheck-use-straight-lines)

;; Enable flycheck-cask
(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))
