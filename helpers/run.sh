#!/bin/bash

if [[ -z "$EMACS" ]]; then
    echo "NO EMACS!!";
    exit 1;
else
    # Paradox
    cd ~/.melpa &&
        git pull &&
        cd ~/.paradox/helpers &&
        git checkout data &&
        git pull &&
        /usr/bin/nice $EMACS --batch -Q -L . -L .. -l paradox-counter.el -f toggle-debug-on-error -f paradox-generate-star-count &&
        git add .. &&
        git commit -m "$(date)" &&
        git push -v origin data:refs/heads/data;
fi
