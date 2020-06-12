;;;;; MacOS keybidding configuration ;;;;;
; It is assumed that one installed emacs-mac

;; Bind Meta Key to Option key and command key to super key
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)


;; Copy-paste to follow cmd button
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)


;; Emacs-mac bindz minimize to C-z so we unbind it
(global-unset-key (kbd "C-z"))

;; Bind undo to C-z and redo to C-Z
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-Z") 'redo) ;;requires a redo package

;; Next and previous 5 lines
(global-set-key (kbd "M-n")
    (lambda () (interactive) (forward-line  5)))
(global-set-key (kbd "M-p")
    (lambda () (interactive) (forward-line -5)))


