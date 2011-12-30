;; http://www.haskell.org/haskellwiki/Haskell-mode

(load (concat global-lisp-directory "/haskell-mode/haskell-mode.el"))

(setq auto-mode-alist (append '(("\\.hs$" . haskell-mode)) auto-mode-alist))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation) ; or -indent, or -simple-indent

(setq haskell-font-lock-symbols t)

(setq haskell-program-name "/usr/bin/ghci")

(require 'inf-haskell)
