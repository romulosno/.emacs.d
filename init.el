(setq display-buffer-mark-dedicated t)
(add-to-list 'display-buffer-alist
	     '("\\*Occur\\*"
	       (display-buffer-below-selected)
	       (dedicated . t)
	       (height . 0.2)))

(add-to-list 'display-buffer-alist
	     '("*Async Shell Command*"
	       (display-buffer-in-side-window)
	       (side . bottom)
	       (slot . 0)
	       (height . 0.3)))

(add-to-list 'display-buffer-alist
	     '("\\*\\(Help\\|info\\|eldoc\\|Org Agenda\\)\\*"
	       (display-buffer-reuse-mode-window display-buffer-pop-up-frame)
	       (dedicated . t)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(electric-pair-mode)
(savehist-mode)
(save-place-mode)
(column-number-mode)
(repeat-mode)
(delete-selection-mode)

(add-hook 'org-mode-hook #'abbrev-mode)
(add-hook 'prog-mode-hook #'abbrev-mode)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq backup-directory-alist '(("." . "~/.backups/")))

(setq kill-whole-line t)
(setq inhibit-startup-screen t)
(setq visible-bell t)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'flex t)

(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c f") #'ffap)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-z") #'repeat)

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (cl-defmethod eglot-execute-command
    (_server (_cmd (eql java.apply.workspaceEdit)) arguments)
    "Eclipse JDT breaks spec and replies with edits as arguments."
    (mapc #'eglot--apply-workspace-edit arguments)))
