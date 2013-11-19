
(setq groovy-root-dir (concat config-root-dir "/plugins"))
(setq groovy-dir (concat groovy-root-dir "/emacs-groovy-mode"))

(setq gradle-dir (concat groovy-dir "/emacs-gradle-mode"))

(add-to-list 'load-path groovy-root-dir)
(add-to-list 'load-path (expand-file-name groovy-dir))
(add-to-list 'load-path (expand-file-name gradle-dir))

(require 'groovy-mode)

;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

(require 'gradle-mode)
(gradle-mode 1)

(autoload 'gradle-mode "gradle-mode" "Major mode for editing Gradle code." t)
(add-to-list 'auto-mode-alist '("\build.gradle" . groovy-mode))
;;(add-to-list 'auto-mode-alist '("\build.gradle" . gradle-mode))