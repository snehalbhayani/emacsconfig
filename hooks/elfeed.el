(require 'elfeed)
(setq elfeed-feeds '(("http://oremacs.com/atom.xml" emacs)
                     ("http://endlessparentheses.com/atom.xml" emacs)
                     ("http://pragmaticemacs.com/feed/" emacs)
                     ("http://9gagrss.com/feed/" 9gag)
                     ("http://www.commitstrip.com/en/feed/" commitstrip)))

;; Elfeed goodies configuration
(with-eval-after-load 'elfeed (elfeed-goodies/setup))
