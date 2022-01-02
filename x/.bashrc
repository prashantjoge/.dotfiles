#
# ~/.bashrc
#
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

# To change directory without having to type 'cd'


# No need of cd. just type the directory name
shopt -s autocd

# Correct minor spelling errors in cd command
shopt -s cdspell

# Multiline commands are a single command in history.
shopt -s cmdhist

# Ignore duplicate entries in history. cntrl-r
export HISTCONTROL=erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
PROMPT_COMMAND='history -a'
export HISTIGNORE="ls:ps:history"
#export JAVA_OPTS="-server -Xms256m -Xmx1024m"
#export MAVEN_OPTS="$JAVA_OPTS -Dorg.apache.jasper.compiler.Parser.STRICT_QUOTE_ESCAPING=false"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export PDSH_RCMD_TYPE=ssh
#export CATALINA_HOME="/usr/share/tomcat8"

if [ -f ~/.aliasrc ]; then
    . ~/.aliasrc
fi
# To echo commands being executed on the prompt
# set -x
#echo "powerline daemon init"
#echo -n $(date +%H:%M:%S)
# echo " "
#function runpowerline {
#powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
#}
#time runpowerline
#echo "powerline finished"

#echo -n $(date +%H:%M:%S)
#echo " "

# End echo commands being executed
# set +x
###screenfetch
#neofetch
#fortune -s bible
export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim
export BROWSER=chromium
export URXVT_PERL_LIB="~/.urxvt/ext"
export XDG_CONFIG_HOME="/home/aaron/.config"
export HISTTIMEFORMAT="%d/%m/%y %T "

#export CLOUDSDK_PYTHON=/usr/bin/python2

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Loading nvm only when needed. It takes too much time to initialize during startup
#function nvm {
#source /usr/share/nvm/init-nvm.sh
#nvm "$@"
#}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# disabled 23/10/2019
#export SDKMAN_DIR="/home/aaron/.sdkman"
#[[ -s "/home/aaron/.sdkman/bin/sdkman-init.sh" ]] && source "/home/aaron/.sdkman/bin/sdkman-init.sh"

# alias cmus='screen -q -r -D cmus || screen -S cmus $(which cmus)'
#screen -q -r -D cmus || screen -S cmus $(which cmus)
#source /usr/bin/virtualenvwrapper.sh
#source /usr/bin/virtualenvwrapper.sh

#export HADOOP_MAPRED_HOME=$HADOOP_HOME
#export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#export HADOOP_COMMON_HOME=$HADOOP_HOME
#export HADOOP_HDFS_HOME=$HADOOP_HOME
#export YARN_HOME=$HADOOP_HOME
#export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
#export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
#export SQOOP_HOME=/usr/lib/sqoop
#export PATH=$PATH:$SQOOP_HOME/bin
#export FLUME_HOME=/usr/local/flume
#export PATH=$PATH:$FLUME_HOME/bin
#export CLASSPATH=$FLUME_HOME/lib/
#export KAFKA_HOME=/usr/local/kafka
#export PATH=$PATH:$KAFKA_HOME/bin
#export PIG_HOME=/usr/local/pig
#export PATH=$PATH:$PIG_HOME/bin
#export PIG_CLASSPATH=$HADOOP_HOME/etc/hadoop
#export SPARK_HOME=/usr/local/spark
#export SPARK_JARS_DIRS=$SPARK_HOME/jars
#export PATH=$PATH:$SPARK_HOME/bin
#export PATH=$PATH:$SPARK_JARS_DIRS
#export ZOOKEEPER_HOME=/usr/local/zookeeper
#export PATH=$PATH:$ZOOKEEPER_HOME/bin
#export HIVE_HOME=/usr/local/hive/apache-hive-3.1.2-bin
#export PATH=$PATH:$HIVE_HOME/bin
#export CLASSPATH=$CLASSPATH:/usr/local/hadoop/lib/*:.
#export CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/*:.
#export DERBY_HOME=/usr/local/derby
#export PATH=$PATH:$DERBY_HOME/bin
#export CLASSPATH=$CLASSPATH:$DERBY_HOME/lib/derby.jar:$DERBY_HOME/lib/derbytools.jar
#export HBASE_HOME=/usr/local/hbase
#export PATH=$PATH:$HBASE_HOME/bin
#export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/"
#export HCAT_HOME=$HIVE_HOME/hcatalog/
#export PATH=$PATH:$HCAT_HOME/bin
#export STORAGEEXPLORER=/usr/local/storageExplorer
#export PATH=$PATH:$STORAGEEXPLORER
#export CHROMIUM=/usr/bin/google-chrome-stable
#export PATH=$PATH:$CHROMIUM
export PATH=$PATH:$HOME/dotnet
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
# FZF stuff
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='bg+:#293739,bg:#1B1D1E,border:#808080,spinner:#E6DB74,hl:#7E8E91,fg:#F8F8F2,header:#7E8E91,info:#A6E22E,pointer:#A6E22E,marker:#F92672,fg+:#F8F8F2,prompt:#F92672,hl+:#F92672'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'f1:execute(less -f {}),ctrl-y:execute-silent(echo {} | xclip -selection -in)+abort'
--bind 'ctrl-e:execute(echo {} | xargs -o  nvim)+abort'
--bind 'ctrl-v:execute(code {+})+abort'
"

##--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
##--bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'

. /usr/share/fzf/key-bindings.bash
. /usr/share/fzf/completion.bash
. /usr/share/fzf/utility.bash
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules' --exclude '.npm' --exclude '.nuget' --exclude '.pyenv' --exclude '.electron-gyp' --exclude '.cache' --exclude '.vscode*'"
# export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

 #Update the list of processes by pressing CTRL-R
FZF_CTRL_R_COMMAND="'ps -ef' \
  fzf --bind 'ctrl-r:reload($FZF_DEFAULT_COMMAND)' \
      --header 'Press CTRL-R to reload' --header-lines=1 \
      --height=50% --layout=reverse"

# Fortune Cookie for fun
fortune


export PATH=$PATH:/home/aaron/bin
# echo "started az"
#source '/home/aaron/lib/azure-cli/az.completion'
# AWS autocomplete
# find /usr/local/bin -name "aws*"
# complete -C aws_completer aws

### Uncomment below lines to use powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh



# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
neofetch
alias fa='find -maxdepth 1 -type f -iregex ".*\.\(aac\|flac\|mp3\|ogg\|wav\)$" | sort > playlist'
eval "$(fasd --init auto)"
alias v='f -e nvim' # quick opening files with vim
alias m='f -e mplayer' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open
_fasd_bash_hook_cmd_complete v m j o

#export WALLPAPER="$(find ~/wallpapers/colorful/ -type f -print0 | shuf -z -n 1)" &> /dev/null
[[ -s /home/aaron/.autojump/etc/profile.d/autojump.sh ]] && source /home/aaron/.autojump/etc/profile.d/autojump.sh
#zsh
