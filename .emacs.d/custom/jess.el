(add-to-list 'load-path "~/.emacs.d/site-lisp/jess-mode")
(autoload 'jess-mode "jess-mode" "Jess Editing Mode" t nil)
(autoload 'run-jess "inf-jess" "Inferior Jess Mode" t nil)
(add-hook 'jess-mode-hook
	  #'(lambda ()
	      (auto-fill-mode t)
	      (turn-on-font-lock)))
(setq auto-mode-alist (append auto-mode-alist '(("\\.clp$" . jess-mode))))
;;(add-hook 'inferior-jess-load-hook #'(lambda () (setq inferior-jess-program "~/local/jess/bin/jess")))
(add-hook 'inferior-jess-load-hook
          #'(lambda () (setq inferior-jess-program
                             #'(lambda () '("-classpath" ".:~/local/jess/jess.jar" "jess.Main")))))