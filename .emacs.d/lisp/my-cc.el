;;; C, C++, Java
;;

;;
;; M-x gtags-find-tag-from-here, -find-tag, -find-rtag, -find-symbol, -find-pattern, -find-with-grep, -find-file, -find-with-idutils
;; M-x ggtags-find-tag-dwim, -find-definition, -find-reference, -find-other-symbol, -find-tag-regexp, -find-file, -idutils-query
;; M-x cscope-find-this-symbol, -find-global-definition, -find-called-functions, -find-functions-calling-this-function
;;           -find-this-text-string, -find-egrep-pattern, -find-this-file, -find-files-including-file, -find-assignments-to-this-symbol
;;

(add-to-list 'load-path "~/local/global-6.4")
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'gtags-mode-hook
          '(lambda ()
             ;; (setq gtags-path-style 'relative)
             (define-key gtags-mode-map "\M-." 'gtags-find-tag-from-here)
             (define-key gtags-mode-map "\C-M-." 'gtags-find-tag-pattern)
             ;; (define-key gtags-mode-map "\M-," 'gtags-continue-loop)
             (define-key gtags-mode-map "\M-*" 'gtags-pop-stack)))

(add-to-list 'load-path "~/local/idutils-4.6/lisp")
(autoload 'gid "idutils" "run idutils' gid command" t)

(setq cscope-program "gtags-cscope")
(require 'xcscope)
(cscope-setup)

;; (require 'ascope)
;;
;; (global-set-key "\C-c s d" 'ascope-find-global-definition)
;; (global-set-key "\C-c s s" 'ascope-find-this-symbol)
;; (global-set-key "\C-c s t" 'ascope-find-this-text-string)
;; (global-set-key "\C-c s c" 'ascope-find-functions-calling-this-function)
;; (global-set-key "\C-c s C" 'ascope-find-called-functions)
;; (global-set-key "\C-c s i" 'ascope-find-files-including-file)
;; ascope-all-symbol-assignments
;; ascope-clear-overlay-arrow
;; (global-set-key "\C-c s u" 'ascope-pop-mark)

;; (setq cscope-use-relative-paths t
;;       cscope-index-recursively t
;;       cscope-do-not-update-database nil
;;       cscope-display-cscope-buffer t)

;; (require 'ecb-autoloads)

(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))

(add-hook 'c-initialization-hook 'my-c-initialization-hook)

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 4)
  (setq c-default-style '((c-mode . "k&r")
                          (c++-mode . "stroustrup")
                          (java-mode . "java")
                          (awk-mode . "awk")
                          (other . "linux")))
  (setq-default c-electric-flag t)

  (setq c-tab-always-indent t)
  (setq indent-tabs-mode nil)

  (c-toggle-electric-state 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (subword-mode 1)
  (c-toggle-syntactic-indentation 1)

  ;; (setq c-require-final-newline t)
  (setq c-echo-syntactic-information-p t
        c-report-syntactic-errors t)

  (gtags-mode 1)
  ;; (when (derived-mode-p 'c-mode 'c++-mode 'java-mode) ...
  ;; (ggtags-mode 1)
  (cscope-minor-mode 1)
  (flymake-mode-on))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-c-mode-hook ()
  (c-set-style "k&r")
  (c-turn-on-eldoc-mode)
  (add-hook 'before-save-hook 'my-astyle-hook))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(defun my-c++-mode-hook ()
  (c-set-style "stroustrup")
  (c-turn-on-eldoc-mode)
  (add-hook 'before-save-hook 'my-astyle-hook))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun my-java-mode-hook ()
  (c-set-style "java")
  (flymake-mode-off)
  (add-hook 'before-save-hook 'my-astyle-hook))

(add-hook 'java-mode-hook 'my-java-mode-hook)

(defconst my-indentation-styles
  '("gnu" "k&r" "bsd" "stroustrup" "linux" "java"))

(defun my-astyle-hook ()
  (interactive)
  (my-astyle-hook-region (point-min) (point-max)))

;; (let ((my-indentation-styles
;;        '("gnu" "k&r" "bsd" "stroustrup" "linux" "java")))
(defun my-astyle-hook-region (start end)
  (interactive "r")
  (when (and (my-astyle-mode)
             (member c-indentation-style my-indentation-styles))
    (save-excursion
      (shell-command-on-region
       start end
       (format "astyle --style=\"%s\" --indent=spaces=%d --indent-namespaces --indent-labels --indent-col1-comments --pad-oper --pad-header --unpad-paren --align-pointer=name --align-reference=name --add-brackets --convert-tabs --mode=%s"
               c-indentation-style
               c-basic-offset
               (my-astyle-mode))
       (current-buffer) t
       (get-buffer-create "*AStyle Errors*") t))
    ;; (format-buffer)
    ))
;; )

(defun my-astyle-mode ()
  (let ((mode (file-name-extension buffer-file-name)))
    (cond ((string= mode "java") mode)
          ((string= mode "cs") mode)
          ((string= mode "c") mode)
          ((string= mode "h") "c")
          ((string= mode "cpp") "c")
          (t nil))))

;; (defconst my-java-style
;;   '("java"
;;     (c-basic-offset . 4)
;;     (c-electric-flag . t)
;;     (c-tab-always-indent . t)
;;     (c-echo-syntactic-information-p . t)
;;     (c-report-syntactic-errors . t)))

;; (c-add-style "my-java-style" my-java-style)

;; ;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/common"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/contrib"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/ede"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/eieio"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/semantic"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/speedbar"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/cedet/srecode"))
;; ;; (load-file (concat emacs-directory "site-lisp/cedet/common/cedet.el"))
;;
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/elib"))

(defun my-jdee-mode-hook ()
  (add-to-list 'load-path (concat emacs-directory "site-lisp/jdee"))
  ;; (autoload 'jde-mode "jde-mode" "JDE Mode" t)
  ;; (setq auto-mode-alist (append '(("\\.java$" . jde-mode)) auto-mode-alist))
  ;; (add-to-list 'auto-mode-alist '("\\.java$" . jde-mode))
  (require 'jdee)
  (require 'jdee-ant)
  (require 'jdee-junit))

(add-hook 'java-mode-hook 'my-jdee-mode-hook)

;; (defun my-java-before-save-hook
;;   (jde-import-kill-extra-imports)
;;   (jde-import-all)
;;   (jde-import-organize))

;; (require 'eclim)
;; (global-eclim-mode)

;; (require 'eclimd)

;; (setq eclim-eclipse-dirs "~/local/eclipse")
;; (setq eclim-executable "~/local/eclipse/eclim")
;; (setq eclim-default-workspace "~/workspaces/java")
;; (setq eclim-wait-for-process t)
;; (start-eclimd "~/workspaces/java")

;; M-x display-local-help
;; (setq help-at-pt-display-when-idle t)
;; (setq help-at-pt-timer-delay 0.1)
;; (help-at-pt-set-timer) ;; M-x display-local-help

;; (define-key eclim-mode-map "\C-c\C-v\C-b" 'eclim-project-build)
;; (define-key eclim-mode-map "\C-c\C-v\C-r" 'eclim-run-class)
;; (define-key eclim-mode-map "\C-c\C-v\C-j" 'eclim-run-java-doc)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;;
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)

(semantic-mode 1)

(require 'semantic/ia)
;; (when (cedet-gnu-global-version-check t)
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
;;   (semanticdb-enable-gnu-global-databases 'c++-mode)
;;   (semanticdb-enable-gnu-global-databases 'java-mode))
;; (when (cedet-ectag-version-check t)
;;   (semantic-load-enable-primary-exuberant-ctags-support))

(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
(semantic-add-system-include "/usr/include/boost")

;; (require 'semantic/db-javap)

(global-ede-mode 1)

;; (w3m-goto-url-new-session "http://docs.oracle.com/javase/6/docs/api/")
;; (w3m-goto-url-new-session "http://java.sun.com/docs/books/jls/third_edition/html/j3TOC.html")
;; (w3m-goto-url-new-session "http://java.sun.com/docs/books/jvms/second_edition/html/VMSpecTOC.doc.html")
