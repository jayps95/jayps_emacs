;;;;; MacOS keybidding configuration ;;;;;
; It is assumed that one installed emacs-mac

;; Bind Meta Key to Option key and command key to super key
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)


;; Copy-paste to follow cmd button
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)


;; Next and previous 5 lines
(global-set-key (kbd "M-n")
    (lambda () (interactive) (forward-line  5)))
(global-set-key (kbd "M-p")
    (lambda () (interactive) (forward-line -5)))



;; Select current line, taken from https://emacs.stackexchange.com/questions/15033/how-to-mark-current-line-and-move-cursor-to-next-line
(defun my/select-current-line-and-forward-line (arg)
  "Select the current line and move the cursor by ARG lines IF
no region is selected.

If a region is already selected when calling this command, only move
the cursor by ARG lines."
  (interactive "p")
  (when (not (use-region-p))
    (forward-line 0)
    (set-mark-command nil))
  (forward-line arg))
;; Note that I would not recommend binding this command to `C-l'.
;; From my personal experience, the default binding to `C-l' to
;; `recenter-top-bottom' is very useful.
(global-set-key (kbd "C-l") #'my/select-current-line-and-forward-line)
