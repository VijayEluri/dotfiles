;; M-x byte-compile ~/.emacs
;; C-u 0 M-x byte-recompile-directory ~/.emacs.d

(require 'cl)

(setq debug-on-error t)

(setq inhibit-startup-message t)

(menu-bar-mode nil)
(tool-bar-mode nil)
(scroll-bar-mode nil)

(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)
(global-font-lock-mode t)
(transient-mark-mode t)
(delete-selection-mode t)
;; (auto-fill-mode t)
(abbrev-mode t)

(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq require-final-newline t)

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")
;; (setq x-select-enable-clipboard t)

;; (setq default-major-mode 'text-mode)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'text-mode-hook (lambda () (refill-mode t)))

;; (require 'desktop)
;; (desktop-save-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs
      (lambda (e)
        (y-or-n-p-with-timeout
         "Are you sure you want to exit emacs?" 5 t)))

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; (windmove-default-keybindings)
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-right>") 'windmove-right)

(add-to-list 'load-path (setq user-load-path (expand-file-name "~/.emacs.d")))
(add-to-list 'load-path (setq custom-load-path (concat user-load-path "/custom")))
(add-to-list 'load-path (setq local-load-path (concat user-load-path "/site-lisp")))
(add-to-list 'load-path (setq global-load-path "/usr/share/emacs/site-lisp"))

(setq custom-file (concat custom-load-path "/custom.el"))
(load custom-file 'noerror)

(add-to-list 'backup-directory-alist (cons "." (concat user-load-path "/.backups")))
(setq tramp-backup-directory-alist backup-directory-alist)

(defalias 'list-buffers 'ibuffer)
(iswitchb-mode t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setenv "ESHELL" shell-file-name)
(setq explicit-sh-args '("--login" "-i"))

(setq tramp-default-method "ssh")

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies nil)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; (require 'color-theme)
;; (color-theme-initialize)
;; (setq color-theme-is-global t)
;; (color-theme-hober)

;; (add-to-list 'load-path (concat local-load-path "/anything"))
;; (require 'anything)
;; (require 'anything-config)

(add-to-list 'load-path (concat local-load-path "/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat local-load-path "/auto-complete/dictionary"))
(ac-config-default)

(add-to-list 'load-path (concat local-load-path "/company"))
(autoload 'company-mode "company" nil t)

(add-to-list 'load-path (concat local-load-path "/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat local-load-path "/yasnippet/snippets"))

(load "functions")
;; (load "crc")
;; (load "cpprc")
(load "elrc")
;; (load "emmsrc")
(load "hsrc")
(load "eclimrc")
;; (load "jderc")
;; (load "jsrc")
(load "lisprc")
;; (load "maxrc")
(load "mrc")
(load "pyrc")
(load "rrc")
;; (load "sqlrc")
(load "texrc")
;; (load "xmlrc")

(shell)

(dired "~")

(require 'server)
(unless (server-running-p) (server-start))
