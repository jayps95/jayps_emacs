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
