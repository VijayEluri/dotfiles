(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; (define-key octave-mode-map "\C-m" 'octave-reindent-then-newline-and-indent)

(autoload 'run-octave "octave-inf" nil t)
