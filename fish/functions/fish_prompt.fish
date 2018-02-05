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

function _job_count
  set -l job_count (jobs | wc -l)

  if test "$job_count" -eq 0
      set job_count ""
  else
      set job_count $job_count" "
  end

  echo $job_count
end

function fish_prompt
  set stat $status
  set date (date +%H:%M)
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)
  set -l git_status (_git_status_symbol)(_git_branch_name)

  if test -n "$git_status"
    set git_status " $git_status"
  end

  set -l job_count (_job_count)

  if test $stat -gt 0
    set date (set_color red)$date(set_color normal)
  end

  echo -n (_remote_hostname) $cwd$cyan$git_status$normal $job_count$date" "
end
