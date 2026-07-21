(use-package org
  :ensure nil
  :defer t
  :init
  (defvar my-org-files
    (expand-file-name "~/WebDAV/")
    "Directory containing my Org files.")

  (defvar my-org-refile
    (expand-file-name "refile.org" my-org-files)
    "Main Org refile file.")

  (defun my-open-org-refile ()
    "Open the main Org refile file."
    (interactive)
    (find-file my-org-refile))

  (defun my-org-mode-setup ()
    "make org mode work with completion-preview"
    (setq-local completion-preview-commands
      (append '(org-self-insert-command
                 org-delete-backward-char)
        completion-preview-commands)))
  :custom
  (org-log-done 'time)
  (org-directory my-org-files)
  (org-default-notes-file my-org-refile)
  (org-agenda-files (list my-org-files))
  (org-refile-targets
    '((org-agenda-files :maxlevel . 3)))

  :hook
  (org-mode . my-org-mode-setup)

  :bind
  (
    ("C-c a" . org-agenda)
    ("C-c c" . org-capture)
    ("C-c r" . my-open-org-refile)
    )

  :mode
  ("\\.org_archive\\'" . org-mode)
  )
