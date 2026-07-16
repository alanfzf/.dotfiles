;; ui settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(set-face-attribute 'default nil
  :font "JetBrainsMono Nerd Font"
  :height 140)

;; disable autosave
(setq backup-inhibited t
  make-backup-files nil
  auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; misc settings
(fset 'yes-or-no-p 'y-or-n-p)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

(fido-vertical-mode 1)

;; use a custom-file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; disable default message
(defun display-startup-echo-area-message ()
  (message nil))

(setq project-vc-extra-root-markers '(".project"))
(global-auto-revert-mode t)

(setq project-switch-commands 'project-dired)
(keymap-set project-prefix-map "t" #'ghostel-project)

;; show a red square if theres whitespace at the end
(setq whitespace-style '(face trailing))
(global-whitespace-mode 1)

(defadvice split-window (after split-window-after activate)
  (other-window 1))

(editorconfig-mode 1)
