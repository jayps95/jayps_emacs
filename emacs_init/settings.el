
;; Initial Window Size for emacs
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 200) ; chars
              (height . 70) ; lines
              (left . 0)
              (top . 0)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 200)
              (height . 70)
              (left . 0)
              (top . 0))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))


;; Gets rid of start-up message window
(setq inhibit-startup-message t)

;; Highlight current line
(global-hl-line-mode 1)

;;;;;; Enable line numbers globally ;;;;;;
;; display-line-numbers will not appear in pdf-tools viewer due to bug which will cause it to be slow. This is done through the function below. Source: emacs website
(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode pdf-view-mode)
  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'"
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode)

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
