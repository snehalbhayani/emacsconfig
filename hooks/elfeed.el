(require 'elfeed)
(setq elfeed-feeds '(("http://oremacs.com/atom.xml" emacs)
                     ("http://endlessparentheses.com/atom.xml" emacs)
                     ("http://pragmaticemacs.com/feed/" emacs)
                     ("http://9gagrss.com/feed/" 9gag)
                     ("http://www.commitstrip.com/en/feed/" commitstrip)))

;; Elfeed goodies configuration
(with-eval-after-load 'elfeed (elfeed-goodies/setup))

;; Use wider columns in elfeed search
(require 'elfeed-goodies)
(setq elfeed-goodies/feed-source-column-width 24)
(setq elfeed-goodies/tag-column-width 30)
