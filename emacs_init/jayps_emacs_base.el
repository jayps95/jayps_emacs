;;;;;;; Jayps emacs base-init file ;;;;;;

;; Findout load time of init file ;;
(emacs-init-time)
(let ((file-name-handler-alist nil)) "jayps_emacs_base.el")

;;;;; Speeds up init file loading by increasing no. of bytes of consing b4 garbage collection is invoked ;;;;;
;; speeds up from 2.6s to 1.4s as of 6 June 2020
;; after emacs-mac installation, addition of org.el, macos_keybind.el, loadtime increased to 1.8s as of 12 June
(setq-default gc-cons-threshold 100000000)

;; resets bytes for garbage collection threshold, wouldn't want 100mb of RAM for this
( add-hook 'emacs-startup-hook 'my/set-gc-threshold)
(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq-default gc-cons-threshold 800000))

;;;;;; Package Manager ;;;;;;
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("org" . "https://orgmode.org/elpa/")
	     )

(package-initialize)

;;;;;; Track init-file startup times ;;;;;;;
;; use M-x esup for init file and C-u M-x esup for specific modular files startuptime

;; (use-package esup
;;   :ensure t
;;   :defer 1
;;   ;; To use MELPA Stable use ":pin mepla-stable",
;;   :pin melpa
;;   :commands (esup))


;;;;;; Define function to get full path for load function ;;;;;;;
(defun get-fullpath (@file-relative-path)
    "From: http://ergoemacs.org/emacs/organize_your_dot_emacs.html
Return the full path of *file-relative-path, relative to caller's file location.

Example: If you have this line
xf (get-fullpath \"../xyz.el\")
in the file at
 /home/mary/emacs/emacs_lib.el
then the return value is
 /home/mary/xyz.el
Regardless how or where emacs_lib.el is called.

This function solves 2 problems.

① If you have file A, that calls the `load' on a file at B, and B calls `load' on file C
 using a relative path,
 then Emacs will complain about unable to find C. Because, emacs does not switch current directory with `load'.

To solve this problem, when your code only knows the relative path of another file C, you can use the variable
 `load-file-name' to get the current file's full path, then use that with the relative path to get a full path of the file you are interested.

② To know the current file's full path, emacs has 2 ways: `load-file-name' and `buffer-file-name'. 
If the file is loaded by `load', then `load-file-name' works but `buffer-file-name' doesn't. If the file is called by `eval-buffer', then `load-file-name' is nil. 
You want to be able to get the current file's full path regardless the file is run by `load' or interactively by `eval-buffer'."
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
  )


;;;;;; Bootstrap `use-package' ;;;;;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;;;;;; loading separate .el files ;;;;
(load (get-fullpath "macos_keybind")) ;;loads keybinds, for macos in this case 
(load (get-fullpath "settings")) ;;loads settings such as window frame size, theme etc. ~0.2s loading time as of 6 June 2020
(load (get-fullpath "packages")) ;; loads misc. packages ~0.1s loading time as of June 2020
(load (get-fullpath "python")) ;; loads elpy and python settings ~0.2s loading time as of 6 June 2020
(load (get-fullpath "latex")) ;; loads latex and relevant packages ~0.4s loading time as of 6 June 2020
(load (get-fullpath "org")) ;; loads org related packages



;;;;;;;;;;;;;;;;;;;;;;;;;;; Code auto-added by Melpa ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-shell-echo-input nil)
 '(package-selected-packages
   (quote
    (spacemacs-theme flycheck iedit which-key use-package pyenv-mode material-theme magit-popup magit ghub exec-path-from-shell elpy better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
