;; variables
(defvar my-org-files
  (expand-file-name "~/webdav")
  )

(defvar my-org-refile
  (expand-file-name "refile.org" my-org-files))

;; options
(setq org-log-done 'time)
(setq org-directory my-org-files)
(setq org-default-notes-file my-org-refile)
(setq org-agenda-files
  (list org-directory))
;; (setq org-refile-targets
;;   '((org-agenda-files :maxlevel . 3)))

;; keybinds
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; file associations
(add-to-list 'auto-mode-alist '("\\.org_archive\\'" . org-mode))
