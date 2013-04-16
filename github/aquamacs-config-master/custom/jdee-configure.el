

(setq jdee-root-dir (concat config-root-dir "/plugins/jdee"))
(setq elib-dir (concat jdee-root-dir "/elib-1.0"))
(setq jde-lisp-dir (concat jdee-root-dir "/jdee-2.4.0.1/lisp"))

(add-to-list 'load-path jdee-root-dir)

(add-to-list 'load-path (expand-file-name jde-lisp-dir))
(add-to-list 'load-path (expand-file-name elib-dir))

(require 'jde)



