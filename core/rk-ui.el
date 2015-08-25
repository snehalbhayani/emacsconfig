;; Theme
;; (setq spacemacs-theme-comment-bg nil)
;; (load-theme 'spacemacs-light t)
(load-theme 'monokai t)

;; Mode line theme
(powerline-default-theme)

;; Font
(set-frame-font "Source Code Pro 13")

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Start in maximized mode
(toggle-frame-maximized)

;; Show line number
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode +1)

;; Highlight matching parentheses
(show-paren-mode t)

;; Hide right fringe
;; (fringe-mode (quote (nil . 0)))

;; No GUI
(dolist (mode '(menu-bar-mode
                tool-bar-mode
                tooltip-mode
                scroll-bar-mode
                blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Some GUI
(dolist (mode '(column-number-mode))
  (when (fboundp mode) (funcall mode 1)))

;; Confirm before killing
(setq confirm-kill-emacs 'y-or-n-p)

;; Replace yes-no questions with y-n questions
(fset 'yes-or-no-p 'y-or-n-p)

;;; Timestamps in *Messages*
;; via http://www.reddit.com/r/emacs/comments/1auqgm/speeding_up_your_emacs_startup/
(defun current-time-microseconds ()
  (let* ((nowtime (current-time))
         (now-ms (nth 2 nowtime)))
    (concat (format-time-string "[%Y-%m-%dT%T" nowtime) (format ".%d] " now-ms))))

(defadvice message (before test-symbol activate)
  (if (not (string-equal (ad-get-arg 0) "%s%s"))
      (let ((inhibit-read-only t)
            (deactivate-mark nil))
        (with-current-buffer "*Messages*"
          (goto-char (point-max))
          (if (not (bolp))
              (newline))
          (insert (current-time-microseconds))))))

(provide 'rk-ui)
