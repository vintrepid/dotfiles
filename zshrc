export PATH="./.bin:/Users/vince/.bin:$PATH"

eval "$(rbenv init -)"

cd ~/dev/wt/toco

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="vintrepid"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# so you can pass parameters to rake tasks
alias rake="noglob rake"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

# icu4c reqd for gitorious dolt
# export LDFLAGS=-L/usr/local/opt/icu4c/lib
# export CPPFLAGS=-I/usr/local/opt/icu4c/include

# from ~/.profile
export EDITOR='subl -w'
# DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.5.15/lib:$DYLD_LIBRARY_PATH
export ARCHFLAGS='-arch x86_64'

source cdargs-bash.sh
alias pf="open -a 'Path Finder' ."

# source ~/bin/git-completion.bash
#alias git=hub

alias bi="bundle install --path vendor/bundle --binstubs=.bin"

alias ru="ruby"
alias ra="rake"
alias rs="rspec"
alias ca="cap"
alias cu="cucumber"

alias pr="pry -r ./config/environment"

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit




# export STRIPE_API_KEY="sk_test_4Tbtp88P1QmLEcufkxsoEnGP"
# export STRIPE_PUBLISHABLE_KEY="pk_test_4TbtJ3uLTIfYEJlLoOTeDvBj"



function kill_merb {
  ps aux | grep merb | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Safer curl | sh'ing
function curlsh {
    file=$(mktemp -t curlsh) || { echo "Failed creating file"; return; }
    curl -s "$1" > $file || { echo "Failed to curl file"; return; }
    $EDITOR $file || { echo "Editor quit with error code"; return; }
    sh $file;
    rm $file;
}
