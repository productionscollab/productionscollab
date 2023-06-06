source ./resources.sh

file_path=$1

info "Starting..."
sleep 2s

if [ -z "$file_path" ]; then

    warn "A directory containing the compilation result must be provided to this script!"

    sleep 2s

    warn "Operation cancelled!"

else

    info "Checking directory path..."
    sleep 2s

    if [ ! -d "$file_path" ]; then

        warn "Directory \"$file_path\" not found!"

        sleep 2s

        warn "Operation cancelled!"

    else

        # Start message
        info "Retrieving the build from \"$file_path\"..."

        # Pointing to directory content
        file_path="${file_path}/*"

        # Wait 3 seconds
        sleep 3s

        # Copy build into current directory
        cp -r $file_path ./

        success "Build retrieved!"

        # Wait 3 seconds
        sleep 3s

        # Push changes to GitHub
        info "Pushing the changes to the remote repository..."

        # Auto Deploy and push alert
        sleep 2s
        alert "Attention: The deploy will be started automatically."
        info "Pushing to \"$GITHUB_REPOSITORY_URL\"..."

        # Commit and push changes
        git_commit_and_push "New application version"

        # Wait 3 seconds
        sleep 3s

        # Final Success message
        success "Done!"

    fi;

fi;