(require 'dired-x)

(setq dired-listing-switches "-alh --group-directories-first")
(setq dired-omit-files "^\\.[^.].*")
(add-hook 'dired-mode-hook #'dired-omit-mode)
(define-key dired-mode-map (kbd "M-o") #'dired-omit-mode)

(global-set-key (kbd "C-c d") (lambda()
                                (interactive)
                                (dired default-directory)
                                ))
