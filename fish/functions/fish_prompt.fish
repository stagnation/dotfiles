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
    # prepends a prefix message, arguemnt 3
    # adds a space after for convenience
    set -l arg "$argv[1]"
    set -l threshold "$argv[2]"
    set -l prefix "$argv[3]"
    if test "$arg" -gt "$threshold"
        echo "$prefix$arg "
    end
end

function _job_count
  set -l job_count (jobs | wc -l)
  _print_if_greater_than "$job_count" 0 "jobs: "
end

function _tmux_window_count
    # early exit if we are not in tmux
    if test -z "$TMUX";
        return
    end

    set -l window_count (tmux list-windows | wc -l)
    set -l active_window (tmux list-windows | awk -F':' '/active/ { print $1 }')
    set -l prefix "tmux: $active_window/"
    _print_if_greater_than "$window_count" 1 "$prefix"
end

function fish_right_prompt
  set -l job_count (_job_count)
  set -l tmux_window_count (_tmux_window_count)

  echo -n "$job_count""$tmux_window_count"
end

function fish_prompt
  set -l stat "$status"
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l cwd (set_color "$fish_color_cwd")(prompt_pwd)
  set -l git_status (_git_status_symbol)(_git_branch_name)

  if test -n "$git_status"
    set git_status " $git_status"
  end

  set date " "(date +%H:%M)
  if test "$stat" -gt 0
    set date (set_color red)"$date"(set_color normal)
  end

  # echo -n (_remote_hostname) $tmux_window_count$cwd$cyan$git_status$normal $job_count$date" "
  printf " █%s %s%s%s%s " \
  "$date"              \
  (_remote_hostname)   \
  "$cwd"               \
  "$cyan"              \
  "$git_status"        \
  "$normal"
end
