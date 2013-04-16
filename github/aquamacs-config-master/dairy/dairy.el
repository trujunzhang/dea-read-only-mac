

;; url: http://stackoverflow.com/questions/1217180/how-do-i-byte-compile-everything-in-my-emacs-d-directory
;; How do I byte-compile everything in my .emacs.d directory

(byte-recompile-directory (expand-file-name config-root-dir) 0)


(defun mkdir_root
  (make-temp-file "foo_wanghao")  
(move-file-to-trash  "~/Library/Application Support/Aquamacs Emacs/scratch buffer")
  )

(mkdir_root) 