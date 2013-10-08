;;; .emacs --- GNU Emacs customization

;; Author: Peter Hua
;; Version: $Revision: 1.0$
;; Keywords: emacs

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING. If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; GNU Emacs customization

;;; Code:

;; M-x byte-compile-file ~/.emacs
;; C-u 0 M-x byte-recompile-directory ~/.emacs.d

;; (mapc #'package-install
;;       '(ascope auctex auto-complete c-eldoc clips-mode color-theme color-theme-sanityinc-solarized dired+ doctags ecb emms ess ggtags gnuplot gnuplot-mode haskell-mode helm ipython jtags jtags-extra magit paredit pymacs python-mode slime w3m yasnippet))
;;
;; javadoc-help, javadoc-lookup, javap, javap-mode, javarun thread-dump

(setq debug-on-error t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)
(setq linum-format "%d ")
(hl-line-mode 1)
(transient-mark-mode 1)
(delete-selection-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default require-final-newline t)
;; (auto-fill-mode 1)
;; (current-fill-column 70)

(show-paren-mode 1)
;; (setq show-paren-style 'expression)
(electric-pair-mode 1)
(abbrev-mode 1)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\C-co" 'occur) ;; C-s M-s occur, multi-occur

(global-font-lock-mode 1)
;; (eldoc-mode 1)
(flyspell-mode 1)

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "white")
(set-frame-parameter (selected-frame) 'alpha '(90 60))

(windmove-default-keybindings 'meta)
(global-set-key "\C-xp"
                '(lambda (&optional n)
                   (interactive "P")
                   (other-window (- (prefix-numeric-value n)))))
(global-set-key "\C-xn" 'other-window)
(winner-mode 1)
;; (desktop-save-mode 1)
(setq x-select-enable-primary nil)
(setq x-select-enable-clipboard t)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-kill-emacs
      (lambda (e)
        (y-or-n-p-with-timeout
         "Are you sure you want to exit emacs?" 5 t)))

(require 'cl)

;; TODO

(setq emacs-directory (expand-file-name "~/.emacs.d/"))
(add-to-list 'load-path (concat emacs-directory "lisp/"))
;; (add-to-list 'load-path (concat emacs-directory "site-lisp/"))
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/")

;; Deprecated by ELPA.
;;
;; (defun find-mode-path (name)
;;   (let ((search-path (list (expand-file-name "~/.emacs.d/")
;;                            (expand-file-name "~/.emacs.d/lisp/")
;;                            (expand-file-name "~/.emacs.d/site-lisp/")
;;                            (expand-file-name "/usr/share/emacs/site-lisp/"))))
;;     (flet ((f (name search-path)
;;               (when search-path
;;                 (let ((path (concat (car search-path) name)))
;;                   (if (file-directory-p path)
;;                       path
;;                     (f name (cdr search-path)))))))
;;       (f name search-path))))
;;
;; (defmacro with-this-mode (name &rest body)
;;   "It's `path'-clobbering time!"
;;   `(let ((path (find-mode-path ,name)))
;;      (when path
;;        (add-to-list 'load-path path)
;;        ,@body)))

(setq custom-file (concat emacs-directory "/custom.el"))
(load custom-file 'noerror)

(add-to-list 'backup-directory-alist (cons "." (concat emacs-directory "/.backups")))

(defalias 'list-buffers 'ibuffer)
;; (global-set-key (kbd "C-x C-b") 'ibuffer)

(iswitchb-mode 1)
;; (setq iswitchb-buffer-ignore '("^ " "^\\*"))
(setq iswitchb-default-method 'maybe-frame)

(icomplete-mode 1)

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; TODO
(setq shell-file-name "/bin/bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setenv "ESHELL" shell-file-name)
(setq explicit-sh-args '("--login" "-i"))

(setq tramp-backup-directory-alist backup-directory-alist)
(setq tramp-default-method "ssh")

;; TODO
(setq gnus-check-new-newsgroups nil)
(setq gnus-dribble-directory emacs-directory)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; (require 'epa)
;; (epa-file-enable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.org$'" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)

(setq org-startup-indented t)
(setq org-startup-folded nil)

(org-babel-do-load-languages 'org-babel-load-languages '((emacs-lisp . t) (lisp . t) (C . t) (java .t ) (python . t) (R . t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("local" . "/home/phua/.emacs.d/site-lisp/"))

;; TODO (color-theme-sanityinc-solarized-dark)

;; TODO (require 'dired+)
;; (define-key ctl-x-map   "d" 'diredp-dired-files)
;; (define-key ctl-x-4-map "d" 'diredp-dired-files-other-window)

(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies nil)

(mapcar #'load '("my-ac.el" "my-ys.el" "my-fn" "my-el" "my-cl" "my-cc" "my-py" "my-rr" "my-hs" "my-vc" "my-tx"))

(shell)
;; (ansi-term "/bin/bash")

(dired "~")
(dired "~/workspaces/")

;; (w3m-goto-url-new-session "http://")

;; (gnus-other-frame)

(require 'server)
(unless (server-running-p) (server-start))
