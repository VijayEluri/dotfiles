(add-to-list 'load-path (concat site-lisp-directory "/jess-mode"))

(autoload 'jess-mode "jess-mode" "Jess Editing Mode" t nil)
(autoload 'run-jess "inf-jess" "Inferior Jess Mode" t nil)
(setq auto-mode-alist (append auto-mode-alist '(("\\.clp$" . jess-mode))))

(add-hook 'jess-mode-hook #'(lambda () (auto-fill-mode t)))

(add-hook 'inferior-jess-load-hook
	  ;; #'(lambda () (setq inferior-jess-program "~/local/jess/bin/jess")))
          #'(lambda () (setq inferior-jess-program
                             #'(lambda () '("-classpath" ".:~/local/jess/jess.jar" "jess.Main")))))
