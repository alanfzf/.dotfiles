;; package manager
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

(let* ((config-dir (file-name-directory (or load-file-name buffer-file-name)))
       (packages-dir (expand-file-name "packages" config-dir)))
  (mapc #'load
        (sort (directory-files packages-dir t "\\.el$") #'string<)))
