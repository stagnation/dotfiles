XCLIP='xclip -selection clipboard'
TMPFILE="/tmp/clipboard"

# unset CLIPSAVE
# unset CLIPRESTORE

function save {
    echo "saving"
    $XCLIP -o > $TMPFILE
}

function restore {
    echo "restoring"
    cat $TMPFILE | $XCLIP -i
}

while getopts "sr" opt; do
    case $opt in
        s)
            echo "s"
            save
            ;;
        r)
            echo "r"
            if [ -f $TMPFILE ] #TODO is this the robust bash syntax?
            then
                restore || echo ""
            fi
            ;;
    esac
done

