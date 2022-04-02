;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(display-time-mode 1)
(display-battery-mode 1)
(setq auth-sources '("~/.authinfo" "~/.authinfo.gpg" "~/.netrc"))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq
 doom-font (font-spec :family "JetBrains Mono" :size 15 :weight 'regular)
 doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 15)
 doom-theme 'doom-one
 default-directory "~/"
 command-line-default-directory "~/"
 display-line-numbers t
 display-line-numbers-type 'relative
 projectile-project-search-path '("~/workspace/")
 projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/"))

(after! (:or lsp-mode lsp)
  :config
  (setq lsp-response-timeout 90000))

(after! company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-lsp-async t)
  (setq company-lsp-cache-candidates t)
  (setq company-lsp-enable-recompletion t))

(after! company
  :config
  (setq company-selection-wrap-around t)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0))

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

(after! flycheck
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enable)))

(after! ivy
  :config
  (setq enable-recursive-minibuffers t)

  ;; enable this if you want `swiper' to use it
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (counsel-rg . ivy--regex-plus)
          (t      . ivy--regex-fuzzy)))

  (setq ivy-bibtex-default-action 'ivy-bibtex-insert-key)

  (defun eh-ivy-return-recentf-index (dir)
    (when (and (boundp 'recentf-list)
               recentf-list)
      (let ((files-list
             (cl-subseq recentf-list
                        0 (min (- (length recentf-list) 1) 20)))
            (index 0))
        (while files-list
          (if (string-match-p dir (car files-list))
              (setq files-list nil)
            (setq index (+ index 1))
            (setq files-list (cdr files-list))))
        index)))

  (defun eh-ivy-sort-file-function (x y)
    (let* ((x (concat ivy--directory x))
           (y (concat ivy--directory y))
           (x-mtime (nth 5 (file-attributes x)))
           (y-mtime (nth 5 (file-attributes y))))
      (if (file-directory-p x)
          (if (file-directory-p y)
              (let ((x-recentf-index (eh-ivy-return-recentf-index x))
                    (y-recentf-index (eh-ivy-return-recentf-index y)))
                (if (and x-recentf-index y-recentf-index)
                    ;; Directories is sorted by `recentf-list' index
                    (< x-recentf-index y-recentf-index)
                  (string< x y)))
            t)
        (if (file-directory-p y)
            nil
          ;; Files is sorted by mtime
          (time-less-p y-mtime x-mtime)))))

  (add-to-list 'ivy-sort-functions-alist
               '(read-file-name-internal . eh-ivy-sort-file-function)))

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
        org-cycle-separator-lines 2)

  (setq
   org-log-done 'time
   org-clock-persist 'history
   org-directory "~/org"
   org-archive-location "archives/%s_archive::"
   org-agenda-files (list org-directory)
   org-log-into-drawer t
   org-agenda-inhibit-startup t
   org-todo-keywords '((sequence "TODO(t!)" "CURRENT(u!)" "WAIT(w@/!)" "NEXT(n!)" "PROJ(o!)" "|")
                       (sequence "READ(!)")
                       (sequence "|" "DONE(d!)" "CANCELED(c!)"))
   org-todo-keyword-faces '(("CURRENT"  . "orange")
                            ("TODO" . "systemRedColor")
                            ("READ" . "systemOrangeColor")
                            ("HOLD"  . "indianRed")
                            ("WAIT" . "salmon1")
                            ("PROJ" . "systemYellowColor"))
   org-capture-template-dir (concat doom-private-dir "org-captures/")
   org-capture-templates
   `(
     ("c" "Code" entry (file "~/org/code.org")
      (file ,(concat org-capture-template-dir "code-snippet.capture")))
     ("j" "Journal" entry (file+datetree "~/org/journal.org")
      (file ,(concat org-capture-template-dir "journal.capture")))
     ("b" "Blog post" entry (file+olp "~/org/blog.org" "Posts")
      (file ,(concat org-capture-template-dir "blog-post.capture")))
     ("r" "Register new book" entry (file+olp "~/org/notes.org" "Books")
      (file ,(concat org-capture-template-dir "new-book.capture")))
     ("w" "Weekly journal" entry (file+olp+datetree "~/org/journal/weekly.org" "Weekly notes")
      (file ,(concat org-capture-template-dir "weekly-journal.capture")) :tree-type week)))

  (setq-default org-catch-invisible-edits 'smart)

  (defun parpi/org-mode-hook()
    (when (featurep! :completion company)
      (message "Disabling company-mode while in org-capture...")
      (company-mode -1)))
  (add-hook! org-capture-mode #'parpi/org-mode-hook)

  ;; from: https://xenodium.com/emacs-dwim-do-what-i-mean/
  (defun parpi/org-insert-link-dwim ()
    "Like `org-insert-link' but with personal dwim preferences."
    (interactive)
    (let* ((point-in-link (org-in-regexp org-link-any-re 1))
           (clipboard-url (when (string-match-p "^http" (current-kill 0))
                            (current-kill 0)))
           (region-content (when (region-active-p)
                             (buffer-substring-no-properties (region-beginning)
                                                             (region-end)))))
      (cond ((and region-content clipboard-url (not point-in-link))
             (delete-region (region-beginning) (region-end))
             (insert (org-make-link-string clipboard-url region-content)))
            ((and clipboard-url (not point-in-link))
             (insert (org-make-link-string
                      clipboard-url
                      (read-string
                       "title: "
                       (with-current-buffer (url-retrieve-synchronously clipboard-url)
                         (dom-text
                          (car (dom-by-tag (libxml-parse-html-region
                                            (point-min)
                                            (point-max))
                                           'title))))))))
            (t (call-interactively 'org-insert-link))))))

(after! (:or org-roam roam2)
  :defer t
  :config
  (setq
   org-roam-directory "~/org/roam"
   org-roam-index-file (concat org-roam-directory "/" "index.org")))

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

(use-package! poetry
  :defer t
  :hook (python-mode . poetry-tracking-mode)
  :config
  (setq poetry-tracking-strategy 'projectile))

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

(use-package! org-superstar
  :after org-mode
  :hook (org-mode . org-superstar-mode)
  :custom
  (setq
   org-superstar-remove-leading-stars t
   org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))
