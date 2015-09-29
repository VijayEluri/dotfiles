;;; Functions
;;

(defun google-region (start end)
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?q=" (buffer-substring start end))))

;; (global-set-key (kbd "\C-cg") 'google-region)

(defun define-region (start end)
  (interactive "r")
  (browse-url (concat "http://dictionary.reference.com/browse/" (buffer-substring start end))))

;; (global-set-key (kbd "\C-cd") 'define-region)

(defun synonymize-region (start end)
  (interactive "r")
  (browse-url (concat "http://thesaurus.com/browse/" (buffer-substring start end))))

;; (global-set-key (kbd "\C-cs") 'synonymize-region)

(defun translate-region (start end)
  (interactive "r")
  (browse-url (concat "http://translate.google.com/#auto|en|" (buffer-substring start end))))

;; (global-set-key (kbd "\C-ct") 'translate-region)

(defun format-buffer ()
  (interactive)
  (format-region (point-min) (point-max)))

(defun format-region (start end)
  (interactive "r")
  (save-excursion
    (indent-region start end)
    (delete-trailing-whitespace start end)
    (untabify start end))
  (delete-trailing-whitespace))

(global-set-key "\C-cf" 'format-buffer)

(defun generate-lisp-tags ()
  (let ((version (int-to-string (+ emacs-major-version (/ emacs-minor-version 10.0)))))
    (generate-tag-file (concat "/usr/share/emacs/" version "/lisp"))
    (visit-tags-table (concat emacs-directory "/TAGS"))))

;; find . -name \"*.[chCH]\" -print | etags -
;; ctags -e -R .
(defun generate-c-tags (directory)
  "Generate TAGS file."
  (interactive "DDirectory name: ")
  (shell-command (format "cd %s && find . -name \"*.[chCH]\" -print | etags -" directory)))

(defun generate-etags-file (directory)
  "Generate TAGS file."
  (interactive "DDirectory name: ")
  (shell-command (format "cd %s && etags `find . -name '*.java'`" directory)))

(defun generate-gtags-file (directory)
  "Generate GLOBAL TAGS file."
  (interactive "DDirectory name: ")
  (shell-command (format "cd %s && gtags -I && htags --suggest && mkid" directory)))

(defun generate-refactory (directory)
  "Generate refactory."
  (interactive "DDirectory name: ")
  (generate-etags-file directory)
  (generate-cscope-file directory)
  ;; (generate-gtags-file directory)
  )

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

;; Deprecated by ELPA.
;;
;; (defun find-mode-path (name)
;;   (let ((search-path (list (expand-file-name "~/.emacs.d/")
;;                            (expand-file-name "~/.emacs.d/lisp/")
;;                            (expand-file-name "~/.emacs.d/site-lisp/")
;;                            (expand-file-name "/usr/share/emacs/site-lisp/"))))
;;     (flet ((f (name search-path)
;;               (when search-path
;;                 (let ((path (concat (car search-path) name)))
;;                   (if (file-directory-p path)
;;                       path
;;                     (f name (cdr search-path)))))))
;;       (f name search-path))))
;;
;; (defmacro with-this-mode (name &rest body)
;;   "It's `path'-clobbering time!"
;;   `(let ((path (find-mode-path ,name)))
;;      (when path
;;        (add-to-list 'load-path path)
;;        ,@body)))
