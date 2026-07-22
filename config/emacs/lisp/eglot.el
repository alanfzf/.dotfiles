;; Core LSP setup
(use-package eglot
  :hook (
          ((php-mode php-ts-mode) . eglot-ensure)
          )

  :bind (:map eglot-mode-map
          ("C-c l r" . eglot-rename))
  :config
  (add-to-list
    'eglot-server-programs
    `((php-mode php-ts-mode)
       . ("intelephense" "--stdio"
           :initializationOptions
           (:globalStoragePath
             ,(expand-file-name "~/.intelephense")
             :licenceKey
             ,(expand-file-name "~/.intelephense/licence.txt")))))

  ;; Do not block Emacs while trying to connect.
  (setq eglot-sync-connect 0)
  ;; Stop the server after its last managed buffer is closed.
  (setq eglot-autoshutdown t)

  ;; Corresponds to Neovim's `settings.intelephense`.
  (setq-default
    eglot-workspace-configuration
    '(:intelephense
       (:files
         (:maxSize 1000000
           :exclude ["**/.direnv/**"
                      "**/node_modules/**"]))))
  )
