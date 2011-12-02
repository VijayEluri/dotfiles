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
;; (current-fill-column 70)
(abbrev-mode t)

(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq require-final-newline t)

;; (setq default-major-mode 'text-mode)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'text-mode-hook (lambda () (refill-mode t)))

(put 'narrow-to-region 'disabled nil)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")
(set-frame-parameter (selected-frame) 'alpha '(90 60))
(setq x-select-enable-primary t)
(setq x-select-enable-clipboard t)

(windmove-default-keybindings)
(winner-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs
      (lambda (e)
        (y-or-n-p-with-timeout
         "Are you sure you want to exit emacs?" 5 t)))

(add-to-list 'load-path (setq emacs-d (expand-file-name "~/.emacs.d")))
(add-to-list 'load-path (setq lisp-directory (concat emacs-d "/lisp")))
(add-to-list 'load-path (setq site-lisp-directory (concat emacs-d "/site-lisp")))
(add-to-list 'load-path (setq global-load-path "/usr/share/emacs/site-lisp"))

(setq custom-file (concat emacs-d "/custom.el"))
(load custom-file 'noerror)

(add-to-list 'backup-directory-alist (cons "." (concat emacs-d "/.backups")))
(setq tramp-backup-directory-alist backup-directory-alist)

(defalias 'list-buffers 'ibuffer)
(iswitchb-mode t)
(icomplete-mode t)

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

(setq gnus-check-new-newsgroups nil)
;; (setq gnus-dribble-directory (concat emacs-d "/auto-save-list"))
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-startup-folded nil)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; (require 'color-theme)
;; (color-theme-initialize)
;; (setq color-theme-is-global t)
;; (color-theme-hober)

;; (add-to-list 'load-path (concat site-lisp-directory "/anything"))
;; (require 'anything)
;; (require 'anything-config)

(add-to-list 'load-path (concat site-lisp-directory "/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat site-lisp-directory "/auto-complete/dictionary"))
(ac-config-default)

(add-to-list 'load-path (concat site-lisp-directory "/company"))
(autoload 'company-mode "company" nil t)

(add-to-list 'load-path (concat site-lisp-directory "/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat site-lisp-directory "/yasnippet/snippets"))

(add-to-list 'load-path (concat site-lisp-directory "/cedet/common"))
(load-file (concat site-lisp-directory "/cedet/common/cedet.el"))
(add-to-list 'load-path (concat site-lisp-directory "/cedet/ede"))
(add-to-list 'load-path (concat site-lisp-directory "/cedet/eieio"))
(add-to-list 'load-path (concat site-lisp-directory "/cedet/semantic"))
(add-to-list 'load-path (concat site-lisp-directory "/cedet/srecode"))
(global-ede-mode t)
;; (semantic-load-enable-code-helpers)
(global-srecode-minor-mode 1)

(add-to-list 'load-path (concat site-lisp-directory "/ecb"))
(load-file (concat site-lisp-directory "/ecb/ecb.el"))
(require 'ecb-autoloads)
(setq ecb-source-path (quote (("~/workspaces" "/"))))

(load "functions")
(load "emmsrc")

(load "elrc")
(load "hsrc")
(load "javarc")
(load "lisprc")
(load "maxrc")
(load "mrc")
;; (load "pyrc")
(load "rrc")

(shell)

(dired "~")

;; (gnus-other-frame)

;; (require 'desktop)
;; (desktop-save-mode t)

(require 'server)
(unless (server-running-p) (server-start))
