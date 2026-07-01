(use-package apheleia
  :config
  (setf (alist-get 'lua-mode apheleia-mode-alist) '(stylua)
        (alist-get 'lua-ts-mode apheleia-mode-alist) '(stylua))
  (apheleia-global-mode +1))
