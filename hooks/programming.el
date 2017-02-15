(defun rk/font-lock-comment-annotations ()
  "credit: https://github.com/bbatsov
   Highlight a bunch of well known comment annotations.
   This functions should be added to the hooks of major modes for programming."
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\)\\)"
          1 font-lock-warning-face t))))

(defun rk/prog-mode-defaults ()
  (eldoc-mode t)
  (rk/font-lock-comment-annotations))

(add-hook 'prog-mode-hook 'rk/prog-mode-defaults)
