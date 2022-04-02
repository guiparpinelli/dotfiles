;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a "Module Index" link where you'll find
;;      a comprehensive list of Doom's modules and what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :completion
       (company +auto +tng)
       (ivy +fuzzy)

       :ui
       deft
       doom
       doom-dashboard
       doom-quit
       fill-column
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +all +defaults)
       (treemacs +lsp)
       vc-gutter
       vi-tilde-fringe
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       rotate-text
       snippets

       :emacs
       dired
       electric
       ibuffer
       (undo +tree)
       vc

       :term
       vterm

       :checkers
       syntax

       :tools
       debugger
       (docker +lsp)
       editorconfig
       (eval +overlay)
       (lookup
        +docsets +dictionary)
       (lsp +eglot)
       (magit +forge)
       make

       :os
       (:if IS-MAC macos)

       :lang
       elixir
       emacs-lisp
       (go +lsp)
       (javascript +lsp)
       json
       latex
       markdown
       (org
        +roam2
        +journal
        +hugo
        +pretty
        +pandoc)
       (python
        +pyenv
        +poetry
        +lsp
        +pyright)
       rest
       (rust +lsp)
       (sh +lsp)
       (yaml +lsp)
       web

       :config
       (default +bindings +smartparens))
