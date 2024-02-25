(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(indent-tabs-mode 0)

(delete-selection-mode 1)
(electric-pair-mode 1)
(save-place-mode 1)
(savehist-mode 1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq-default truncate-lines t)
(setq-default tab-width 4)
(setq js-indent-level 2)

(setq tab-always-indent 'complete
	  completion-show-help nil
	  completions-format 'one-column)

(setq inhibit-startup-screen t
	  kill-whole-line t
	  set-mark-command-repeat-pop t
	  use-short-answers t
	  visible-bell t
	  view-read-only t)

(setq tab-bar-close-button-show nil
	  tab-bar-new-button-show nil
	  tab-bar-show 1)

(with-eval-after-load 'dired
  (require 'dired-x))

(add-hook 'prog-mode-hook #'abbrev-mode)
(add-hook 'org-mode-hook #'abbrev-mode)

(global-set-key "\C-ck" #'kill-current-buffer)
(global-set-key "\C-ch" #'global-hl-line-mode)
(global-set-key "\C-ca" #'org-agenda)
(global-set-key "\C-cl" #'org-store-link)
(global-set-key "\C-cd" #'delete-pair)
(global-set-key "\C-cs" #'scroll-lock-mode)
(global-set-key "\C-z" #'repeat)
(global-set-key "\M-u" #'upcase-dwim)
(global-set-key "\M-l" #'downcase-dwim)
(global-set-key "\M-c" #'capitalize-dwim)

(custom-theme-set-faces
 'user
 '(cursor ((t (:background "#447c80"))))
 '(default ((t (:background "#0c2830" :foreground "#e6e6d1" :font "Hack-11"))))
 '(diff-refine-added ((t (:background "#164508"))))
 '(diff-added ((t (:background "#123308"))))
 '(diff-removed ((t (:background "#380c04"))))
 '(diff-refine-removed ((t (:background "#4a150b"))))
 '(font-lock-keyword-face ((t (:foreground "#daa520"))))
 '(font-lock-string-face ((t (:foreground "#a0b6bd"))))
 '(font-lock-comment-face ((t (:foreground "#7c909c"))))
 '(font-lock-constant-face ((t (:foreground "#9bbae0"))))
 '(font-lock-builtin-face ((t (:foreground "#ffa07a"))))
 '(fringe ((t (:background "#0c2830"))))
 '(mode-line ((t (:background "#214e6e"))))
 '(region ((t (:background "#153a45"))))
 '(tab-bar ((t (:background "#5a5c4a"))))
 '(tab-bar-tab-inactive ((t (:background "#484a3d" :foreground "#c2c2ba")))))

