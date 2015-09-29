(require 'python)

(setq python-shell-interpreter "ipython2")
(setq python-shell-interpreter-args "")
(setq python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
(setq python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
(setq python-shell-completion-setup-code "from IPython.core.completerlib import module_completion")
(setq python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n")
(setq python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; (autoload 'python-mode "python-mode" "Python mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (require 'python-mode)

;; (setq py-shell-name "/usr/bin/ipython2")
;; (setq py-which-bufname "IPython")

;; (setq ipython-command "/usr/bin/ipython2")
;; (require 'ipython)
;; (setq py-python-command "/usr/bin/python2")
;; (setq py-python-command-args '("-matplotlib" "-colors" "LightBG"))

(eval-after-load "pymacs"
  '(progn
     (autoload 'pymacs-apply "pymacs")
     (autoload 'pymacs-call "pymacs")
     (autoload 'pymacs-eval "pymacs" nil t)
     (autoload 'pymacs-exec "pymacs" nil t)
     (autoload 'pymacs-load "pymacs" nil t)

     (add-to-list 'pymacs-load-path (concat emacs-directory "lisp/pymacs"))

     ;; (setq ropemacs-enable-shortcuts t)
     ;; (setq ropemacs-local-prefix "C-c r")
     ;; (setq ropemacs-global-prefix "C-c C-p")
     ;; (setq ropemacs-enable-autoimport t)
     ;; (setq ropemacs-autoimport-modules '("os", "shutil"))

     (require 'pymacs)
     (pymacs-load "ropemacs" "rope-")))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(setq jedi:environment-virtualenv '("virtualenv2"))
(setq jedi:environment-root "default")
;; (setq jedi:server-command '("python" "~/.emacs.d/elpa/jedi-core-20150413.520/jediepcserver.py"))
(setq jedi:server-args '("--log-traceback"))

;; (require 'ein)
