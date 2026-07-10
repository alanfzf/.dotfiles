(use-package apheleia
  :config
  (setf (alist-get 'php-cs-fixer apheleia-formatters)
    '("php-cs-fixer"
       "fix"
       "--using-cache=no"
       "--quiet"
       inplace))

  (setf (alist-get 'php-mode apheleia-mode-alist)
    'php-cs-fixer)

  (setf (alist-get 'php-ts-mode apheleia-mode-alist)
    'php-cs-fixer)

  (apheleia-global-mode +1))
