;; Elfeed goodies configuration
(with-eval-after-load 'elfeed (elfeed-goodies/setup))

(require 'elfeed-goodies)
(setq elfeed-search-filter "+unread"
      elfeed-goodies/wide-threshold 0.25
      elfeed-goodies/entry-pane-position 'bottom
      elfeed-goodies/entry-pane-size 0.85
      elfeed-goodies/show-mode-padding 0
      elfeed-goodies/feed-source-column-width 24
      elfeed-goodies/tag-column-width 30
      elfeed-goodies/html-decode-title-tags '(:all))
