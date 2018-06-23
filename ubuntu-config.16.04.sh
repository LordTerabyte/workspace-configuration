cd ~

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install zsh
sudo apt-get install git

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerlevel9k

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# dircolors

wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark

# configure ~/.zshrc

sed -i '/ZSH_THEME\=\"[^"]*\"/c\ZSH_THEME="powerlevel9k/powerlevel9k"' ~/.zshrc

read -r -d '' zshrc_append << DONE
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='▶ '
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''

export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval \`dircolors ~/dircolors.256dark\`
DONE

echo $zshrc_append >> ~/.zshrc

# java

sudo apt-get install default-jdk

# node.js via nvm

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
nvm install --lts
npm install -g npm

# python

sudo apt-get install python3-pip

# ruby

sudo apt-get install ruby-full
sudo gem update --system
sudo gem install bundler

# htop process manager

sudo apt-get install htop