#export http_proxy=http://web-proxy.fc.hp.com:8080
#export https_proxy=http://web-proxy.fc.hp.com:8080

cd ~/workspace/IdeaFactoryWebsite-Vagrant/

git pull

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
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env