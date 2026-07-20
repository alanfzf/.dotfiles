(use-package reformatter
  :config
  (reformatter-define nixfmt
    :program "nixfmt"
    :args '("-"))

  (reformatter-define php-cs-fixer
    :program "php-cs-fixer"
    :args (list
            "fix"
            "--using-cache=no"
            "--quiet"
            input-file)
    :stdin nil
    :stdout nil
    :input-file (reformatter-temp-file "php"))

  :hook
  (
    (nix-mode . nixfmt-on-save-mode)
    (php-mode . php-cs-fixer-on-save-mode)
    )
  )
