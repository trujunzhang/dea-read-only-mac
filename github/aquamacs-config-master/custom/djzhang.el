

;;(setq config-root-dir (file-name-directory
;;  (or (buffer-file-name) load-file-name)))

;;(message config-root-dir)

(defun goto-my-emacs-lisps-dir ()
  "Goto `my-emacs-lisps-path'."
  (interactive)
  (dired config-root-dir))

(global-set-key (kbd "C-x E") 'goto-my-emacs-lisps-dir)

