;;;;;; Allows one to try packages without installing permanently ;;;;;;
(use-package try
  :ensure t
  :defer 2
  )

;;;;;; Great for learning emacs keys ;;;;;;
(use-package which-key
  :ensure t
  :defer 2
  :config
  (which-key-mode)
  )


;;;;;; Iedit package for refactoring;;;;;;;;
;;; C-; to activate ;;;;
(use-package iedit
  :ensure t
  :defer 1
  )

;;;;; Flycheck: On-the-go syntax checker;;;;;;
(use-package flycheck
  :ensure t
  :defer 1
  :init (global-flycheck-mode)
  )


;;;;;; Company-mode for auto-completion for buffers (in general emacs) ;;;;;;
(use-package company
  :ensure t
  :defer 1
  :pin melpa
  )
