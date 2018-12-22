if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[34m\]'
	PS1="$PS1"'# '
	PS1="$PS1"'\[\033[36m\]'
	PS1="$PS1"'ytj '
	PS1="$PS1"'\[\033[37m\]'
	PS1="$PS1"'@ '
	PS1="$PS1"'\[\033[32m\]' # 32 绿色
	PS1="$PS1"'win10 '
	PS1="$PS1"'\[\033[37m\]'
	PS1="$PS1"'in '
	PS1="$PS1"'\[\033[33m\]' # 33 黄色
	PS1="$PS1"'\w '  
	PS1="$PS1"'\[\033[37m\]' # 37 白色
	PS1="$PS1"'[\t] '          # show MSYSTEM
	               # current working directory
	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PS1="$PS1"'\[\033[36m\]'  # change color to cyan
			PS1="$PS1"'`__git_ps1`'   # bash function
		fi
	fi
	PS1="$PS1"'\n'
	PS1="$PS1"'\[\033[33m\]'      # 31 红色
	PS1="$PS1"'$ '                 # prompt: always $
	PS1="$PS1"'\[\033[0m\]'
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc
