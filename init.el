(exec-path-from-shell-initialize)

(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'tab-bar nil :inherit nil)
(set-face-attribute 'tab-bar-tab nil :box nil)

(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(electric-pair-mode 1)
(repeat-mode)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq delete-by-moving-to-trash t)
(setq kill-whole-line t)

(setq completion-show-help nil)
(setq completions-max-height 20)
(setq completions-format 'one-column)
(setq tab-always-indent 'complete)

(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(add-hook 'outline-minor-mode-hook #'reveal-mode)
(setq outline-minor-mode-prefix "\M-o"
      outline-default-state 'outline-show-only-headings
      outline-minor-mode-cycle t
      outline-minor-mode-cycle-filter 'bolp)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "<f5>") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "<f6>") #'eglot-rename)
  (define-key eglot-mode-map (kbd "<f7>") #'eglot-format))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "<f8>") #'flymake-show-diagnostics-buffer)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

(with-eval-after-load 'dired
  (require 'dired-x))
(setq dired-listing-switches "--group-directories-first -al")

(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c f") #'ffap)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
