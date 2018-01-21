function fish_user_key_bindings
    if which fzf >/dev/null
        fzf_key_bindings
    end
end

function __write_help
    set -l command $argv[1]
    # show help specific to a subcommand if one is given, otherwise this variable is expanded to an empty string.
    set -l subcommand $argv[2]

    if test -z (which "$command")
        return 1
    end

    set -l help_output_storage (mktemp)
    eval "$command" "$subcommand" --help > "$help_output_storage"
    set -l ok $status

    if test "$ok" -eq 0
        less "$help_output_storage"
    end

    return (echo "$ok")
end

function __fish_man_page2
    # Get all commandline tokens not starting with "-"
    set -l args (commandline -po | string match -rv '^-')

    # If commandline is empty, exit.
    if not set -q args[1]
        printf \a
        return
    end

    # If there are at least two tokens not starting with "-", the second one might be a subcommand.
    # Try "man first-second" and fall back to "man first" if that doesn't work out.
    set -l maincmd (basename $args[1])
    if set -q args[2]
        set -l subcommand "$args[2]"
        man "$maincmd-$subcommand" ^/dev/null
        or __write_help "$maincmd" "$subcommand"
        or man "$maincmd" ^/dev/null
        or __write_help "$maincmd"
        or printf \a
    else
        man "$maincmd" ^/dev/null
        __write_help "$maincmd"
        or printf \a
    end

    commandline -f repaint
end

# bind to escape or meta h. <alt-h>
bind \eh __fish_man_page2
