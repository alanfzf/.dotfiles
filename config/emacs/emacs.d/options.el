;; set default site for custom file
(defconst xdg-cache-home (expand-file-name "emacs/" "~/.cache/"))
(defconst xdg-state-home (expand-file-name "emacs/" "~/.local/state/"))
(defconst xdg-data-home (expand-file-name "emacs/" "~/.local/share/"))

;; ui settings
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq ring-bell-function 'ignore)
(setq display-line-numbers-type 'relative)
(setq inhibit-startup-screen t)
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

;; adjust directories
(setq native-comp-eln-load-path
      (list (expand-file-name "eln-cache/" xdg-cache-home)))
(setq package-user-dir (expand-file-name "packages/" xdg-data-home))
(setq custom-file (expand-file-name "custom.el" xdg-state-home))
(load custom-file 'noerror 'nomessage)
