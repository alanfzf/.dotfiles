;; org options
(setq org-log-done 'time)
(setq org-directory (expand-file-name "~/webdav/"))
(setq org-default-notes-file
  (expand-file-name "refile.org" org-directory))

;; file associations
(add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))

;; keymaps
(global-set-key (kbd "C-c a") #'org-agenda)

(setq org-agenda-files
      (directory-files-recursively "~/webdav" "\\.org$"))
(setq org-refile-targets
      '((org-agenda-files :maxlevel . 3)))
