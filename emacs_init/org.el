(use-package org
  :ensure t
  :defer 1
  )

(use-package org-bullets
  :ensure t
  :defer 1
  :hook (org-mode . org-bullets-mode)
  )
