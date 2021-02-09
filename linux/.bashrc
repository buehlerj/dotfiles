env=~/.ssh/agent.env

alias ls='ls --color'
alias ll='ls -lah'
alias notepad++='start notepad++'
alias npp='start notepad++'
alias n++='start notepad++'
alias untar='tar -xvf'
alias rspec='rspec --color'
alias path='echo $PATH | tr ":" "\n"'
alias vu='vagrant up'
alias vssh='vagrant ssh'
alias vup='vagrant up pro'
alias vsshp='vagrant ssh pro'
alias vs='vagrant status'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias hostfile='edit_hostfile'
alias gi='grep -i'
alias gmmd="git pull; git branch --merged master | egrep -v \"(^\*|master|dev)\" | xargs git branch --delete; git remote prune origin"
alias gmmp="git pull; git branch --merged master | egrep -v \"(^\*|master|dev)\""
alias rmnpmi="rm -rf node_modules; npm i"

alias locngs="npm run-script ng serve"

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add ~/.ssh/id_rsa
elif ! agent_has_keys; then
    ssh-add ~/.ssh/id_rsa
fi

unset env


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
