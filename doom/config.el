;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Guilherme Parpinelli"
      user-mail-address "guilheerme.p@gmail.com")

;;
;;; ui

(setq doom-theme 'doom-dracula
      doom-font (font-spec :family "JetBrains Mono" :size 14 :weight 'light)
      display-line-numbers-type 'relative)

;; Start Emacs fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Prevents some cases of Emacs flickering.
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-user-dir "splash.png"))
;; Hide the menu for as minimalistic a startup screen as possible.
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

;;
;;; Modules

;;; :completion company
;; IMO, modern editors have trained a bad habit into us all: a burning need for
;; completion all the time -- as we type, as we breathe, as we pray to the
;; ancient ones -- but how often do you *really* need that information? I say
;; rarely. So opt for manual completion:
(after! company
  (setq company-idle-delay nil
        company-selection-wrap-around t
        company-minimum-prefix-length 1))

(after! company-lsp
  (push 'company-lsp company-backends)
  (setq company-lsp-async t)
  (setq company-lsp-cache-candidates t)
  (setq company-lsp-enable-recompletion t))

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;;; :tools lsp
;; Disable invasive lsp-mode features
(after! lsp-mode
  (setq lsp-enable-symbol-highlighting nil
        ;; If an LSP server isn't present when I start a prog-mode buffer, you
        ;; don't need to tell me. I know. On some machines I don't care to have
        ;; a whole development environment for some ecosystems.
        lsp-enable-suggest-server-download nil))
(after! lsp-ui
  (setq lsp-ui-sideline-enable nil  ; no more useful than flycheck
        lsp-ui-doc-enable nil))     ; redundant with K

;;; :tools magit
(setq magit-repository-directories '(("~/workspace" . 1) ("~/go/src" . 2))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t
      transient-values '((magit-rebase "--autosquash" "--autostash")
                         (magit-pull "--rebase" "--autostash")
                         (magit-revert "--autostash")))

;;; :lang org
(after! org
  :config
  (setq org-directory "~/org"
        org-archive-location (concat org-directory ".archive/%s::")
        org-agenda-files org-directory)
        org-startup-folded 'show2levels
        org-ellipsis " [...] ")

(after! org-journal
  :defer t
  :config
  (setq org-journal-dir (concat org-directory "journal/"))
  (push org-journal-dir org-agenda-files)
  (setq org-journal-enable-agenda-integration t
        org-journal-file-format "%Y%m%d.org"))

(after! deft
  :defer t
  :cofig
  (setq deft-directory "~/org"
        deft-extensions '("org" "md" "txt")
        deft-default-extension "org"
        deft-recursive t
        deft-use-filename-as-title nil
        deft-use-filter-string-for-filename t
        deft-file-naming-rules '((nospace . "-"))))

;; Implicit /g flag on evil ex substitution, because I use the default behavior
;; less often.
(setq evil-ex-substitute-global t)

(after! flycheck
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enable)))

(after! projectile
  :config
  (setq projectile-project-search-path '("~/workspace" "~/go/src")
        projectile-ignored-projects '("~/" "~/.emacs.d")))

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
