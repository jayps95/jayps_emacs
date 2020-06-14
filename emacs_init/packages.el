;;;;;; Allows one to try packages without installing permanently ;;;;;;
(use-package try
  :ensure t
  :defer 2 ;; loads package when emacs is idle for 2seconds
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
  :pin "melpa"
  )



;;;; Swiper/ivy/counsel for searching effectively ;;;;;;
(use-package counsel
  :ensure t
  :defer 2
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :defer 2
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure t
  :defer 2
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))


;;;;; fancy window switching ;;;;;;
(use-package ace-window
  :ensure t
  :defer 1
  :init
  (progn
    (setq aw-scope 'global) ;; was frame
    (global-set-key (kbd "C-x O") 'other-frame)
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))



;;;; fancy delimiters ;;;;;
(use-package rainbow-delimiters
  :ensure t
  :defer 1
  :hook (prog-mode . rainbow-delimiters-mode)
  )

;;;;; Undo tree package ;;;;;
(use-package undo-tree
  :ensure t
  :defer 1
  :bind ( ("C-z" . undo-tree-undo) ;; ctrl-z binding
	  ("C-S-z" . undo-tree-redo) ;; ctrl-shift-z binding
	 )
  :init
  (global-undo-tree-mode))



