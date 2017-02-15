(require 'projectile)
(add-hook 'after-init-hook #'projectile-global-mode)

(setq projectile-indexing-method 'alien)
(setq projectile-use-git-grep t)

;; Custom projectile completion
(defun rejeep-projectile-completion-fn (prompt choises)
  "Projectile completion function that only shows file name.
   If two files have same name, new completion appears to select between
   them. These include the path relative to the project root.
   credit: https://gist.github.com/rejeep/5933343"
  (interactive)
  (let* ((stripped-choises
          (-uniq (--map (file-name-nondirectory (directory-file-name it)) choises)))
         (choise
          (completing-read prompt stripped-choises))
         (matching-files
          (-filter
           (lambda (file)
             (equal (file-name-nondirectory (directory-file-name file)) choise))
           choises)))
    (if (> (length matching-files) 1)
        (completing-read prompt matching-files)
      (car matching-files))))

(setq projectile-completion-system 'rejeep-projectile-completion-fn)
