;;;;;; Python Package elpy;;;;;;
(use-package elpy
  :ensure t
  :defer 1
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  :config 
  ;; Gets rid of ^G bug for inferior-python compiler
  (setq elpy-shell-echo-output nil)
  ;; Prevents input code from appearing in shell output
  (setq elpy-shell-echo-input nil)
  (setq elpy-shell-display-buffer-after-send t)
  )

(use-package python
  :ensure t
  :defer 1
  :config
  ;; Use python3 instead of python2.7
  (setq python-shell-interpreter "python3"
	python-shell-interpreter-args "-i")
  ;(setq python-shell-prompt-detect-failure-warning nil)
  ;; Gets rid of python running bug due to missing pyreadline
  (setq python-shell-completion-native-enable nil)
  )
