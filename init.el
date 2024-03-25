(when (member "Fira Mono" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Fira Mono-10")))

(setq gc-cons-threshold 12800000)
(setq read-process-output-max (* 1024 1024))

(load-theme 'escuro t)

(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

(electric-pair-mode 1)
(save-place-mode 1)
(savehist-mode 1)
(global-so-long-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq inhibit-startup-screen t)
(setq kill-whole-line t)
(setq set-mark-command-repeat-pop t)
(setq use-short-answers t)
(setq visible-bell t) 
(setq view-read-only t)
(setq mouse-wheel-progressive-speed nil)
(setq message-send-mail-function 'smtpmail-send-it)

(setq tab-always-indent 'complete)
(setq completion-show-help nil)
(setq completions-max-height 20)
(setq-default abbrev-mode t)

(setq outline-minor-mode-prefix "\M-o")
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)

(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq diff-font-lock-syntax nil)
(setq smerge-command-prefix "\e")

(add-hook 'org-mode-hook #'org-indent-mode)

(global-set-key "\C-cl" #'org-store-link)
(global-set-key "\C-ca" #'org-agenda)
(global-set-key "\C-co" #'outline-minor-mode)
(global-set-key "\C-z" #'repeat)

(global-set-key "\M-u" #'upcase-dwim)
(global-set-key "\M-l" #'downcase-dwim)
(global-set-key "\M-c" #'capitalize-dwim)

(with-eval-after-load 'dired
  (require 'dired-x))

