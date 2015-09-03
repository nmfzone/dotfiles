# Path to your oh-my-zsh installation.
export ZSH=/home/nmfcomp/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



#################### NginX Server SettingUp Aliases ####################
laravelnewserver()
{
	if [[ -z $1 ]] ; then
		echo "Masukan Nama File!"
	else
		sudo cp /etc/nginx/sites-available/laravel-default /etc/nginx/sites-available/$1.nmflocal
		sudo ln -s /etc/nginx/sites-available/$1.nmflocal /etc/nginx/sites-enabled/$1.nmflocal
		sudo sed -i 's|the_folder|'"$2"'|g' /etc/nginx/sites-available/$1.nmflocal
		sudo sed -i 's/the_server/'"$1"'/g' /etc/nginx/sites-enabled/$1.nmflocal
		sudo echo '127.0.0.1   '"$1"'.nmflocal.io' | sudo tee --append /etc/hosts > /dev/null
	fi
}
alias newlaravelserv=laravelnewserver
phpnewserver()
{
	if [[ -z $1 ]] ; then
		echo "Masukan Nama Server!"
	elif [[ -z $2 ]] ; then
		echo "Masukan Lokasi Projectnya! (/var/www/the_folder/public)"
	else
		sudo cp /etc/nginx/sites-available/php-default /etc/nginx/sites-available/$1.nmflocal
		sudo ln -s /etc/nginx/sites-available/$1.nmflocal /etc/nginx/sites-enabled/$1.nmflocal
		sudo sed -i 's|the_folder|'"$2"'|g' /etc/nginx/sites-available/$1.nmflocal
		sudo sed -i 's/the_server/'"$1"'/g' /etc/nginx/sites-available/$1.nmflocal
		sudo echo '127.0.0.1   '"$1"'.nmflocal.io' | sudo tee --append /etc/hosts > /dev/null
	fi
}
alias newphpserv=phpnewserver
edittheserver()
{
	if [[ -z $1 ]] ; then
		echo "Masukan Nama Server!"
	else
		sudo subl /etc/nginx/sites-available/$1.nmflocal
	fi
}
alias editserv=edittheserver
removetheserver()
{
	if [[ -z $1 ]] ; then
		echo "Masukan Nama Server!"
	else
		sudo rm /etc/nginx/sites-available/$1.nmflocal
		sudo rm /etc/nginx/sites-enabled/$1.nmflocal
		sudo sed -i '/127.0.0.1   '"$1"'.nmflocal.io/d' /etc/hosts > /dev/null
	fi
}
alias rmserv=removetheserver
alias listserv="ls /etc/nginx/sites-available/"
symlinkstheserver()
{
	sudo ln -sf ~/Programming/PHP/MyServer/* /var/www
	sudo chmod -R 755 /var/www
	sudo chown -R $USER:$USER /var/www
}
alias symtheserv=symlinkstheserver
#refreshMyServerSymlinks()
#{
#	sudo
#}
#alias rvddfg=refreshMyServerSymlinks


#################### Directory Change Aliases ####################
alias gotopro="cd ~/Programming"
alias gotoandro="cd ~/Programming/Android/AndroidStudioProjects"
alias gotocpp="cd ~/Programming/C++"
alias thejudge="cd ~/Programming/CONTEST"
alias gotoGO="cd ~/Programming/GO"
alias gotogit="cd ~/Programming/Github"
alias gotojava="cd ~/Programming/Java"
alias gotojs="cd ~/Programming/Javascript"
alias gotoangular="cd ~/Programming/Javascript/AngularJS"
alias gotonode="cd ~/Programming/Javascript/NodeJS"
alias gotosio="cd ~/Programming/Javascript/Socket.io"
alias gotophp="cd ~/Programming/PHP/MyServer"
alias gotowww="cd /var/www"
alias gotopas="cd ~/Programming/Pascal"
alias gotopy="cd ~/Programming/Python"
alias gotoror="cd ~/Programming/RubyOnRails"


#################### Developer Aliases ####################
### Laravel
alias art="php artisan"

### NodeJS
alias npm="sudo npm"

### Ruby on Rails
#alias gem="sudo gem"

### Python
alias python="python3"
#alias python="python2"


#################### Developer Config ####################
### GitHub
export SSH_KEY_PATH="~/.ssh/id_rsa.pub" # Github ssh


### NodeJs
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export NVM_DIR="/home/nmfcomp/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


### Ruby on Rails
export PATH="$HOME/.rbenv/bin:$PATH" # Using Ruby rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"


### Android Studio
export PATH="$HOME/Programming/Android/AndroidSDK/sdk/platform-tools:$PATH"
export PATH="$HOME/Programming/Android/AndroidSDK/sdk/tools:$PATH"


## GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Programming/GO/Work
export PATH=$PATH:$GOROOT/bin


#################### Another Complex Function ####################

createNewGithubRepository() {
	repo_name=$1
	repo_desc=$2

	dir_name=`basename $(pwd)`

	if [ "$repo_name" = "" ]; then
		echo "Nama Repository (Enter untuk pakai '$dir_name')?"
		read repo_name
	fi

	if [ "$repo_name" = "" ]; then
		repo_name=$dir_name
	fi

	if [ "$repo_desc" = "" ]; then
		repo_desc="Github Repository by me"
	fi

	username=`git config user.name`
	if [ "$username" = "" ]; then
		echo "Could not find username, run 'git config --global user.name <username>'"
		invalid_credentials=1
	fi

	token=`git config user.token`
	if [ "$token" = "" ]; then
		echo "Could not find token, run 'git config --global user.token <token>'"
		invalid_credentials=1
	fi

	if [ "$invalid_credentials" == "1" ]; then
		return 1
	fi

	if [ ! -f .gitignore ]; then
		cp ~/Programming/Github/Defaults/.gitignore .gitignore
	fi
	if [ ! -f README.md ]; then
		cp ~/Programming/Github/Defaults/README.md README.md
		echo "$repo_name is $repo_desc" >> README.md > /dev/null 2>&1
	fi

	echo -n "Creating Github repository '$repo_name' ..."
	curl -u "$username:$token" https://api.github.com/user/repos -d '{"name":"'$repo_name'", "description":"'$repo_desc'"}' > /dev/null 2>&1
	echo " done."

	echo -n "Pushing local code to remote ..."
	git init > /dev/null 2>&1
	git add . > /dev/null 2>&1
	git commit -m "First commit" > /dev/null 2>&1
	git remote add origin git@github.com:$username/$repo_name.git > /dev/null 2>&1
	git push -u origin master > /dev/null 2>&1
	echo " done."
}
alias newrepo="createNewGithubRepository"


#################### De el el ####################

alias androidku="emulator -avd Try"
alias usemodem="ping -t 200 www.google.co.id"
alias usemodem2="ping -t 200 www.facebook.com"














source $ZSH/oh-my-zsh.sh