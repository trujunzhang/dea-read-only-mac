;;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(setq inferior-lisp-program "/usr/local/Cellar/sbcl/1.1.4") ; your Lisp system

(setq slime-dir (concat config-root-dir "/plugins/slime"))
(add-to-list 'load-path slime-dir)

(require 'slime) ; assume slime is already in aquamacs load path
(slime-setup '(slime-repl))
