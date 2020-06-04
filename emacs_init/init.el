;; Initial Window Size for emacs
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106) ; chars
              (height . 55) ; lines
              (background-color . "honeydew")
              (left . 50)
              (top . 50)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 106)
              (height . 60)
              (background-color . "honeydew")
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


;;;;;; Package Manager ;;;;;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;;;;;; Bootstrap `use-package' ;;;;;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;;;;; Allows one to try packages without installing permanently ;;;;;;
(use-package try
  :ensure t)

;;;;;; Great for learning emacs keys ;;;;;;
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;;;;;; Python Package elpy;;;;;;
(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  )
;; Gets rid of python running bug due to missing pyreadline
(setq python-shell-completion-native-enable nil)
;; Use python3 instead of python2.7
(setq python-shell-interpreter "python3")
(setq elpy-rpc-python-command "python3")
;; Gets rid of ^G bug for inferior-python compiler
(setq elpy-shell-echo-output nil)
;; Prevents input code from appearing in shell output
(setq elpy-shell-echo-input nil)

;;;;;; Iedit package for refactoring;;;;;;;;
(use-package iedit
  :ensure t
  )

;;;;; Flycheck: On-the-go syntax checker for python ;;;;;;
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )


;;;;;; Company-mode for auto-completion for buffers (in general emacs) ;;;;;;
(use-package company
  :ensure t
  :pin melpa)



;;;;;;;;;;;;;;;;;;;;;;;;;;; Code auto-added by Melpa ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-shell-echo-input nil)
 '(package-selected-packages
   (quote
    (flycheck iedit which-key use-package pyenv-mode material-theme magit-popup magit ghub exec-path-from-shell elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
