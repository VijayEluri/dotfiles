(defun google-region (start end)
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?q=" (buffer-substring start end))))

(global-set-key (kbd "\C-cg") 'google-region)

(defun define-region (start end)
  (interactive "r")
  (browse-url (concat "http://dictionary.reference.com/browse/" (buffer-substring start end))))

(global-set-key (kbd "\C-cr") 'define-region)

;;(defun format-code (start end)
;;  (interactive "r")
;;  (goto-char (point-min))
;;  (indent-region start end)
;;  (delete-blank-lines))

(defun generate-tag-file (directory)
  "Generate tag file."
  (interactive "DDirectory name: ")
  ;;(shell-command (format "ctags -fs %s/TAGS -e -R %s" directory directory)
  (eshell-command (format "find %s -type f -name \\*.java | xargs etags --language-force=Java" directory)))