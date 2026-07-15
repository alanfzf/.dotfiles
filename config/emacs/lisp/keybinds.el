;; keybinds
(global-set-key (kbd "C-;") 'comment-line)

(global-set-key (kbd "C-x C-d") (lambda()
                                  (interactive)
                                  (dired default-directory)
                                  ))

(global-set-key (kbd "M-p") #'backward-paragraph)
(global-set-key (kbd "M-n") #'forward-paragraph)

;; custom ghostel keybind
(defun my/ghostel-toggle ()
  "Toggle a dedicated bottom window for ghostel."
  (interactive)
  (let ((ghostel-window (seq-find (lambda (w) (window-parameter w 'my-ghostel-window))
                          (window-list))))
    (if (window-live-p ghostel-window)
      (delete-window ghostel-window)
      ;; Split the current window in half below
      (let ((new-window (split-window nil nil 'below)))
        (set-window-parameter new-window 'my-ghostel-window t)
        (select-window new-window)
        (call-interactively #'ghostel)))))

(global-set-key (kbd "C-c t") #'my/ghostel-toggle)
