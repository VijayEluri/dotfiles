(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
(require 'slime-autoloads)
(slime-setup '(slime-repl))

(global-set-key "\C-cs" 'slime-selector)

;; (setq auto-mode-alist
;;       (append '(("\\.lisp$" . lisp-mode)
;;                 ("\\.lsp$" . lisp-mode)
;;                 ("\\.cl$" . lisp-mode)
;;                 ("\\.asd$" . lisp-mode))
;;               auto-mode-alist))

;; (add-hook 'slime-mode-hook
;;           (lambda ()
;;             (unless (slime-connected-p)
;;               (save-excursion (slime)))))
