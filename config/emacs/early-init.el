(defun load-file-path (filename)
  "Load FILENAME from the lisp directory."
  (load-file
   (expand-file-name
    filename
    (expand-file-name "lisp/" user-emacs-directory))))
