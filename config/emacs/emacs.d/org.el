(setq org-directory (expand-file-name "~/webdav/"))
(setq org-default-notes-file
  (expand-file-name "refile.org" org-directory))
(setq org-agenda-files
      (directory-files-recursively org-directory "\\.org$"))
(global-set-key (kbd "C-c a") #'org-agenda)
