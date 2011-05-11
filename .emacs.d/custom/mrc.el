(autoload 'octave-mode "octave-mode" nil t)

(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

(define-key octave-mode-map "\C-m" 'octave-reindent-then-newline-and-indent)

;; M-x run-octave, or (autoload 'run-octave "octave-inf" nil t)
;;
;; C-c C-i l    octave-send-line
;; C-c C-i b    octave-send-block
;; C-c C-i f    octave-send-defun
;; C-c C-i r    octave-send-region
;; C-c C-i s    octave-show-process-buffer
;; C-c C-i h    octave-hide-process-buffer
;; C-c C-i k    octave-kill-process
