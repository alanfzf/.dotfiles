(setq org-directory (expand-file-name "~/webdav/"))
(setq org-default-notes-file
  (expand-file-name "refile.org" org-directory))
(add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
(setq org-agenda-files
  (directory-files-recursively org-directory "\\.org$"))
(global-set-key (kbd "C-c a") #'org-agenda)
(setq org-log-done 'time)
