(doom! :completion
       (company +childframe +tng)
       (vertico +icons +childframe)

       :ui
       deft
       doom
       doom-dashboard
       doom-quit
       hl-todo
       modeline
       nav-flash
       ophints
       (popup +defaults)
       (vc-gutter +pretty +diffhl)
       vi-tilde-fringe
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       multiple-cursors
       snippets
       word-wrap

       :emacs
       (dired +icons)
       electric
       (undo +tree)
       vc

       :term
       eshell

       :checkers
       (syntax +childframe)
       (spell +aspell)
       grammar

       :tools
       ansible
       debugger
       (docker +lsp)
       (eval +overlay)
       gist
       (lookup +docsets +dictionary)
       (lsp +peek)
       (magit +forge)
       make
       pdf
       terraform

       :os
       (:if IS-MAC macos)
       tty

       :lang
       emacs-lisp
       (go +lsp)
       (json +lsp)
       (javascript +lsp)
       markdown
       (org +journal +pretty)
       (python +pyenv +poetry +lsp +pyright)
       rest
       (rust +lsp)
       (sh +lsp)
       (web +lsp)
       (yaml +lsp)


       :config
       (default +bindings +smartparens))
