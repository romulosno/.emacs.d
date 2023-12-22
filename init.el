(when (member "Monaco" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Monaco-11") t))

(repeat-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(electric-pair-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror)

(set-face-attribute 'tab-bar nil :inherit nil)
(set-face-attribute 'mode-line nil :background "gray25" :foreground "white")

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq delete-by-moving-to-trash t)
(setq kill-whole-line t)

(setq completion-show-help nil)
(setq completions-max-height 20)
(setq completions-format 'one-column)
(setq tab-always-indent 'complete)

(setq dired-listing-switches "--group-directories-first -al")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

(setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
(setq tab-bar-select-tab-modifiers '(meta))

(setq outline-minor-mode-prefix "\C-co"
      outline-default-state 'outline-show-only-headings
      outline-minor-mode-cycle t
      outline-minor-mode-cycle-filter 'bolp)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'outline-minor-mode-hook #'reveal-mode)

(global-set-key (kbd "<f8>") #'outline-minor-mode)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c f") #'ffap)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "M-o") #'other-window)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "<f5>") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "<f6>") #'eglot-rename)
  (define-key eglot-mode-map (kbd "<f7>") #'eglot-format))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "<f8>") #'flymake-show-diagnostics-buffer)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))
