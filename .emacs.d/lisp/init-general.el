;;; init-general.el --- configuration

;;; Commentary:

;; General settings, that don't fit in their own file
;;
;; ------------------------------------------------------

; disable backup
(setq backup-inhibited t)

; disable auto save
(setq auto-save-default nil)

; disable shift-selection
; If you hold down the shift key while typing a cursor
; motion command, this sets the mark before moving point.
(setq shift-select-mode nil)

; yank also pastes from clipboard
(setq select-enable-primary t)

; No tabs please
(setq-default indent-tabs-mode nil)

; Type opening brace, then the closing brace appears too
; (electric-pair-mode t)

; Highlight matching parens when cursor is behind one of them
(show-paren-mode 1)

; (when (eq system-type 'darwin)
;     (set-face-attribute 'default t :font "lucidasanstypewriter-11" )
; )

; This causes compile errors on emacs 1.29
; Answer "y" instead "yes"
; (fset 'yes-or-no-p 'y-or-n-p)

; Seems this is on by default. Don't want it.
(setq-default abbrev-mode nil)

; Always prompt for tag/identifier to lookup
(setq xref-prompt-for-identifier t)

; Each successive level of parens is highlighted a different color.
;
; For me, not enough color contrast on parens to make this worthwhile.
; Possible to change colors though. Maybe in the future.
;
; (use-package rainbow-delimiters
;   :ensure t)

(setq dired-listing-switches
    "-AGFhlv --group-directories-first --time-style=long-iso")

(provide 'init-general)
;;; init-general.el ends here
