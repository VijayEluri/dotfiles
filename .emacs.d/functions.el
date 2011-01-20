(defun google-region (start end)
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?q=" (buffer-substring start end))))

(global-set-key (kbd "\C-cg") 'google-region)

(defun define-region (start end)
  (interactive "r")
  (browse-url (concat "http://dictionary.reference.com/browse/" (buffer-substring start end))))

(global-set-key (kbd "\C-cr") 'define-region)

(defun lookup-region (start end)
  (interactive "r")
  (browse-url (concat "http://thesaurus.com/browse/" (buffer-substring start end))))

(global-set-key (kbd "\C-ct") 'lookup-region)

(defun format-code (start end)
  (interactive "r")
  (save-excursion
    ;; (mark-whole-buffer)
    (indent-region start end)
    (delete-trailing-whitespace)
    (delete-blank-lines)
    (untabify start end)))

(global-set-key "\C-cf" 'format-code)

(defun generate-tag-file (directory)
  "Generate tag file."
  (interactive "DDirectory name: ")
  ;; (shell-command (format "ctags -fs %s/TAGS -e -R %s" directory directory)
  (eshell-command (format "find %s -type f -name \\*.java | xargs etags --language-force=Java" directory)))

(defun open-class-file (class-file jar-file)
  ;; e.g. unzip -p ./lib/jar-file.jar class-file.class
  ;; find *.jar, jar tf {}, grep class.class
  ;; find ./lib/ -iname \*.jar -exec unzip -l {} \;
  (let ((jar-command "unzip -p")
        (buffer (get-buffer-create class-file)))
    (set-buffer buffer)
    (insert (eshell-command-result (concat jar-command " " jar-file " " class-file)))
    (jdc-buffer)
    (set-window-buffer (selected-window) buffer)
    (beginning-of-buffer)))
