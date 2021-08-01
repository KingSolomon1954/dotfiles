; init-git.el
;
; Pull in git packages
;
; ------------------------------------------------------

(use-package magit
  :ensure t
  :bind (("C-x C-g" . magit-status)
         ))

(provide 'init-git)
