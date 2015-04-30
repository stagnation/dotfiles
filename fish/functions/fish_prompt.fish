# name: GitStatus
# Find latest version from: https://github.com/godfat/fish_prompt-gitstatus
set -g fish_key_bindings fish_vi_key_bindings

function fish_vi_prompt_cm --description "Displays the current mode"
  #echo -n " "
  switch $fish_bind_mode
    case default
      #set_color --bold --background red white
      echo "[]"
    case insert
      #set_color --bold --background green white
      echo "~>"
    case visual
      #set_color --bold --background magenta white
      echo "[V]"
  end
  set_color normal
end

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
    echo (whoami)@(hostname)
  end
end

function fish_prompt
  set -l cyan (set_color cyan)
  set -l normal (set_color normal)

  set -l cwd (set_color $fish_color_cwd)(prompt_pwd)
  set -l git_status (_git_status_symbol)(_git_branch_name)

  if test -n "$git_status"
    set git_status " $git_status"
  end

  echo -n (_remote_hostname) $cwd$cyan$git_status$normal (fish_vi_prompt_cm)
end
