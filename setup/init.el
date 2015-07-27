(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defvar my-packages '(better-defaults
		                  projectile
                      clojure-mode
                      cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
