(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-theme 'wombat)

(setq default-frame-alist
      '((height . 35)
	(width . 100)
	(tooltip . nil)
	(tool-bar-lines . nil)
	(menu-bar-lines . nil)
	(vertical-scroll-bars . nil)
	(horizontal-scroll-bars . nil)))

(when (member "Fira Code" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Fira Code-10")))

(electric-pair-mode)
(repeat-mode)
(savehist-mode)
(save-place-mode)

(setq tab-always-indent 'complete
      completion-auto-help 'visible)

(setq inhibit-startup-screen t
      inhibit-startup-message t)

(global-set-key (kbd "C-z") #'repeat)

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
