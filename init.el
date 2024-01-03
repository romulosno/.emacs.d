(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(savehist-mode 1)
(save-place-mode 1)
(electric-pair-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq visible-bell t)
(setq tab-always-indent 'complete)
(setq completions-max-height 20)
(add-to-list 'completion-styles 'flex t)

(setq inhibit-startup-screen t)
(setq kill-whole-line t)

(setq tab-bar-show 1)

(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c f") #'ffap)
(global-set-key (kbd "C-c k") #'kill-current-buffer)

(set-face-attribute 'tab-bar nil :inherit nil)
(set-face-attribute 'mode-line nil :box nil)

(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(put 'upcase-region 'disabled nil)
