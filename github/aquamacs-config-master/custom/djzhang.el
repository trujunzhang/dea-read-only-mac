

;;(setq config-root-dir (file-name-directory
;;  (or (buffer-file-name) load-file-name)))

;;(message config-root-dir)

(defun goto-my-emacs-lisps-dir ()
  "Goto `my-emacs-lisps-path'."
  (interactive)
  (dired config-root-dir))

(global-set-key (kbd "C-x E") 'goto-my-emacs-lisps-dir)

;;以上是我得time stamp，在后面将有详细讲解 
;;设置你的全名和邮件，在发邮件时可以用到 
(setq user-full-name "djzhang") 
(setq user-mail-address "wanghaomspace@gmail.com") 



(global-set-key [(f9)] 'list-bookmarks)
(global-set-key [(f10)] 'bookmark-set)

;; 启动窗口大小
(setq default-frame-alist
'((height . 24) (width . 400) (menu-bar-lines . 20) (tool-bar-lines . 0)))


