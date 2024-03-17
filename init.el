(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 25600000)

(electric-pair-mode 1)
(save-place-mode 1)
(savehist-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq kill-whole-line t)
(setq set-mark-command-repeat-pop t)
(setq use-short-answers t)
(setq visible-bell t) 
(setq view-read-only t)

(setq mouse-wheel-progressive-speed nil)

(setq message-send-mail-function 'smtpmail-send-it)

(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

(setq tab-always-indent 'complete)
(setq completion-show-help nil)
(setq completions-max-height 20)

(setq-default abbrev-mode t)
(setq-default frame-title-format "emacs")
(setq-default fill-column 80)

(setq outline-minor-mode-prefix "\M-o")
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq diff-font-lock-syntax nil)
(setq smerge-command-prefix "\e")

(setq dired-listing-switches "-lXGh --group-directories-first")
(with-eval-after-load 'dired
  (require 'dired-x))

(add-hook 'org-mode-hook #'org-indent-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(global-set-key "\C-cl" #'org-store-link)
(global-set-key "\C-ca" #'org-agenda)
(global-set-key "\C-co" #'outline-minor-mode)
(global-set-key "\C-ck" #'kill-current-buffer)
(global-set-key "\C-cs" #'find-name-dired)
(global-set-key "\C-cf" #'flyspell-buffer)
(global-set-key "\C-z" #'repeat)

(global-set-key "\M-u" #'upcase-dwim)
(global-set-key "\M-l" #'downcase-dwim)
(global-set-key "\M-c" #'capitalize-dwim)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "<f5>") #'eglot-format)
  (define-key eglot-mode-map (kbd "<f7>") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "<f6>") #'eglot-rename))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

(set-face-attribute 'fringe nil :background "#1a2024")
(set-face-attribute 'region nil :background "#333d42")
(set-face-attribute 'mode-line nil :background "#3a414a" :foreground "white")
