;;;; Package
(setq package-quickstart t)
(setq package-selected-packages '(yaml-mode markdown-mode))

;;;; Global modes
(delete-selection-mode)
(electric-pair-mode)
(global-reveal-mode)
(repeat-mode)
(save-place-mode)
(savehist-mode)

;;; Keybindings
(global-set-key (kbd "<f5>") #'org-capture)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c a") #'org-agenda-list)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "C-c i") #'imenu)
(global-set-key (kbd "C-c k") #'kill-current-buffer)

;;; Better defaults

;;;; Start screen
(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

;;;; Completions
(setq completion-show-help nil)
(setq completions-max-height 15)
(setq tab-always-indent 'complete)

;;;; SMTP
(setq send-mail-function 'smtpmail-send-it)
(with-eval-after-load 'smtp
  (setq smtpmail-smtp-server "smtp.gmail.com"))

;;;; Outline
(with-eval-after-load 'outline
  (setq outline-default-state 'outline-show-only-headings)
  (setq outline-minor-mode-cycle t)
  (setq outline-minor-mode-prefix "\M-o"))

;;;; Ediff
(with-eval-after-load 'ediff
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;;;; Org mode
(with-eval-after-load 'org
  (setq org-use-speed-commands t))

(setq org-capture-templates
      '(("t" "Todo" entry
	 (file+headline "agenda.org" "Tasks")
	 "* TODO %?\12  %i\12  %a")
	("j" "Journal" entry
	 (file+olp+datetree "journal.org")
	 "* %?\12Entered on %U\12  %i\12  %a")))

;;;; Dired
(with-eval-after-load 'dired
  (setq dired-listing-switches "-alh --group-directories-first")
  (require 'dired-x))

;;;; Misc
(setq kill-whole-line t)
(setq ring-bell-function 'ignore)

;;; Development

;;;; Compilation
(with-eval-after-load 'compile
  (setq compilation-scroll-output t))

;;;; Flymake
(with-eval-after-load 'flymake
  (let ((map flymake-mode-map))
    (define-key map (kbd "M-n") #'flymake-goto-next-error)
    (define-key map (kbd "M-p") #'flymake-goto-prev-error)
    (define-key map (kbd "C-c c e") #'flymake-show-buffer-diagnostics)))

;;;; Eglot
(with-eval-after-load 'eglot
  (let ((map eglot-mode-map))
    (define-key map (kbd "C-c c f") #'eglot-format)
    (define-key map (kbd "C-c c a") #'eglot-code-actions)
    (define-key map (kbd "C-c c s") #'eglot-shutdown)
    (define-key map (kbd "C-c c r") #'eglot-rename))
  
  (cl-defmethod eglot-execute-command
    (_server (_cmd (eql java.apply.workspaceEdit)) arguments)
    "Eclipse JDT breaks spec and replies with edits as arguments."
    (mapc #'eglot--apply-workspace-edit arguments)))

;;;; Java
(defun java-set-tab-width ()
  (setq tab-width 4
	c-basic-offset 2))
(add-hook 'java-mode-hook #'java-set-tab-width)
