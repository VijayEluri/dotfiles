(require 'cl)

;;(if (string-match emacs-version "GNU Emacs\\|XEmacs") ...)
;;(expand-file-name "~/elisp")
;;(run-at-time "7:00am" 86400 'jde-xref-make-xref-db)

(setq debug-on-error t)

(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)

(global-font-lock-mode t)
;;(set-default-font linux-font)

;;(setq default-major-mode 'text-mode)
;;(add-hook 'text-mode'hook 'turn-on-auto-fill)

;;(set-language-environment "UTF-8")
(define-abbrev-table 'global-abbrev-table
  '(("alpha" "α" nil 0)
    ("Delta" "Δ" nil 0)
    ("delta" "δ" nil 0)
    ("Theta" "Θ" nil 0)
    ("theta" "θ" nil 0)))
(abbrev-mode t)

;;(global-set-key [delete] 'delete-char)
;;(global-set-key [backspace] 'backward-delete-char-untabify)
;;(global-set-key [home] 'move-beginning-of-line)
;;(global-set-key [end] 'move-end-of-line)
;;(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq confirm-kill-emacs
      (lambda (e)
	(y-or-n-p-with-timeout
	 "Are you sure you want to exit emacs?" 5 t)))

;;(fset 'yes-or-no-p 'y-or-n-p)

(server-start)

(setq load-path (cons "~/emacs.d" load-path))
(add-to-list 'load-path "/usr/share/emacs/site-lisp")

(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

(setq tramp-default-method "ssh")
;;(require 'tramp)

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)
;;(setq w3m-use-cookies t)
;;(eval-when-compile (autoload 'browse-url-interactive-arg "browse-url"))

;;(add-to-list 'load-path "~/emacs.d/org/lisp")
;;(add-to-list 'load-path "~/emacs.d/org/contrib/lisp")
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;(global-font-lock-mode 1)
(setq org-return-follows-link t)
;;(add-hook 'org-mode-hook 'turn-on-font-lock)
;;(require 'org)

(load "functions")
(load "custom/auctex")
;;(load "custom/clojure")
(load "custom/emms")
;;(load "custom/ess")
;;(load "custom/hla")
;;(load "custom/mmix")
(load "custom/jdee")
;;(load "custom/jess")
(load "custom/octave")
(load "custom/slime")