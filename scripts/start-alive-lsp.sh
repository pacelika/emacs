#!/bin/bash

if [ -d "$HOME/quicklisp/local-projects/alive-lsp/" ]; then
    sbcl \
        --noinform \
        --eval "(ql:quickload :alive-lsp)" \
        --eval "(alive/server::start :port 57846)"
fi
