# Set prompt to:
#
# [current time] MACHINE:CWD [$?] {current git branch} $

function update_prompt() {
  GIT_BRANCH=$(git branch 2>/dev/null | grep '^\*' | cut -d ' ' -f 2)
  if ! test -z $GIT_BRANCH; then
    if $(git status 2>/dev/null| egrep -q '^#\s*(deleted|modified|new\ file):'); then
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

# OSX specific stuff
if test $(uname) = Darwin; then
  # sml needs some readline love
  function sml() {
    socat READLINE EXEC:"/opt/local/bin/sml $*"
  }

  # CUDA env stuff
  export PATH=/Developer/NVIDIA/CUDA-5.0/bin:$PATH:/Applications/Racket\ v5.3.3/bin
  export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-5.0/lib:$DYLD_LIBRARY_PATH

  # javac 文字化け fix
  export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
fi
