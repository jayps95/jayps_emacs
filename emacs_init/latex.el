
;; Uses pdf-tools as pdf viewer
(use-package pdf-tools
  :ensure
  :defer t
  ;;(pdf-tools-install) ;; Uncomment if it is the first time using this package
 ; :mode ("\\.pdf\\'" . pdf-view-mode) ;; enables pdf-tools to be loaded only when compiling, allows for faster startup time
  :config
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  (setq pdf-view-use-unicode-ligther nil)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  (define-key pdf-view-mode-map (kbd "C-r") 'isearch-backward)
  )


;;Enables latexmk compilation
(use-package auctex-latexmk
  :ensure t
  :defer 2
  :config
  (auctex-latexmk-setup)
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  )

;;Bibliography support for latex
(use-package reftex
  :ensure t
  :defer t
  :config
  (setq reftex-cite-prompt-optional-args t)
  ) ;; Prompt for empty optional arguments in cite

(use-package auto-dictionary
  :defer 1
  :ensure t
  :init(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)
				       )
		 )
  )

(use-package company-auctex
  :ensure t
  :defer 1
  :init (company-auctex-init)
  )

;; enabels auctex
(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config (progn
	    (setq TeX-source-correlate-mode t)
	    (setq TeX-source-correlate-method 'synctex)
	    (setq TeX-parse-self t)
	    (setq reftex-plug-into-AUCTeX t)
	    (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
		  TeX-source-correlate-start-server t)
	    ;; Update PDF buffers after successful LaTeX runs
	    (add-hook 'TeX-after-compilation-finished-functions
		      #'TeX-revert-document-buffer)
	    (add-hook 'LaTeX-mode-hook
		      (lambda ()
			(reftex-mode t)
			(flyspell-mode t)
			(magic-latex-buffer t)))
	    
	    )
  )

;; Allows for fancy latex code features for easier viewing
(use-package magic-latex-buffer
  :defer 1
  :ensure t
  :config
  (setq magic-latex-enable-block-highlight t
      magic-latex-enable-suscript        t
      magic-latex-enable-pretty-symbols  t
      magic-latex-enable-block-align     t
      magic-latex-enable-inline-image    t
      magic-latex-enable-minibuffer-echo t)
  )
