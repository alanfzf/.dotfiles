;; ls lisp code
(require 'ls-lisp)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

;; dired code
(require 'dired-x)
(setq dired-omit-files "^\\.[^.].*")
(add-hook 'dired-mode-hook #'dired-omit-mode)
(define-key dired-mode-map (kbd "M-o") #'dired-omit-mode)
