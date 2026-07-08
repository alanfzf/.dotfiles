;; keybinds
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-c t") #'ghostel)
(global-set-key (kbd "C-x C-d") (lambda()
                                (interactive)
                                (dired default-directory)
                                ))
;; TODO replace the old weird keybinds for dired
(global-set-key (kbd "M-p") #'backward-paragraph)
(global-set-key (kbd "M-n") #'forward-paragraph)
