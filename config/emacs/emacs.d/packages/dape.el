(use-package dape
  :config
  (add-to-list 'dape-configs
               '(php-xdebug
                 modes (php-mode php-ts-mode)
                 ensure dape-ensure-command
                 command "php-debug-adapter"
                 host "0.0.0.0"
                 port 9003
                 :request "launch"
                 :type "php")))

(use-package repeat
  :config
  (repeat-mode 1))
