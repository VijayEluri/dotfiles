;; Emacs Eclim

;; (add-to-list 'load-path (concat lisp-directory "/emacs-eclim"))
;; (add-to-list 'load-path (concat lisp-directory "/emacs-eclim/vendor"))
;; (require 'eclim)

;; (setq eclim-auto-save t)
;; (global-eclim-mode)

;; (load "company-emacs-eclim")
;; (company-emacs-eclim-setup)

;; JDEE

(add-to-list 'load-path (concat lisp-directory "/jdee/lisp"))
(add-to-list 'load-path (concat global-load-path "/cedet/common"))
(load-file (concat global-load-path "/cedet/common/cedet.el"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/cogre"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/contrib"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/ede"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/eieio"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/semantic"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/speedbar"))
(add-to-list 'load-path (concat lisp-directory "/elib")) ;; deprecated
(add-to-list 'load-path (concat global-load-path "/ecb"))
(load-file (concat global-load-path "/ecb/ecb.el"))
;; (require 'ecb) ;; comment to defer loading with ecb-autoloads
(require 'ecb-autoloads)

(require 'jde) ;; comment to defer loading jde with autoload
(autoload 'jde-mode "jde-mode" "JDE Mode" t)
(setq auto-mode-alist (append '(("\\.java$" . jde-mode)) auto-mode-alist))

(defun my-jde-mode-hook ()
  (message "Loading my-jde-mode-hook...")

  (define-key c-mode-base-map "\C-ca" 'jde-javadoc-generate-javadoc-template)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'case-label '+)

  (c-add-style "my-java"
               '("java"
                 (c-basic-offset . 4)
                 (c-hanging-braces-alist . ())))
  (c-set-style "my-java")
  ;; (setq c-auto-newline t)
  (setq c-comment-continuation-starts "* "
        tab-width 4
        tempo-interactive t
        c-basic-offset 4)

  (flymake-mode t)
  (yas/minor-mode t)
  ;; (hs-minor-mode t)

  (message "...jde-mode-hook loaded."))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;; (run-at-time "9:00am" (* 60 60 24) 'jde-xref-make-xref-db)

;; (load-file (concat lisp-directory "/jdee-contrib/jde-eclipse-compiler-server.el"))
;; (require 'jde-eclipse-compiler-server)

;; (require 'compile)
;; (setq compilation-error-regexp-alist
;;       (append
;;        (list '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):" 1 2) ; javac
;;              '("^\\(.*\\):\\[\\([0-9]*\\),\\([0-9]*\\)\\]" 1 2 3)) ; maven
;;        compilation-error-regexp-alist))

(require 'flymake)

;; http://www.credmp.org/?p=54

;; (defun flymake-java-ecj-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy 'jde-ecj-create-temp-file))
;;          (local-file (file-relative-name temp-file (file-name-directory buffer-file-name))))
;;     (list "java" (list "-jar" "/usr/share/java/eclipse-ecj.jar"
;;                        "-classpath" (jde-build-classpath jde-global-classpath) "-sourcepath" (jde-build-classpath jde-sourcepath)
;;                        "-d" "/dev/null" "-source" "1.5" "-target" "1.5" "-proceedOnError" "-Xemacs"
;;                        local-file))))

(defun flymake-java-ecj-cleanup ()
  (flymake-safe-delete-file flymake-temp-source-file-name)
  (when flymake-temp-source-file-name
    (flymake-safe-delete-directory (file-name-directory flymake-temp-source-file-name))))

(push '(".+\\.java$" flymake-java-ecj-init flymake-java-ecj-cleanup) flymake-allowed-file-name-masks)
;; (push '("\\(.*?\\):\\([0-9]+\\): error: \\(.*?\\)\n" 1 2 nil 2 3 (6 compilation-error-face)) compilation-error-regexp-alist)
;; (push '("\\(.*?\\):\\([0-9]+\\): warning: \\(.*?\\)\n" 1 2 nil 1 3 (6 compilation-warning-face)) compilation-error-regexp-alist)

(defun jde-ecj-create-temp-file (file-name prefix)
  (file-truename (expand-file-name (file-name-nondirectory file-name)
                                   (expand-file-name (int-to-string (random)) (flymake-get-temp-dir)))))

(defun alepho/flymake-display-err-minibuf-for-current-line ()
  (interactive)
  (let* ((current-line-no (flymake-current-line-no))
         (err-info (nth 0 (flymake-find-err-info flymake-err-info current-line-no)))
         (count (length err-info)))
    (while (> count 0)
      (when err-info
        (let* ((file (flymake-ler-file (nth (1- count) err-info)))
               (full-file (flymake-ler-full-file (nth (1- count) err-info)))
               (text (flymake-ler-text (nth (1- count) err-info)))
               (line (flymake-ler-line (nth (1- count) err-info))))
          (message "[%s] %s" line text)))
      (setq count (1- count)))))

(defadvice flymake-goto-prev-error (after display-message activate compile)
  (alepho/flymake-display-err-minibuf-for-current-line))

(defadvice flymake-goto-next-error (after display-message activate compile)
  (alepho/flymake-display-err-minibuf-for-current-line))

(defadvice flymake-mode (before post-command-stuff activate compile)
  (set (make-local-variable 'post-command-hook)
       (cons 'alepho/flymake-display-err-minibuf-for-current-line post-command-hook)))

;; (add-to-list 'load-path (concat lisp-directory "/jdibug"))
;; (require 'jdibug)

;; (load "jde-junit")
;; (require 'jde-junit)

;; (add-to-list 'load-path (concat lisp-directory "/jdee-contrib"))
;; (require 'jsee)
;; (require 'jserial)
;; (require 'decompile)
