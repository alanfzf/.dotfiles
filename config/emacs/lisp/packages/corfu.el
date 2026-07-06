(use-package corfu
  :init
  (global-corfu-mode)
  :config
  ;; Enable auto completion, configure delay, trigger and quitting
  (setq corfu-auto t
      corfu-auto-delay 0.2
      corfu-auto-trigger "." ;; Custom trigger characters
      corfu-quit-no-match 'separator) ;; or t
  )
