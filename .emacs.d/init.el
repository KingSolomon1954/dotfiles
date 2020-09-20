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

(provide 'init)
