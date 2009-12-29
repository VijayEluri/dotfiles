(add-to-list 'load-path "/usr/share/emacs/site-lisp/jde")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet-common")
(load-file "/usr/share/emacs/site-lisp/cedet-common/cedet.el")
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet-cogre")
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet-contrib")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/eieio")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/speedbar")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/semantic")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/elib")
;;(require 'jde) ;; comment to defer loading jde with autoload

(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
;;(load-file "/usr/share/emacs/site-lisp/ecb/ecb.el")
;;(require 'ecb) ;; comment to defer loading with ecb-autoloads
(require 'ecb-autoloads)
;; M-x ecb-activate, ecb-minor-mode, ecb-show-help, ecb-byte-compile

;;(autoload 'java-mode "java-mode" "Java Mode" t nil)
(autoload 'jde-mode "jde-mode" "JDE Mode" t)
(setq auto-mode-alist (append '(("\\.java$" . jde-mode)) auto-mode-alist))

(defun my-jde-mode-hook
  (message "Loading my-jde-mode-hook...")

  (define-key c-mode-base-map "\C-ca" 'jde-javadoc-generate-javadoc-template)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'case-label '+)

  ;;(fset 'my-javadoc-code ...)

  (abbrev-mode t)

  (c-add-style "my-java"
	       '("java"
		 (c-basic-offset . 4)
		 (c-hanging-braces-alist . ())))
  (c-set-style "my-java")
  (setq c-auto-newline t)
  (setq c-comment-continuation-starts "* "
	tab-width 4
	indent-tabs-mode nil
	temp-interactive t
	c-basic-offset 4)
  (message "...jde-mode-hook loaded."))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;;(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
;;(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
;;(global-set-key [(f4)] 'speedbar-get-focus)

;;(require 'semantic-c)
;;(require 'semantic-el)
;;(require 'semantic-make)
;;(require 'semantic-imenu)

;;(add-hook 'speedbar-load-hook (lambda () (require 'semantic-sb)))
;;(autoload 'semantic-bnf-mode "semantic-bnf" "Mode for Bovine Normal Form." t)
;;(add-to-list 'auto-mode-alist '("\.bnf$" . semantic-bnf-mode))
;;(autoload 'semantic-minor-mode "semantic-mode" "Mode managing semantic parsing." t)

;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
;;(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)