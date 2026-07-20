(use-package git-gutter
  :init
  (global-git-gutter-mode +1)
  :bind
  (
    ("C-x v n " . git-gutter:next-hunk)
    ("C-x v p" . git-gutter:previous-hunk)
    ("C-x v ="   . git-gutter:popup-hunk)
    )
  )

(use-package magit
  :pin melpa
  )
