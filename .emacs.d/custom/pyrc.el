(add-to-list 'load-path (concat local-load-path "/python"))

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(setq font-lock-maximum-decoration t)

(require 'python-mode)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(eval-after-load "pymacs" '(add-to-list 'pymacs-load-path (concat local-load-path "/pymacs")))

;; M-x pymacs-eval repr(2**111)
;; M-x pymacs-load os
;; M-: (os-getcwd)

;; (require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-confirm-saving nil)
;; (setq ropemacs-enable-autoimport t)
;; (setq ropemacs-autoimport-modules '("os", "shutil"))
;; (setq ropemacs-enable-shortcuts nil)
;; (setq ropemacs-local-prefix "C-c C-p")

(add-to-list 'load-path (concat global-load-path "/python-mode"))
(setq ipython-command "/usr/bin/ipython")
(require 'ipython)
