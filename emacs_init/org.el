(use-package org
  :ensure t
  :defer 1
  :hook ((org-mode . visual-line-mode)
	 (org-mode . flyspell-mode)
	 )
  :config
  (setq org-support-shift-select t)
  )

(use-package org-bullets
  :ensure t
  :defer 1
  :hook (org-mode . org-bullets-mode)
  )
