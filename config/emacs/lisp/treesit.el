;; treesitter source repo list
(setq treesit-language-source-alist
  '(
     (jsdoc . ("https://github.com/tree-sitter/tree-sitter-jsdoc" "master"))
     (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master"))
     (css . ("https://github.com/tree-sitter/tree-sitter-css" "master"))
     (html . ("https://github.com/tree-sitter/tree-sitter-html" "master"))
     (phpdoc . ("https://github.com/claytonrcarter/tree-sitter-phpdoc" "master"))
     (php . ("https://github.com/tree-sitter/tree-sitter-php" "master" "php/src"))
     )
  )

(dolist (source treesit-language-source-alist)
  (unless (treesit-ready-p (car source))
    (treesit-install-language-grammar (car source))))

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-ts-mode))
(add-to-list 'major-mode-remap-alist '(php-mode . php-ts-mode))
(setq treesit-font-lock-level 4)
