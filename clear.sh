source ./resources.sh

must_commit=$1

true_flag="y"
false_flag="n"

info "Starting..."
sleep 2s

if [[ $must_commit != "$true_flag" && $must_commit != "$false_flag" ]]; then

    warn "A flag \"$true_flag\" (for yes) or \"$false_flag\" (for not) must be supplied (changes must be committed flag)"

else

    info "Checking flags..."
    sleep 2s

    if [ "$must_commit" = "$true_flag" ]; then
        alert "Changes MUST BE COMMITED!"
    else
        alert "Changes MUST NOT BE COMMITED!"
    fi;

    sleep 2s

    # License directory check
    info "Checking for license directory..."
    sleep 2s

    LICENSE_DIR=./.license
    if [ ! -d "$LICENSE_DIR" ]; then
        mkdir .license
    fi

    success "License directory is ready!"

    sleep 1s

    # README
    info "Saving MIT LICENSE and README files..."
    sleep 2s

    README_FILE=./README.md
    if test -f "$README_FILE"; then
        mv README.md ./.license
    fi
    LICENSE_FILE=./LICENSE
    if test -f "$LICENSE_FILE"; then
        mv LICENSE ./.license
    fi

    success "Saved!"

    sleep 1s

    # HTML, CSS and JS
    info "Removing HTML, CSS and JS files..."
    sleep 1.5s
    rm -rf *.html
    rm -rf *.css
    rm -rf *.js
    success "Removed!"

    sleep 1s

    # Assets (Icons, txt, ...)
    info "Removing assets files..."
    sleep 1.5s
    rm -rf *.ico
    rm -rf *.txt
    rm -rf ./assets
    success "Icons removed!"

    sleep 1s

    # Check if changes must be commited
    info "Checking if changes must be committed..."
    sleep 2s

    if [ "$must_commit" = "$true_flag" ]; then
        info "Response:"
        success " - MUST COMMIT CHANGES"

        # Wait 3 seconds
        sleep 3s

        git_commit_and_push "Old build removed"
    else
        info "Response:"
        warn " - MUST NOT COMMIT CHANGES"

        # Wait
        sleep 1.5s

        # Message
        info "Nothing to commit."
    fi;

    # Done
    sleep 2s
    success "Done!"

fi;