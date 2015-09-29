;;; Emacs Lisp
;;
;; C-h S info-lookup-symbol
;; C-h f describe-function
;; C-h v describe-variable
;;
;; C-M-i completion-at-point
;; M-TAB completion-at-point

(defun my-emacs-lisp-mode-hook ()
  (eldoc-mode 1)
  (turn-on-eldoc-mode)
  (hs-minor-mode 1)
  ;; (semantic-mode 1)
  ;; (electric-layout-mode 1)

  ;; (paredit-mode 1)
)

(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

;;; Common Lisp
;;

(setq inferior-lisp-program "/usr/bin/sbcl")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

;; $ sbcl
;; * (mapc 'require '(sb-bsd-sockets sb-posix sb-introspect sb-cltl2 asdf))
;; * (save-lisp-and-die "sbcl.core-for-slime")
(setq slime-lisp-implementations
      '((sbcl ("sbcl" "-noinform"))
        (sbcl-core ("sbcl" "--core" "sbcl.core-for-slime"))))

;; (w3m-goto-url-new-session "file:///home/phua/workspaces/mnt/media/www/HyperSpec/Front/index.htm")
;; (w3m-goto-url-new-session "http://www.lispworks.com/documentation/HyperSpec/Front/")

;;; CLIPS, Jess
;;

;; (add-to-list 'load-path (concat emacs-directory "site-lisp/jess-mode"))
;;
;; (autoload 'jess-mode "jess-mode" "Jess Editing Mode" t nil)
;; (autoload 'run-jess "inf-jess" "Inferior Jess Mode" t nil)
;; (setq auto-mode-alist (append auto-mode-alist '(("\\.clp$" . jess-mode))))
;;
;; (add-hook 'jess-mode-hook #'(lambda () (auto-fill-mode t)))
;;
;; (add-hook 'inferior-jess-load-hook
;;           #'(lambda ()
;;               (setq inferior-jess-program
;;                     #'(lambda ()
;;                         '("-classpath" ".:~/local/Jess/jess.jar" "jess.Main")))))
