;;(setq inferior-lisp-program "/usr/bin/java -server -cp /home/phua/local/clojure/clojure.jar clojure.lang.Repl")
;;(add-to-list 'load-path "/home/phua/elisp/clojure/clojure-mode")
;;(require 'clojure-auto)
;;;(require 'paredit)
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
;;(defun lisp-enable-paredit-hook () (paredit-mode 1))
;;(add-hook 'clojure-mode-hook 'lisp-enable-paredit-hook)

(add-to-list 'load-path "/home/phua/elisp/clojure/swank-clojure")
;;(setq swank-clojure-binary "clojure.sh")
(setq swank-clojure-jar-path "/home/phua/local/clojure/clojure.jar")
(require 'swank-clojure-autoload)
;;;(swank-clojure-config
;;; (setq swank-clojure-jar-path "/home/phua/local/clojure/clojure.jar")
;;; (setq swank-clojure-extra-classpaths (list "/home/phua/.clojure")))
;;;(require 'swank-clojure)

(setq slime-lisp-implementations '())
;;(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")))
;; M-- M-x slime clojure