;;;; Better defaults
;; Misc
(setq ring-bell-function 'ignore)
(setq kill-whole-line t)

;; Frame resize
(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      use-file-dialog nil)

;;;; Initial screen
(setq inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      initial-major-mode 'fundamental-mode)

;;;; Packages
(setq package-quickstart t)
(setq package-selected-packages '(yaml-mode markdown-mode))

;;;; Completions
(setq completion-show-help nil
      completion-styles '(basic partial-completion emacs22 flex)
      completions-max-height 15
      tab-always-indent 'complete)

;;;; Modes
(delete-selection-mode t)
(electric-pair-mode t)
(save-place-mode t)
(savehist-mode t)
(repeat-mode t)

;;;; Keybindings
(global-set-key (kbd "<f5>") #'org-capture)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c a") #'org-agenda-list)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "C-c i") #'imenu)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(define-key completion-list-mode-map (kbd "s") #'isearch-forward)

;;;; Dired
(with-eval-after-load 'dired
  (setq dired-listing-switches "-alh --group-directories-first")
  (require 'dired-x))

;;;; Flymake
(with-eval-after-load 'flymake
  (let ((map flymake-mode-map))
    (define-key map (kbd "M-n") #'flymake-goto-next-error)
    (define-key map (kbd "M-p") #'flymake-goto-prev-error)
    (define-key map (kbd "C-c c e") #'flymake-show-buffer-diagnostics))

  (set-face-attribute 'flymake-error nil :underline `(:color "firebrick"))
  (set-face-attribute 'flymake-warning nil :underline `(:color "dark goldenrod"))
  (set-face-attribute 'flymake-note nil :underline `(:color "olive drab")))

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

;;;; Ediff
(with-eval-after-load 'ediff
  (setq ediff-split-window-function 'split-window-horizontally
	ediff-window-setup-function 'ediff-setup-windows-plain))

;;;; Org
(with-eval-after-load 'org
  (setq org-use-speed-commands t)
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "agenda.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+olp+datetree "journal.org")
         "* %?\nEntered on %U\n  %i\n  %a"))))

;;;; Outline
(setq outline-minor-mode-cycle t
      outline-minor-mode-prefix "\M-o")

;;;; SMTP
(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 25)

;;;; Tab Bar
(with-eval-after-load 'tab-bar
  (setq tab-bar-select-tab-modifiers '(meta))
  (setq tab-bar-close-button-show nil
	tab-bar-new-button-show nil))

;;;; Faces
(set-face-background 'region "DodgerBlue4")
(set-face-foreground 'error "firebrick")
(set-face-foreground 'warning "dark goldenrod")
(set-face-foreground 'success "olive drab")
