(use-package org
  :ensure t
  :defer 1
  :hook (org-mode . visual-line-mode)
  )

(use-package org-bullets
  :ensure t
  :defer 1
  :hook (org-mode . org-bullets-mode)
  )