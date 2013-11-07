;;; init.el --- Where all the magic begins

;; Turn off extra Aquamacs stuff early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tabbar-mode) (tabbar-mode -1))

;; Set up helper functions
(setq config-root-dir (file-name-directory
  (or (buffer-file-name) load-file-name)))

;; Add plugins
(add-to-list 'load-path (concat config-root-dir "/plugins"))

;;(require 'util)

;; 一些基本的小函数
(require 'ahei-misc)

;; 利用`eval-after-load'加快启动速度的库
;; 用eval-after-load避免不必要的elisp包的加载
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

;; Add custom configurations
(defconst custom-config-dir (concat config-root-dir "/custom/")
  "Path to directory containing user customized configurations.")
(defun load-config-files (filelist)
  (dolist (file filelist)
    (load (expand-file-name
           (concat custom-config-dir file)))
    (message "Loaded custom config file: %s" file)
  ))

(load-config-files '(
  "custom"
  "keybindings"
  "yasnippet"
  ;;"ecb"
  ;;"multi-term"
  "version-control"
  ;;"projects"
  "markdown-env"
  ;;"lisp-env"
  "org-mode-env" ; after projects.el (needs anything.el)
  "appearance" ; appearance least important, so load last
  "djzhang"
  "sr-speedbar-settings"
  ;;"latex-emacs"
  ;;"jdee-configure"
  ;;"w3m-settings"
  "wcy-desktop-settings";; 王纯业的desktop, 比desktop快多了
  ;;"python-env"
))


;; since ropemacs etc is slow, wait with this until we load a python file
;(add-to-list 'load-path custom-config-dir)
;(autoload 'python-mode "python-env" "Python Environment" t)

(provide 'init)
