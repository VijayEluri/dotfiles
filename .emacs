;; M-x byte-compile ~/.emacs
;; C-u 0 M-x byte-recompile-directory ~/.emacs.d

;;(if (string-match emacs-version "GNU Emacs\\|XEmacs") ...)

(setq debug-on-error t)

(setq inhibit-startup-message t)

(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;;(windmove-default-keybindings)
(global-set-key (kbd "\e <left>") 'windmove-left)
(global-set-key (kbd "\e <down>") 'windmove-down)
(global-set-key (kbd "\e <up>") 'windmove-up)
(global-set-key (kbd "\e <right>") 'windmove-right)

(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

(setq confirm-kill-emacs
      (lambda (e)
	(y-or-n-p-with-timeout
	 "Are you sure you want to exit emacs?" 5 t)))

(server-start)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'backup-directory-alist (cons "." "~/.emacs.d/.backups/"))
(setq tramp-backup-directory-alist backup-directory-alist)

(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)
(global-font-lock-mode t)
(transient-mark-mode t)
;;(auto-fill-mode t)
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table
  '(("alpha" "α" nil 0)
    ("Delta" "Δ" nil 0) ("delta" "δ" nil 0)
    ("Theta" "Θ" nil 0) ("theta" "θ" nil 0)))

;;(setq default-major-mode 'text-mode)
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq user-load-path (expand-file-name "~/.emacs.d"))
(setq load-path (cons user-load-path load-path))
(setq custom-load-path (concat user-load-path "/custom"))
(add-to-list 'load-path custom-load-path)
(setq local-load-path (concat user-load-path "/site-lisp"))
(add-to-list 'load-path local-load-path)
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el")
(add-to-list 'load-path "/usr/share/emacs-snapshot/site-lisp")
(add-to-list 'load-path "/usr/share/emacs-snapshot/site-lisp/emacs-goodies-el")

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(add-to-list 'load-path (concat local-load-path "/anything"))
(require 'anything)
(require 'anything-config)

(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

(setq tramp-default-method "ssh")

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies nil)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;(add-hook 'org-mode-hook 'turn-on-font-lock)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;;(require 'ess-site)
;;(setq ess-ask-for-ess-directory nil
;;      ess-directory "~/development/r/projects/")

;;(require 'color-theme)
;;(color-theme-initialize)
;;(setq color-theme-is-global t)
;;(color-theme-hober)

(require 'cl)

(load "functions")