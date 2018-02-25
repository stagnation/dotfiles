# name: GitStatus
# Find latest version from: https://github.com/godfat/fish_prompt-gitstatus

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_status_symbol
  set -l git_status (git status --porcelain ^/dev/null)
  if test -n "$git_status"
    # Is there anyway to preserve newlines so we can reuse $git_status?
    if git status --porcelain ^/dev/null | grep '^.[^ ]' >/dev/null
      echo '*' # dirty
    else
      echo '#' # all staged
    end
  else
    echo    '' # clean
  end
end

function _remote_hostname
  if test -n "$SSH_CONNECTION"
    echo SSH (whoami)@(hostname)
  end
end

function _print_if_greater_than
    # print numerical argument 1,
    # if it is greater than the threshold, argument 2
    # adds a space after for convenience
    set -l arg "$argv[1]"
    set -l threshold "$argv[2]"
    if test "$arg" -gt "$threshold"
        echo "$arg "
    end
end

function _job_count
  set -l job_count (jobs | wc -l)
  _print_if_greater_than $job_count 0
end

function _tmux_window_count
    # early exit if we are not in tmux
    if test -z "$TMUX";
        return
    end

    set -l window_count (tmux list-windows | wc -l)
    _print_if_greater_than $window_count 1

end

function fish_prompt
  set stat $status
  set date (date +%H:%M)
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)
  set -l git_status (_git_status_symbol)(_git_branch_name)

  if test -n "$git_status"
    set git_status "$git_status"
  end

  set -l job_count (_job_count)
  set -l tmux_window_count (_tmux_window_count)

  if test $stat -gt 0
    set date (set_color red)$date(set_color normal)
  end

  # echo -n (_remote_hostname) $tmux_window_count$cwd$cyan$git_status$normal $job_count$date" "
  printf "%s%s %s%s%s %s%s "  \
  (_remote_hostname) \
  # print number followed by space if valid
  "$tmux_window_count" \
  "$cwd"               \
  "$cyan"              \
  "$git_status"        \
  "$normal"            \
  "$job_count"         \
  "$date"
end
