(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (interactive)
             (define-key emacs-lisp-mode-map (kbd "RET") 'newline-and-indent)
             (define-key emacs-lisp-mode-map (kbd "<return>") 'newline-and-indent)
             (define-key emacs-lisp-mode-map (kbd "C-j") 'newline)
             (require 'eldoc)
             (turn-on-eldoc-mode)))
