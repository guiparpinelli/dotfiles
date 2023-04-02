;;; init.el -*- lexical-binding: t; -*-

;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input
       ;;bidi
       ;;chinese
       ;;japanese
       ;;layout

       :completion
       company
       ;;helm
       ;;ido
       ;;ivy
       (vertico +childframe)

       :ui
       ;;deft
       doom
       doom-dashboard
       doom-quit
       ;;(emoji +unicode)
       hl-todo
       ;;hydra
       ;;indent-guides
       ;;ligatures
       ;;minimap
       modeline
       nav-flash
       ;;neotree
       ophints
       (popup +defaults)
       ;;tabs
       treemacs
       ;;unicode
       (vc-gutter +diffhl +pretty)
       vi-tilde-fringe
       ;;window-select
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       ;;god
       ;;lispy
       multiple-cursors
       ;;objed
       ;;parinfer
       rotate-text
       snippets
       word-wrap

       :emacs
       dired
       electric
       ibuffer
       (undo +tree)
       vc

       :term
       ;;eshell
       ;;shell
       ;;term
       vterm

       :checkers
       syntax
       ;;(spell +flyspell)
       ;;grammar

       :tools
       ;;ansible
       ;;biblio
       debugger
       ;;direnv
       (docker +lsp)
       editorconfig
       ;;ein
       (eval +overlay)
       gist
       lookup
       (lsp)
       (magit +forge)
       make
       ;;pass
       pdf
       ;;prodigy
       rgb
       ;;taskrunner
       ;;terraform
       ;;tmux
       tree-sitter
       ;;upload

       :os
       (:if IS-MAC macos)
       tty

       :lang
       ;;agda
       ;;beancount
       (cc +tree-sitter +lsp)
       ;;clojure
       ;;common-lisp
       ;;coq
       ;;crystal
       ;;csharp
       ;;data
       ;;(dart +flutter)
       ;;dhall
       ;;elixir
       ;;elm
       emacs-lisp
       ;;erlang
       ;;ess
       ;;factor
       ;;faust
       ;;fortran
       ;;fsharp
       ;;fstar
       ;;gdscript
       (go +tree-sitter +lsp)
       ;;(graphql +lsp)
       ;;(haskell +lsp)
       ;;hy
       ;;idris
       (json +tree-sitter +lsp)
       ;;(java +lsp)
       (javascript +tree-sitter +lsp)
       ;;julia
       ;;kotlin
       ;;latex
       ;;lean
       ;;ledger
       lua
       markdown
       ;;nim
       ;;nix
       ;;ocaml
       (org +pretty)
       ;;php
       ;;plantuml
       ;;purescript
       (python
        +pyenv
        +lsp
        +pyright
        +poetry
        +tree-sitter)
       ;;qt
       ;;racket
       ;;raku
       rest
       ;;rst
       ;;(ruby +rails)
       (rust +tree-sitter +lsp)
       ;;scala
       ;;(scheme +guile)
       (sh +tree-sitter +lsp)
       ;;sml
       ;;solidity
       ;;swift
       ;;terra
       (web +tree-sitter +lsp)
       (yaml +tree-sitter +lsp)
       ;;zig

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere
       ;;irc
       ;;(rss +org)
       ;;twitter

       :config
       ;;literate
       (default +bindings +smartparens))
