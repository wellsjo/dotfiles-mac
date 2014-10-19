# Setup all aliases here

# Spotify dev aliases
alias d="cd ~/src/web-site/ && ./devify.sh --skip-language --auto"
alias c="console cache:clear"

# Custom ssh shortcuts
alias wells="ssh -i ~/Google\ Drive/Important\ Documents\ And\ Pictures/Amazon\ Web\ Services/wells_2.pem ec2-user@54.83.193.197"
alias ppl="ssh -i ~/Google\ Drive/Important\ Documents\ And\ Pictures/Amazon\ Web\ Services/wells_2.pem ec2-user@54.83.27.53"
alias vm="ssh -tA www.bananajams.cloud.spotify.net 'cd src/web-site && tmux -2 attach; bash -l'"
alias jump="ssh -A jump1.lon.spotify.net"

# General bash aliases
alias ..="cd .."
[ "$(uname -s)" = "Linux" ] && alias ls='ls --color'
alias ll='ls -la'
alias l='ls -la'
