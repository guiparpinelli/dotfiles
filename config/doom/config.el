;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; (setq auth-sources '("~/.authinfo" "~/.authinfo.gpg" "~/.netrc"))
;; (setq-default enable-local-variables t)

;;
;;; ui
(setq doom-theme 'doom-rose-pine
      display-line-numbers-type 'relative
      default-directory "~/"
      command-line-default-directory "~/")

(display-time-mode 1)
(display-battery-mode 1)
;; Start Emacs fullscreen (FIXME)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; Remove title bar
(add-to-list 'default-frame-alist '(undecorated . t))
;; Background opacity
(set-frame-parameter (selected-frame) 'alpha 90)


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

(after! org
  :config
  (setq org-directory "~/notes/org")
  (setq
   org-log-done 'time
   org-clock-persist 'history
   org-archive-location ".archives/%s_archive::"
   org-agenda-files (list org-directory)
   org-log-into-drawer t
   org-agenda-inhibit-startup t
   org-capture-template-dir (concat doom-user-dir "org-captures/")
   org-capture-templates
   `(
     ("t" "Todo" entry (file ,(concat org-directory "/todos.org"))
      "* TODO %?\n %i\n  %a")
     ("c" "Code" entry (file ,(concat org-directory "/code.org"))
      (file ,(concat org-capture-template-dir "code-snippet.capture")))
     ("b" "Blog post" entry (file+olp ,(concat org-directory "/blog.org") "Posts")
      (file ,(concat org-capture-template-dir "blog-post.capture")))
     ("d" "Decision record" entry (file ,(concat org-directory "/decisions.org"))
      (file ,(concat org-capture-template-dir "decision.capture")))
     ("r" "RPD" entry (file ,(concat org-directory "/rpd.org"))
      (file ,(concat org-capture-template-dir "rpd.capture")))))
  (setq-default org-catch-invisible-edits 'smart))

(after! (org-journal org)
  :defer t
  :config
  (setq org-journal-dir "~/notes/org/journal")
  (push org-journal-dir org-agenda-files)
  (setq org-journal-enable-agenda-integration t)
  (setq org-journal-encrypt-journal t)
  (setq org-journal-file-format "%Y%m%d.org"))

(after! deft
  :defer t
  :config
  (setq deft-directory "~/notes/org"
        deft-extensions '("org" "md" "txt")
        deft-default-extension "org"
        deft-recursive t
        deft-use-filename-as-title nil
        deft-use-filter-string-for-filename t
        deft-file-naming-rules '((nospace . "-"))))

(after! doom-modeline
  :config
  (setq doom-modeline-continuous-word-count-modes
        '(markdown-mode gfm-mod)))

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

;;; :lang python
;; Check usage in ~/.config/emacs/modules/tools/debugger/README.org
(after! dap-mode
  (setq dap-python-debugger 'debugpy))

(after! apheleia
  :defer t
  :config
  ;; make ruff the priority
  (add-to-list 'apheleia-mode-alist '(python-mode . ruff)))
