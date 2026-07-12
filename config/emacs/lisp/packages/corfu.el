;; download tempel collection
(use-package tempel-collection)
(use-package cape
  :bind ("C-c p" . cape-prefix-map)
  :init
  )

(use-package tempel
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
          ("M-*" . tempel-insert))
  :init
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    (setq-local corfu-auto-trigger "/"
      completion-at-point-functions
      (cons (cape-capf-trigger #'tempel-complete ?/)
        completion-at-point-functions))
    )

  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  )

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 1)
  (corfu-cycle t)
  (corfu-auto-delay 0.2)
  (corfu-quit-no-match 'separator)
  :init
  (global-corfu-mode)
  )
