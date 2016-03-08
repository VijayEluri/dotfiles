(require 'popwin)
(popwin-mode 1)

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories (concat emacs-directory "auto-complete-dictionary"))
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; (autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(define-key company-mode-map (kbd "C-M-i") 'company-complete))

(require 'yasnippet)
(yas-global-mode 1)

;; (add-to-list 'yas-snippet-dirs (concat emacs-directory "yasnippets"))
(setq yas-snippet-dirs (concat emacs-directory "yasnippets"))

(require 'helm-config)
;; (helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)
