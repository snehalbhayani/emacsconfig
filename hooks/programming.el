(defun rekenerd-font-lock-comment-annotations ()
  "credit: https://github.com/bbatsov"
  (font-lock-add-keywords
   nil '(("\\<\\(\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):\\)"
          1 font-lock-warning-face t))))

(defun rekenerd-prog-mode-defaults ()
  (rekenerd-font-lock-comment-annotations))

(add-hook 'prog-mode-hook 'rekenerd-prog-mode-defaults)
