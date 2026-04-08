;; keybinds
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-c d") (lambda()
                                (interactive)
                                (dired default-directory)
                                ))
