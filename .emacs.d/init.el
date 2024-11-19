;------------------------------------------------------
;
; init.el - my emacs startup file
;
;------------------------------------------------------

(defun update-load-path (&rest _)
   "Put our subdir to front of `load-path'."
   (push (expand-file-name "lisp" user-emacs-directory) load-path))
(update-load-path)

; ------------------------------------------------------

(require 'init-package)

(require 'init-ui)
(require 'init-funcs)
(require 'init-general)
(require 'init-multicursors)
(require 'init-keys)
(require 'init-c)
(require 'init-git)
(require 'init-open)
(require 'init-json)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key magit python-mode dockerfile-mode flycheck lua-mode adoc-mode yaml-mode markdown-mode json-mode ggtags expand-region use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
