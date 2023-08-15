(when (member "Iosevka Comfy" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Iosevka Comfy-11")))

(setq package-quickstart t)

(with-eval-after-load 'flymake
  (bind-keys
   ("C-z" . repeat)
   ("C-c a" . org-agenda)
   ("C-c o" . outline-minor-mode)))

(with-eval-after-load 'dired
  (require 'dired-x))

(with-eval-after-load 'flymake
  (bind-keys
   :map flymake-mode-map
   ("M-n" . flymake-goto-next-error)
   ("M-p" . flymake-goto-prev-error)
   ("C-c c l" . flymake-show-buffer-diagnostics)))

(with-eval-after-load 'eglot
  (bind-keys
   :map eglot-mode-map
   ("C-c c f" . eglot-format)
   ("C-c c a" . eglot-code-actions)
   ("C-c c s" . eglot-shutdown)
   ("C-c c r" . eglot-rename))

  (cl-defmethod eglot-execute-command
    (_server (_cmd (eql java.apply.workspaceEdit)) arguments)
    "Eclipse JDT breaks spec and replies with edits as arguments."
    (mapc #'eglot--apply-workspace-edit arguments)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-auto-help 'visible)
 '(completion-show-help nil)
 '(completions-max-height 15)
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes t)
 '(delete-selection-mode t)
 '(dired-listing-switches "-alh --group-directories-first")
 '(electric-pair-mode t)
 '(inhibit-startup-screen t)
 '(kill-whole-line t)
 '(modus-themes-mode-line '(accented borderless))
 '(org-use-speed-commands t)
 '(outline-minor-mode-prefix [134217839])
 '(package-quickstart t t)
 '(package-selected-packages '(markdown-mode gruvbox-theme))
 '(repeat-mode t)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(savehist-mode t)
 '(tab-always-indent 'complete)
 '(tab-bar-select-tab-modifiers '(meta)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
