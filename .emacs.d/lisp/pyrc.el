(add-to-list 'load-path (concat local-lisp-directory "/python"))
(autoload 'python-mode "python-mode" "Python mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(require 'python-mode)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(eval-after-load "pymacs"
  '(add-to-list 'pymacs-load-path (concat lisp-directory "/pymacs")))

(setq ropemacs-enable-shortcuts t)
(setq ropemacs-local-prefix "C-c r")
(setq ropemacs-global-prefix "C-c C-p")
(setq ropemacs-enable-autoimport t)
(setq ropemacs-autoimport-modules '("os", "shutil"))
(require 'pymacs)
;; (pymacs-load "ropemacs" "rope-")

(add-to-list 'load-path (concat global-lisp-directory "/python-mode"))
(setq ipython-command "/usr/bin/ipython")
(require 'ipython)
