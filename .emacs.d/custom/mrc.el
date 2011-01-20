(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; M-x run-octave, or (autoload 'run-octave "octave-inf" nil t)
