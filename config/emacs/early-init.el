(defun load-file-path (filename)
  "Load FILENAME from the lisp directory."
  (load-file
    (expand-file-name
      filename
      (expand-file-name "lisp/" user-emacs-directory))))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)
