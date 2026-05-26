; extends

(
  (headline
    (stars) @org.headline.level1
    (#org-is-headline-level? @org.headline.level1 "1"))
  (#set! conceal "◉")
)

(
  (headline
    (stars) @org.headline.level2
    (#org-is-headline-level? @org.headline.level2 "2"))
  (#set! conceal "○")
)

(
  (headline
    (stars) @org.headline.level3
    (#org-is-headline-level? @org.headline.level3 "3"))
  (#set! conceal "✸")
)

(
  (headline
    (stars) @org.headline.level4
    (#org-is-headline-level? @org.headline.level4 "4"))
  (#set! conceal "✿")
)
