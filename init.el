(when (member "Iosevka Comfy" (font-family-list))
  (add-to-list 'default-frame-alist
	       '(font . "Iosevka Comfy-11")))

(defun sort-by-alpha-length (elems)
  "Sort ELEMS first alphabetically, then by length."
  (sort elems (lambda (c1 c2)
                (or (string-version-lessp c1 c2)
                    (< (length c1) (length c2))))))

(defun sort-by-history (elems)
  "Sort ELEMS by minibuffer history."
  (if-let ((hist (and (not (eq minibuffer-history-variable t))
                      (symbol-value minibuffer-history-variable))))
      (minibuffer--sort-by-position hist elems)
    (sort-by-alpha-length elems)))

(global-set-key (kbd "<f5>") #'org-capture)
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c a") #'org-agenda-list)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(define-key completion-list-mode-map (kbd "s") #'isearch-forward)

(with-eval-after-load 'dired
  (require 'dired-x))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c c l") #'flymake-show-buffer-diagnostics))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c s") #'eglot-shutdown)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (cl-defmethod eglot-execute-command
    (_server (_cmd (eql java.apply.workspaceEdit)) arguments)
    "Eclipse JDT breaks spec and replies with edits as arguments."
    (mapc #'eglot--apply-workspace-edit arguments)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completion-auto-help 'always)
 '(completion-auto-select 'second-tab)
 '(completion-show-help nil)
 '(completions-max-height 15)
 '(completions-sort 'sort-by-history)
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes t)
 '(delete-selection-mode t)
 '(dired-listing-switches "-alh --group-directories-first")
 '(ediff-split-window-function 'split-window-horizontally)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(electric-pair-mode t)
 '(inhibit-startup-screen t)
 '(kill-whole-line t)
 '(modus-themes-mode-line '(accented borderless))
 '(org-capture-templates
   '(("n" "Nota" entry
      (file+headline "~/org/notes.org" "Notas")
      "* %?\12%i\12%a" :kill-buffer t)
     ("t" "Task" entry
      (file+headline "~/org/notes.org" "Tasks")
      "* TODO %?\12  %i\12  %a" :kill-buffer t)))
 '(org-use-speed-commands t)
 '(outline-minor-mode-prefix [134217839])
 '(package-quickstart t)
 '(package-selected-packages '(yaml-mode markdown-mode gruvbox-theme))
 '(repeat-mode t)
 '(ring-bell-function 'ignore)
 '(save-place-mode t)
 '(savehist-mode t)
 '(tab-always-indent 'complete)
 '(tab-bar-select-tab-modifiers '(meta)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
