(use-package tempel-collection)
(use-package tempel
  :bind
  (("M-+" . tempel-complete)
    ("M-*" . tempel-insert))
  :init
  (defun tempel-setup-capf ()
    ;; `tempel-complete' provides partial template-name candidates.
    (add-hook 'completion-at-point-functions
      #'tempel-complete nil t))

  :hook
  ((prog-mode text-mode org-mode) . tempel-setup-capf))


(use-package completion-preview
  :ensure nil
  :hook
  ((prog-mode org-mode text-mode) . completion-preview-mode)
  :custom
  (completion-preview-minimum-symbol-length 1)
  :bind
  (:map completion-preview-active-mode-map
    ("RET" . completion-preview-insert)
    ("M-n" . completion-preview-next-candidate)
    ("M-p" . completion-preview-prev-candidate)))
