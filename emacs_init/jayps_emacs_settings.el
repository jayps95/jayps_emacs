
;; Initial Window Size for emacs
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 190) ; chars
              (height . 55) ; lines
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 190)
              (height . 55)
              (left . 50)
              (top . 50))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))


;; Gets rid of start-up message window
(setq inhibit-startup-message t)

;;;;;; Enable line numbers globally ;;;;;;
(global-linum-mode t)

;;;;;; Change yes-no queries to y-n ;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;; Disable strart/end file sounds & warning signs in Emacs ;;;;;;
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;;;;;; Disable emacs weird deletion for highlighted text ;;;;;;
(delete-selection-mode 1)

;;;;; Load spacemacs theme ;;;;;;;
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))
