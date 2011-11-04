;; http://www.haskell.org/haskellwiki/Haskell-mode

;; C-c C-=     inserts an = sign and lines up type signatures and other pattern matches
;; C-c C-|     inserts a guard
;; C-c C-o     inserts a guard `| otherwise =' and lines up existing guards
;; C-c C-w     inserts a `where' keyword
;; C-c C-.     aligns code over a region in a sensible fashion
;;
;; C-c C-t     gets `:type' for a symbol at point, and remembers it
;; C-u C-c C-t inserts a type annotation, for symbol at point, on the line above
;; C-c C-i     gets `:info' for symbol at point
;; C-c M-.     find definition of (interpreted) symbol at point
;;
;; C-c C-l     load file
;; C-c C-r     reload file

(load (concat global-load-path "/haskell-mode/haskell-mode.el"))

(setq auto-mode-alist (append '(("\\.hs$" . haskell-mode)) auto-mode-alist))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation) ; or -indent, or -simple-indent

(setq haskell-font-lock-symbols t)

(setq haskell-program-name "/usr/bin/ghci")

(require 'inf-haskell)
