GITHUB_REPOSITORY_URL="https://github.com/productionscollab/productionscollab"

function print_message {
    DEFAULTCOLOR="\033[0;36m" # Default print color
    NOCOLOR="\033[0m" # No Color
    COLOR=$1
    if [ "$COLOR" = "" ]; then
        COLOR="$DEFAULTCOLOR"
    fi;
    MESSAGE=$2
    echo -e "${DEFAULTCOLOR}# > ${COLOR}${MESSAGE}${NOCOLOR}" # Styled print
}

function info {
    message=$1
    COLOR="" # Default Color
    print_message "$COLOR" "$message" # Styled print
}
function success {
    message=$1
    COLOR="\033[0;32m" # Color
    print_message "$COLOR" "$message" # Styled print
}
function alert {
    message=$1
    COLOR="\033[0;33m" # Color
    print_message "$COLOR" "$message" # Styled print
}
function warn {
    message=$1
    COLOR="\033[0;31m" # Color
    print_message "$COLOR" "$message" # Styled print
}

function git_commit_and_push {
    COMMIT_MESSAGE=$1

    info "Running: > git add ."
    sleep 1.5s
    git add .

    info "Running: > git commit -m \"${COMMIT_MESSAGE}\""
    sleep 1.5s
    git commit -m "$COMMIT_MESSAGE"

    info "Running: > git push"
    sleep 1.5s
    git push

    success "Changes sent to the remote repository (\"$GITHUB_REPOSITORY_URL\")!"
}