(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

(let ((dir (expand-file-name "lisp/packages" user-emacs-directory)))
  (mapc #'load
        (directory-files dir t "\\.el$")))
