;; Core LSP setup
(use-package eglot
  :hook ((php-mode . eglot-ensure)
          (php-ts-mode . eglot-ensure))
  :config
  (add-to-list 'eglot-server-programs
    '((php-mode php-ts-mode) . ("intelephense" "--stdio")))
  (setq eglot-sync-connect 0)
  (setq eglot-autoshutdown t)


  (setq-default eglot-workspace-configuration
    `(:intelephense
       (:storagePath ,(expand-file-name "~/.intelephense")
         :files (:exclude ["**/.direnv/**" "**/node_modules/**"])
         :licenceKey ,(string-trim
                        (with-temp-buffer
                          (insert-file-contents
                            (expand-file-name "~/.intelephense/licence.txt"))
                          (buffer-string)))))))
