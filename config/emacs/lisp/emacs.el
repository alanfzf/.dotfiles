(use-package emacs
  :ensure nil
  :init
  ;; ui modes
  (tool-bar-mode 0)
  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (global-display-line-numbers-mode 1)
  ;; useful modes
  (fido-vertical-mode 1)
  (electric-pair-mode 1)
  (editorconfig-mode 1)
  (global-auto-revert-mode t)
  (global-whitespace-mode 1)
  ;; fonts
  (set-face-attribute 'default nil
    :font "JetBrainsMono Nerd Font"
    :height 140)

  :custom
  ;; ui
  (visible-bell nil)
  (ring-bell-function #'ignore)
  (display-line-numbers-type 'relative)
  (inhibit-startup-screen t)
  (inhibit-startup-message t)
  (highlight-nonselected-windows nil)

  ;; scrolling
  (fast-but-imprecise-scrolling t)

  ;; custom file
  (custom-file (expand-file-name "custom.el" user-emacs-directory))

  ;; backup files
  (make-backup-files nil)
  (auto-save-default nil)
  (create-lockfiles nil)

  ;; autocompletion
  (read-file-name-completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  (completion-ignore-case t)

  ;; short answers
  (read-answer-short t)
  (use-short-answers t)
  (revert-buffer-quick-short-answers t)

  ;; spelling
  (ispell-program-name "aspell")
  (ispell-dictionary "spanish")

  ;; parens
  (show-paren-delay 0.1)
  (show-paren-highlight-openparen t)
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t)

  ;; autorevert
  (global-auto-revert-non-file-buffers t)
  (global-auto-revert-ignore-modes '(Buffer-menu-mode))

  ;; whitepsace
  (whitespace-style '(face trailing))

  ;; buffers
  (confirm-nonexistent-file-or-buffer nil)
  (uniquify-buffer-name-style 'forward)

  ;; misc
  (sentence-end-double-space nil)
  (help-window-select t)

  :config
  ;; custom file
  (load custom-file 'noerror 'nomessage)
  (defun display-startup-echo-area-message ()
    "Suppress the default startup echo-area message."
    nil)
  (defadvice split-window (after split-window-after activate)
    (other-window 1))
  (add-hook 'before-save-hook
    'delete-trailing-whitespace)
  )

;; TODO: we should probably move this to a file later on
(use-package elisp-mode
  :ensure nil
  :init
  (defun my-elisp-format-on-save ()
    (indent-region (point-min) (point-max)))
  :hook
  (emacs-lisp-mode
    . (lambda ()
        (add-hook 'before-save-hook
          #'my-elisp-format-on-save
          nil
          t))))
