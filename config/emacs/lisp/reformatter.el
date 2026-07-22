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

  (reformatter-define xmlstarlet
    :program "xmlstarlet"
    :args '("format" "--indent-spaces" "2" "-"))

  :hook
  (
    (nix-mode . nixfmt-on-save-mode)
    (php-mode . php-cs-fixer-on-save-mode)
    (nxml-mode . xmlstarlet-on-save-mode)
    )
  )
