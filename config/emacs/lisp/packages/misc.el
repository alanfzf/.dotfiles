;; disable mouse
(use-package disable-mouse
  :config
  (global-disable-mouse-mode))

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
  :config
  (setq ghostel-term "xterm-256color")
  )
