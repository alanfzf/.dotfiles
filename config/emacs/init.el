;; add folder to be required
(add-to-list 'load-path
  (expand-file-name "lisp" user-emacs-directory))

(load "my-dired")
(load "my-epair")
(load "my-keybinds")
(load "my-options")
(load "my-org")
(load "my-packages")
