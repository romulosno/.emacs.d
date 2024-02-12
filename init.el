(require 'dired-x)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(set-face-attribute 'variable-pitch nil :font "Droid Sans-11")
(set-face-attribute 'fringe nil :background "ivory2")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(electric-pair-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(delete-selection-mode 1)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq inhibit-startup-screen t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq set-mark-command-repeat-pop t)

(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq tab-always-indent 'complete)
(setq completion-show-help nil)
(add-to-list 'completion-styles 'flex t)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'org-mode-hook #'abbrev-mode)
(add-hook 'prog-mode-hook #'abbrev-mode)

(global-set-key "\C-ck" #'kill-current-buffer)
(global-set-key "\C-ch" #'global-hl-line-mode)
(global-set-key "\C-ca" #'org-agenda)
(global-set-key "\C-z" #'repeat)


