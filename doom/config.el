;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "Hack" :size 16)
      doom-theme 'doom-monokai-pro
      display-line-numbers t
      display-line-numbers-type 'relative
      default-directory "~/"
      command-line-default-directory "~/"
      projectile-project-search-path '("~/workspace" "~/go/src")
      projectile-ignored-projects '("~/" "~/.emacs.d"))

(display-time-mode 1)
(display-battery-mode 1)
(toggle-frame-maximized)
(setq-default enable-local-variables t)

(after! doom-modeline
  :config

  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)

  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)

  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-buffer-encoding t)
  (setq doom-modeline-indent-info t)

  (setq doom-modeline-env-version t)
  (setq doom-modeline-env-load-string "..."))

(after! org
  :config
  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2))

(after! org-journal
  :defer t
  :config
  (setq org-journal-dir "~/org/journal")
  (push org-journal-dir org-agenda-files)
  (setq org-journal-enable-agenda-integration t)
  (setq org-journal-file-format "%Y%m%d.org"))

(after! deft
  :defer t
  :config
  (setq deft-directory "~/org"
        deft-extensions '("org" "md" "txt")
        deft-default-extension "org"
        deft-recursive t
        deft-use-filename-as-title nil
        deft-use-filter-string-for-filename t
        deft-file-naming-rules '((nospace . "-"))))

(use-package! py-isort
  :defer t
  :after python-mode
  :mode ("[./]flake8\\'" . conf-mode)
  :config
  (add-hook 'before-save-hook 'py-isort-before-save))

(use-package! prettier
  :defer t
  :after web-mode
  :hook ((typescript-tsx-mode . prettier-mode)
         (typescript-mode . prettier-mode)
         (js-mode . prettier-mode)
         (json-mode . prettier-mode)
         (css-mode . prettier-mode)
         (scss-mode . prettier-mode))
  :config
  (add-hook 'before-save-hook 'prettier-prettify))
