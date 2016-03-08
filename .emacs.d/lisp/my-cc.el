;;; C, C++, Java
;;

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
  (flymake-mode-off))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun my-c-mode-hook ()
  (c-set-style "k&r")
  (c-turn-on-eldoc-mode)
  (add-hook 'before-save-hook 'my-astyle-hook nil t))

(add-hook 'c-mode-hook 'my-c-mode-hook)

(defun my-c++-mode-hook ()
  (c-set-style "stroustrup")
  (c-turn-on-eldoc-mode)
  (add-hook 'before-save-hook 'my-astyle-hook nil t))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(defun my-java-mode-hook ()
  (c-set-style "java")
  (add-hook 'before-save-hook 'my-astyle-hook nil t))

(add-hook 'java-mode-hook 'my-java-mode-hook)

;; (defconst my-java-style
;;   '("java"
;;     (c-basic-offset . 4)
;;     (c-electric-flag . t)
;;     (c-tab-always-indent . t)
;;     (c-echo-syntactic-information-p . t)
;;     (c-report-syntactic-errors . t)))

;; (c-add-style "my-java-style" my-java-style)

(defconst my-indentation-styles
  '("gnu" "k&r" "bsd" "stroustrup" "linux" "java"))

(defun my-astyle-hook ()
  (interactive)
  (let ((point (point)))
    (my-astyle-hook-region (point-min) (point-max))
    (goto-char point)))

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
       (get-buffer-create "*AStyle Errors*") t))))
;; )

(defun my-astyle-mode ()
  (let ((mode (file-name-extension buffer-file-name)))
    (cond ((string= mode "h") "c")
          ((string= mode "c") mode)
          ((string= mode "cpp") "c")
          ((string= mode "java") mode)
          (t nil))))

;; (add-to-list 'load-path (concat emacs-directory "site-lisp/elib"))

(defun my-jdee-mode-hook ()
  (add-to-list 'load-path (concat emacs-directory "site-lisp/jdee"))
  (require 'jdee)
  (require 'jdee-ant)
  (require 'jdee-junit)

  ;; (add-hook 'write-contents-functions 'my-jdee-before-save-hook nil t))
)

;; (add-hook 'java-mode-hook 'my-jdee-mode-hook)
(my-jdee-mode-hook)

(defun my-jdee-before-save-hook ()
  (interactive)
  (jdee-import-all)
  (jdee-import-kill-extra-imports)
  (jdee-import-organize))

(defun my-eclim-mode-hook ()
  (require 'eclim)
  (global-eclim-mode)
  (require 'eclimd)

  (setq eclim-eclipse-dirs '("/usr/lib/eclipse" "~/local/eclipse"))
  (setq eclim-executable "~/.eclipse/org.eclipse.platform_4.5.2_155965261_linux_gtk_x86/eclim")
  (setq eclimd-executable "~/.eclipse/org.eclipse.platform_4.5.2_155965261_linux_gtk_x86/eclimd")
  (setq eclim-default-workspace "~/workspace")
  (setq eclim-wait-for-process nil)

  ;; M-x display-local-help
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)

  (require 'ac-emacs-eclim-source)
  (ac-emacs-eclim-config)

  (require 'company-emacs-eclim)
  (company-emacs-eclim-setup)
  (global-company-mode t))

;; (add-hook 'java-mode-hook 'my-eclim-mode-hook)
(my-eclim-mode-hook)
;; (start-eclimd "~/workspace")

(add-to-list 'load-path "~/local/global")
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'gtags-mode-hook
          '(lambda ()
             (define-key gtags-mode-map "\M-." 'gtags-find-tag-from-here)
             (define-key gtags-mode-map "\C-M-." 'gtags-find-tag-pattern)
             (define-key gtags-mode-map "\M-*" 'gtags-pop-stack)))

(add-to-list 'load-path "~/local/idutils/lisp")
(autoload 'gid "idutils" nil t)

(setq cscope-program "gtags-cscope")
(require 'xcscope)
(cscope-setup)

;; TODO

(semantic-mode 1)

(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;;
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-unmatched-syntax-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-show-parser-state-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-highlight-edits-mode)

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

(require 'semantic/java)

;; (require 'ecb-autoloads)

(global-ede-mode 1)

;; (w3m-goto-url-new-session "http://docs.oracle.com/javase/8/docs/api/")
;; (w3m-goto-url-new-session "https://docs.oracle.com/javase/specs/jls/se8/html/index.html")
;; (w3m-goto-url-new-session "http://docs.oracle.com/javase/specs/jvms/se8/html/index.html")
