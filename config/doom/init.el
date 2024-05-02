(doom! :completion
       company
       (vertico +childframe)

       :ui
       doom
       doom-dashboard
       doom-quit
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       ;;multiple-cursors
       ;;rotate-text
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
       ;;ansible
       ;;biblio
       ;;debugger
       ;;direnv
       ;;(docker +lsp)
       ;;editorconfig
       ;;ein
       (eval +overlay)
       ;;gist
       lookup
       (lsp)
       magit
       make
       pdf
       rgb
       ;;tmux
       tree-sitter

       :os
       (:if IS-MAC macos)
       tty

       :lang
       ;;agda
       ;;beancount
       (cc +lsp)
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
       (go +lsp)
       ;;(graphql +lsp)
       ;;(haskell +lsp)
       ;;hy
       ;;idris
       (json +tree-sitter +lsp)
       ;;(java +lsp)
       ;;(javascript +tree-sitter +lsp)
       ;;julia
       ;;kotlin
       ;;latex
       ;;lean
       ;;ledger
       ;;(lua +tree-sitter +lsp)
       markdown
       ;;nim
       ;;nix
       ;;ocaml
       (org +pretty)
       ;;php
       ;;plantuml
       ;;purescript
       (python
        +tree-sitter
        +lsp
        +pyright)
       ;;qt
       ;;racket
       ;;raku
       rest
       ;;rst
       ;;(ruby +rails)
       (rust +lsp)
       ;;scala
       ;;(scheme +guile)
       sh
       ;;sml
       ;;solidity
       ;;swift
       ;;terra
       (web +tree-sitter +lsp)
       (yaml +lsp)
       ;;zig

       :config
       (default +bindings +smartparens))
