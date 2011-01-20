(push "/usr/share/maxima/5.21.1/emacs" load-path)
(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath "imath" "Interactive Math mode" t)

(setq imaxima-use-maxima-mode-flag t)

(setq auto-mode-alist (cons '("\\.max$" . maxima-mode) auto-mode-alist))
