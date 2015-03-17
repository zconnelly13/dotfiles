# DETECT PLATFORM
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi

# COLOR
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# ALIASES
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    if [[ $platform == 'linux' ]]; then
      alias ls='ls --color=auto'
      alias grep='grep --color=auto'
      alias fgrep='fgrep --color=auto'
      alias egrep='egrep --color=auto'
    fi
fi

# some more ls aliases
if [[ $platform == 'linux' ]]; then
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'
fi

alias now='date -u +%Y-%m-%d-%T'

function search() { find . | xargs grep "$@";}

source ~/website/vendors/venv/bin/activate

get_random_failure_message () {
  failure_messages=(
    ":O"
    "(-_-)"
    "死定了，囧"
    "失败了"
    "好丢脸"
    "笨蛋"
    "注定"
    "好惨啊"
    "你的高手好丢脸"
  )
  RANDOM=$(( ( RANDOM % 133713371337133713371337 )  + 1 ))
  failure_message=${failure_messages[$RANDOM % ${#failure_messages[@]}]}
  return 0
}

set_bash_prompt () {
  get_random_failure_message
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $([[ $? != 0 ]] && echo "\[\033[01;31m\]$failure_message \[\033[01;34m\]")\$\[\033[00m\] '
}

PROMPT_COMMAND=set_bash_prompt

set -o vi

function tunnel
{
    command="ssh -NL 3333:0.0.0.0:5432 $1.counsyl.com";
    echo $command;
    eval $command;
}
