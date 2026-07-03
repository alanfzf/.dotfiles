;; org options
(setq org-log-done 'time)
(setq org-directory (expand-file-name "~/webdav/"))
(setq org-default-notes-file
  (expand-file-name "refile.org" org-directory))

;; file associations
(add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))

;; keymaps
(global-set-key (kbd "C-c a") #'org-agenda)

;; only load agenda files when loading the agenda
(defun my/org-agenda-files ()
  (directory-files-recursively org-directory "\\.org$"))

(defun my/org-refresh-agenda-files (&rest _)
  (setq org-agenda-files (my/org-agenda-files)))

(advice-add 'org-agenda :before #'my/org-refresh-agenda-files)
