(add-to-list 'load-path (concat local-load-path "/jdee"))
(add-to-list 'load-path (concat local-load-path "/jdee/lisp"))
(add-to-list 'load-path (concat global-load-path "/cedet/common"))
(load-file (concat global-load-path "/cedet/common/cedet.el"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/cogre"))
;; (add-to-list 'load-path (concat global-load-path "/cedet/contrib"))
(add-to-list 'load-path (concat global-load-path "/cedet/eieio"))
(add-to-list 'load-path (concat global-load-path "/cedet/semantic"))
(add-to-list 'load-path (concat global-load-path "/cedet/speedbar"))
(add-to-list 'load-path (concat local-load-path "/elib")) ;; deprecated

(require 'jde) ;; comment to defer loading jde with autoload

;; (autoload 'java-mode "java-mode" "Java Mode" t nil)
(autoload 'jde-mode "jde-mode" "JDE Mode" t)
(setq auto-mode-alist (append '(("\\.java$" . jde-mode)) auto-mode-alist))

(add-to-list 'load-path (concat global-load-path "/ecb"))
;; (load-file (concat global-load-path "/ecb/ecb.el"))
;; (require 'ecb) ;; comment to defer loading with ecb-autoloads
(require 'ecb-autoloads)

(defun my-jde-mode-hook
  (message "Loading my-jde-mode-hook...")

  ;; (setq c-basic-offset 2)

  (define-key c-mode-base-map "\C-ca" 'jde-javadoc-generate-javadoc-template)
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-case-open 0)
  (c-set-offset 'case-label '+)

  ;; (fset 'my-javadoc-code ...)

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
        tempo-interactive t
        c-basic-offset 4)

  (message "...jde-mode-hook loaded."))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)

;; (load "jde-junit")
;; (require 'jde-junit)

;; (add-to-list 'load-path (concat local-load-path "/jdee-contrib"))
;; (require 'jsee)
;; (require 'jserial)
;; (require 'decompile)

;; (add-to-list 'load-path (concat local-load-path "/jdibug"))
;; (require 'jdibug)

;; (load-file (concat local-load-path "jde-eclipse-compiler-server.el"))
;; (require 'jde-eclipse-compiler-server)

;; (add-to-hook 'jde-mode-hook 'yas/minor-mode)
;; (add-to-hook 'jde-mode-hook 'flymake-mode)
;; (add-to-hook 'jde-mode-hook 'hs-minor-mode)

(require 'flymake)
