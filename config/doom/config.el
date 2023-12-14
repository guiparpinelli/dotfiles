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
(set-frame-parameter (selected-frame) 'alpha 90)

;;
;;; ui
(setq doom-theme 'doom-one
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

(after! (:or lsp-mode lsp)
  :config
  (setq lsp-response-timeout 90000))

;;; :tools magit
(setq magit-repository-directories '(("~/workspace" . 1))
      magit-save-repository-buffers nil
      ;; Don't restore the wconf after quitting magit, it's jarring
      magit-inhibit-save-previous-winconf t
      transient-values '((magit-rebase "--autosquash" "--autostash")
                         (magit-pull "--rebase" "--autostash")
                         (magit-revert "--autostash")))

(after! projectile
  :config
  (setq projectile-project-search-path '("~/workspace")))

(after! poetry
  :defer t
  :config
  (setq poetry-tracking-strategy 'projectile)
  (remove-hook! 'python-mode-hook #'poetry-tracking-mode))
