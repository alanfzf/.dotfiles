(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;; load custom packages
(load-file-path "packages/misc.el")
(load-file-path "packages/themes.el")
(load-file-path "packages/git.el")
(load-file-path "packages/eglot.el")
(load-file-path "packages/corfu.el")
(load-file-path "packages/reformatter.el")
(load-file-path "packages/modes.el")
