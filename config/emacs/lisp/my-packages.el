(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t)

;; (add-to-list 'load-path
;;   (expand-file-name "lisp" user-emacs-directory))
