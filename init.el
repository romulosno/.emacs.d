;;;; Customize
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;;;; Font and theme
(when (member "Iosevka Comfy" (font-family-list))
  (modify-all-frames-parameters '((font . "Iosevka Comfy-11"))))
(load-theme 'modus-vivendi t)

;;;; Modes
(delete-selection-mode t)
(electric-pair-mode t)
(save-place-mode t)
(savehist-mode t)
(repeat-mode t)

;;;; Keybindings
(global-set-key (kbd "<f5>") #'org-capture)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c a") #'org-agenda-list)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "M-s i") #'imenu)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(define-key completion-list-mode-map (kbd "s") #'isearch-forward)

;;;; Lazy loading
(with-eval-after-load 'dired
  (require 'dired-x))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c c l") #'flymake-show-buffer-diagnostics))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c s") #'eglot-shutdown)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (cl-defmethod eglot-execute-command
    (_server (_cmd (eql java.apply.workspaceEdit)) arguments)
    "Eclipse JDT breaks spec and replies with edits as arguments."
    (mapc #'eglot--apply-workspace-edit arguments)))
