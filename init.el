;; Performance
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 6400000)

;; Faces
(set-face-attribute 'mode-line nil :background "gray30" :foreground "white")
(set-face-attribute 'region nil :background "gray30" :foreground "white")
(set-face-attribute 'fringe nil :background "gray20")
(set-face-attribute 'line-number nil :background "gray17")

;; Global modes
(electric-pair-mode 1)
(save-place-mode 1)
(savehist-mode 1)

;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Repeat
(setq repeat-exit-key "RET")
(repeat-mode 1)

;; Indent
(setq tab-always-indent 'complete)
(indent-tabs-mode 0)

;; Better on
(setq kill-whole-line t)
(setq set-mark-command-repeat-pop t)
(setq use-short-answers t)
(setq visible-bell t)
(setq view-read-only t)
(setq inhibit-startup-screen t)

;; Completions
(setq completion-show-help nil)
(setq completions-max-height 20)
(setq-default abbrev-mode t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'java-mode-hook #'eglot-java-mode)
(add-hook 'org-mode-hok #'org-indent-mode)

;; Global keys
(global-set-key "\C-cl" #'org-store-link)
(global-set-key "\C-ck" #'kill-current-buffer)
(global-set-key "\C-z" #'repeat)
(global-set-key "\M-u" #'upcase-dwim)
(global-set-key "\M-l" #'downcase-dwim)
(global-set-key "\M-c" #'capitalize-dwim)

;; Eglot 
(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "<f5>") #'eglot-format)
  (define-key eglot-mode-map (kbd "<f7>") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "<f6>") #'eglot-rename))

;; Flymake
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

;; Dired
(with-eval-after-load 'dired
  (require 'dired-x))
(setq dired-listing-switches "-lXGh --group-directories-first")

;; Diff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq diff-font-lock-syntax nil)
(setq smerge-command-prefix "\e")
