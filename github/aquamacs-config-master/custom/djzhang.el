

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
;;(setq default-frame-alist
;;'((height . 35) (width . 125) (menu-bar-lines . 20) (tool-bar-lines . 0)))



;; bury *scratch* buffer instead of kill it
(defun kill-scratch-buffer ()
  ;; The next line is just in case someone calls this manually
  (set-buffer (get-buffer-create "*scratch*"))

  ;; Kill the current (*scratch*) buffer
  (remove-hook 'kill-buffer-query-functions 'kill-scratch-buffer)
  (kill-buffer (current-buffer))

  ;; Make a brand new *scratch* buffer
  (set-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode)
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer)

  ;; Since we killed it, don't let caller do that.
  nil)

(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))

;;(kill-scratch-buffer)


;;(switch-to-buffer "*scratch*") 
;;(delete-other-windows) 