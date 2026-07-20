(use-package ls-lisp
  :ensure nil
  :custom
  (ls-lisp-dirs-first t)
  (ls-lisp-use-insert-directory-program nil)
  )

(use-package dired
  :ensure nil
  :custom
  (dired-free-space nil)
  (dired-deletion-confirmer 'y-or-n-p)
  (dired-recursive-deletes 'always)
  (dired-recursive-copies 'always)
  (dired-vc-rename-file t)
  (dired-create-destination-dirs 'always)
  (dired-clean-confirm-killing-deleted-buffers nil)
  :bind
  ("C-x C-d" . (lambda ()
                 (interactive)
                 (dired default-directory)))
  )

(use-package dired-x
  :ensure nil
  :after dired
  :custom
  (dired-omit-files "^\\.[^.].*")
  :hook
  (dired-mode . dired-omit-mode)
  :bind
  (:map dired-mode-map
    ("M-o" . dired-omit-mode))
  )
