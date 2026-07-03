;; keybinds
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-c t") #'vterm)
(global-set-key (kbd "C-c d") (lambda()
                                (interactive)
                                (dired default-directory)
                                ))
;; TODO replace the old weird keybinds for dired
