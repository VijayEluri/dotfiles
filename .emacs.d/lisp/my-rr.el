(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook (lambda () (local-set-key "\C-m" (key-binding "\C-j"))))
(autoload 'run-octave "octave-inf" nil t)

(eval-after-load "gnuplot-mode"
  '(progn
     ;; gnuplot
     (autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
     (autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)

     (add-to-list 'auto-mode-alist '(("\\.gp$" . gnuplot-mode)))

     (global-set-key [(f9)] 'gnuplot-make-buffer)

     (setenv "INFOPATH"
             (concat (getenv "INFOPATH") ":"
                     (expand-file-name "/usr/share/info/gnuplot.info.gz")))

     ;; gnuplot-mode

     ;; (require 'gnuplot-mode)
     ;; (setq gnuplot-program "/usr/bin/gnuplot")
     ;; (setq gnuplot-flags "-persist")

     (add-hook 'gnuplot-mode-hook
               (lambda ()
                 (flyspell-prog-mode)
                 (add-hook 'before-save-hook
                           'whitespace-cleanup nil t)))))

;; (eval-after-load "ess"
;;   '(progn
     (require 'ess-site)

     ;; TODO
     ;; (setq ess-ask-for-ess-directory nil)
     ;; (add-hook 'ess-pre-run-hook
     ;;           (lambda () (setq-default ess-directory "~/workspaces/r")))
     ;; (add-hook 'ess-mode-hook
     ;;           (lambda () (setq ess-indent-level 2)))
     ;; (setq inferior-julia-program-name "~/usr/local/julia/julia-release-basic")
     ;; ))

(push "/usr/share/emacs/site-lisp/maxima" load-path)
(autoload 'imaxima "imaxima" "Maxima frontend" t)
(autoload 'imath "imath" "Interactive Math mode" t)

(setq imaxima-use-maxima-mode-flag t)

;; (setq imaxima-print-tex-command "latex %s; dvipdf %s.dvi imax.pdf; open imax.pdf")
