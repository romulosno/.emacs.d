(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(indent-tabs-mode 0)

(delete-selection-mode 1)
(electric-pair-mode 1)
(save-place-mode 1)
(savehist-mode 1)
(repeat-mode 1)

(setq-default truncate-lines t)
(setq-default tab-width 4)

(setq tab-always-indent 'complete)
(setq js-indent-level 2)

(setq inhibit-startup-screen t)
(setq kill-whole-line t)
(setq repeat-exit-key "RET")
(setq set-mark-command-repeat-pop t)
(setq use-short-answers t)
(setq visible-bell t)

(setq tab-bar-show 1)
(setq tab-bar-close-button-show nil
	  tab-bar-new-button-show nil)

(require 'dired-x)

(add-hook 'prog-mode-hook #'abbrev-mode)
(add-hook 'org-mode-hook #'abbrev-mode)

(global-set-key "\C-ck" #'kill-current-buffer)
(global-set-key "\C-ch" #'global-hl-line-mode)
(global-set-key "\C-ca" #'org-agenda)
(global-set-key "\C-z" #'repeat)

(custom-theme-set-faces
 'user
 '(cursor ((t (:background "#447c80"))))
 '(default ((t (:background "#072933" :foreground "#e6e6d1" :font "Hack-11"))))
 '(diff-refine-added ((t (:background "#164508"))))
 '(diff-added ((t (:background "#123308"))))
 '(diff-removed ((t (:background "#380c04"))))
 '(diff-refine-removed ((t (:background "#4a150b"))))
 '(font-lock-keyword-face ((t (:foreground "#daa520"))))
 '(font-lock-string-face ((t (:foreground "#a0b6bd"))))
 '(font-lock-comment-face ((t (:foreground "#7c909c"))))
 '(font-lock-constant-face ((t (:foreground "#9bbae0"))))
 '(font-lock-builtin-face ((t (:foreground "#ffa07a"))))
 '(fringe ((t (:background "#0f2b33"))))
 '(mode-line ((t (:background "#454737"))))
 '(region ((t (:background "#153a45"))))
 '(tab-bar ((t (:background "#454737"))))
 '(tab-bar-tab-inactive ((t (:background "#484a3d" :foreground "#c2c2ba")))))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
