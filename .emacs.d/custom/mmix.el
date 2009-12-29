(add-to-list 'load-path "~/emacs.d/site-lisp/mmix-mode")
(autoload 'mmix-mode "mmix-mode" "Major mode for editing MMIX files" t)
(setq auto-mode-alist (cons '("\\.mms$" . mmix-mode) auto-mode-alist))