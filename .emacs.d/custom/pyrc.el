(autoload 'python-mode "python-mode" "Python mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; (add-to-list 'load-path (concat 'local-load-path "/python-mode"))
;; (add-to-list 'load-path (concat 'local-load-path "/pymacs"))
;; (add-to-list 'load-path (concat 'local-load-path "/ropemacs"))
;; (require 'ipython)
;; (require 'python-mode)
;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

;; (add-hook 'python-mode-hook
;;        '(lambda ()
;;           (progn
;;             (eldoc-mode 1)
;;             (auto-complete-mode 1)
;;             (outline-minor-mode 1)
;;             (hide-body)) t))
