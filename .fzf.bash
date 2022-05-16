# Setup fzf
# ---------
if [[ ! "$PATH" == */home/li/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/li/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/li/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/li/.fzf/shell/key-bindings.bash"
