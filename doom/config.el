;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
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

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Guilherme Parpinelli"
  user-mail-address "guilheerme.p@gmail.com"
  default-directory "~/"
  command-line-default-directory "~/")

;; Start Emacs fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Prevents some cases of Emacs flickering.
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Background opacity
(set-frame-parameter (selected-frame) 'alpha 85)

;;
;;; ui
(setq doom-theme 'doom-dracula
  doom-font (font-spec :family "JetBrains Mono" :size 14)
  display-line-numbers-type 'relative)

;;; :ui doom-dashboard
(setq fancy-splash-image (concat doom-user-dir "splash.png"))

;;; :ui modeline
(after! doom-modeline
  :config

  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)

  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-buffer-encoding t)
  (setq doom-modeline-indent-info t)

  (setq doom-modeline-env-version t)
  (setq doom-modeline-env-load-string "...")

  ;; Don’t compact font caches during GC.
  (setq inhibit-compacting-font-caches t))

;;
;;; Modules

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
  evil-vsplit-window-right t)

;; Implicit /g flag on evil ex substitution, because I use the default behavior
;; less often.
(setq evil-ex-substitute-global t)

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

(after! projectile
  :config
  (setq projectile-project-search-path '("~/workspace" "~/go/src")))

(after! poetry
  :defer t
  :config
  (setq poetry-tracking-strategy 'projectile)
  (remove-hook! 'python-mode-hook #'poetry-tracking-mode))
