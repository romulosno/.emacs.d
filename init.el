(add-to-list 'default-frame-alist '(font . "Hack-10.5"))
(add-to-list 'default-frame-alist '(background-color . "gray10"))
(add-to-list 'default-frame-alist '(foreground-color . "ivory"))
(set-face-attribute 'mode-line nil :background "gray20" :foreground "ivory")
(set-face-attribute 'tab-bar nil :inherit 'default)

(require 'dired-x)
(require 'ffap)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(electric-pair-mode 1)
(savehist-mode 1)

(add-hook 'org-mode-hook #'abbrev-mode)
(add-hook 'prog-mode-hook #'abbrev-mode)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq inhibit-startup-screen t)
(setq read-process-output-max (* 1024 1024))
(setq org-use-speed-commands t)
(setq org-confirm-babel-evaluate nil)
(setq use-short-answers t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq enable-local-variables :all)
(setq project-mode-line t)
(setq tab-always-indent 'complete)
(setq completion-show-help nil)

(global-set-key "\C-z" #'repeat)
(global-set-key "\C-ca" #'org-agenda)
(global-set-key "\C-cl" #'org-store-link)

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format))
