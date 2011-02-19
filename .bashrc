# Set prompt to:
#
# [current time] MACHINE:CWD [$?] {current git branch} $

function update_prompt() {
    GIT_BRANCH=$(git branch 2>/dev/null | grep '^\*' | cut -d ' ' -f 2)
    if ! test -z $GIT_BRANCH; then
	if $(git status 2>/dev/null| grep -q 'added to commit'); then
		STATUS=" ☠"
	fi
	echo " {$GIT_BRANCH$STATUS} "
    fi
}

if test `id -u` = 0; then
    export PS1="[\t] \h:\w# "
else
    export PS1="[\t] \h:\w [\$?]\$(update_prompt)\$ "
fi
