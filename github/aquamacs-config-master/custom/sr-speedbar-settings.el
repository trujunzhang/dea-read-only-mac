;; Project Management

;; unique buffer names

 (require 'sr-speedbar)

(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 30)
(setq speedbar-show-unknown-files t)
(setq dframe-update-speed t)        ; prevent the speedbar to update the current state, since it is always changing

 

(global-set-key (kbd "<f5>") (lambda()
          (interactive)
          (sr-speedbar-toggle)))


(provide 'sr-speedbar-settings)
