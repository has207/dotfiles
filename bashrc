# Set prompt to:
#
# [current time] MACHINE:CWD [$?] {current git branch} $

function update_prompt() {
  GIT_BRANCH=$(git branch 2>/dev/null | grep '^\*' | cut -d ' ' -f 2)
  if ! test -z $GIT_BRANCH; then
    if $(git status 2>/dev/null| egrep -q '^#\s*(deleted|modified|new\ file|renamed):'); then
      STATUS=" !! "
    fi
    echo " {$GIT_BRANCH$STATUS} "
  fi
}

if test `id -u` = 0; then
    export PS1="[\t] \h:\w# "
else
    export PS1="[\t] \h:\w [\$?]\$(update_prompt)\$ "
fi

# improve interactive python experience
export PYTHONSTARTUP=~/.python

# Shell history related
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# bash4 features
shopt -s globstar autocd

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# OSX specific stuff
if test $(uname) = Darwin; then
  # javac 文字化け fix
  export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

  # MacPorts
  if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  fi

  # sml needs some readline love
  if [ -f /opt/local/bin/sml ]; then
    function sml() {
      socat READLINE EXEC:"/opt/local/bin/sml $*"
    }
  fi

  # CUDA env stuff
  if [ -d /Developer/NVIDIA/CUDA-5.0 ]; then
    export PATH=/Developer/NVIDIA/CUDA-5.0/bin:$PATH
    export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.0/lib:$DYLD_LIBRARY_PATH
  fi

  if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
  fi
fi

if [ -f .bashrc.local ]; then
  . .bashrc.local
fi
