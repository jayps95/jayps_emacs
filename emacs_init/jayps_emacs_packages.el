;;;;;; Allows one to try packages without installing permanently ;;;;;;
(use-package try
  :ensure t)

;;;;;; Great for learning emacs keys ;;;;;;
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  )


;;;;;; Iedit package for refactoring;;;;;;;;
;;; C-; to activate ;;;;
(use-package iedit
  :ensure t
  )

;;;;; Flycheck: On-the-go syntax checker;;;;;;
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  )


;;;;;; Company-mode for auto-completion for buffers (in general emacs) ;;;;;;
(use-package company
  :ensure t
  :pin melpa
  )
