(load (concat site-lisp-directory "/ess/lisp/ess-site"))

(require 'ess-site)

(setq ess-ask-for-ess-directory nil
      ess-directory "~/development/r/workspace/"
      ess-ask-about-transfile nil)

;; M-x S
;;
;; Inferior ESS
;; M-x ?    ess-list-object-completions
