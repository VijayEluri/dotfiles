(eval-after-load "haskell-mode"
  '(progn
     (add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
     (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)

     ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
     ;; (eval-after-load "which-func"
     ;;   '(add-to-list 'which-func-modes 'haskell-mode))

     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile)
     ;; (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile)

     (define-key haskell-mode-map (kbd "C-x C-d") nil)
     (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
     (define-key haskell-mode-map (kbd "C-c C-b") 'haskell-interactive-switch)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c M-.") nil)
     (define-key haskell-mode-map (kbd "C-c C-d") nil)

     (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)

     ;; TODO
     ;; (add-to-list 'auto-mode-alist '(("\\.hs$" . haskell-mode)))
     ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
     ;; (setq haskell-font-lock-symbols t)
     ;; (setq haskell-program-name "/usr/bin/ghci")
     ;; (require 'inf-haskell)
     ))
