(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
;;(add-to-list 'load-path "/usr/share/common-lisp/source/slime")
(require 'slime)
;;(require 'slime-autoloads)
(slime-setup)

;;(setq slime-lisp-implementations '((cmucl ("cmucl" "-quiet"))
;;				   (sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix)))

(setq auto-mode-alist
      (append '(("\\.lisp$" . lisp-mode)
		("\\.lsp$" . lisp-mode)
		("\\.cl$" . lisp-mode)
		("\\.asd$" . lisp-mode))
	      auto-mode-alist))

(add-hook 'slime-mode-hook
	  (lambda ()
	    (unless (slime-connected-p)
	      (save-excursion (slime)))))