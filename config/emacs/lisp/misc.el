;; disable mouse
(use-package inhibit-mouse
  :init
  (inhibit-mouse-mode 1)
  )

;; nerdicons
(use-package nerd-icons)
(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

;; direnv
(use-package direnv
  :custom
  (direnv-always-show-summary nil)
  :config
  (direnv-mode))

(use-package ghostel
  :bind (
          ("C-x m" . ghostel)
          :map project-prefix-map
          ("m" . ghostel-project)
          ("M" . ghostel-project-list-buffers)
          )
  :custom
  (ghostel-module-auto-install 'download)
  :config
  (setq ghostel-term "xterm-256color")
  )
