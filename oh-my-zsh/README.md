## What we will do
* Install and configure ZSH
* Install and configure Oh-my-zsh framework
* Change default theme
* Enable oh-my-zsh plugins

## Step 1 - Install and configure ZSH
To install zsh from the repository, use the following commands.

```shell
# On Linux
apt install zsh

# On Mac
brew install zsh
```

Check the current shell used with the command below.
```shell
echo $SHELL
```

## Step 2 - Install and configure Oh-my-zsh
Pre-reqs
```shell
# On Linux
apt install wget git

# On Mac
brew install wget git

# Then (both Linux + Unix)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
So, oh-my-zsh is installed in the home directory '~/.oh-my-zsh'.


Next, we need to create a new configuration for zsh. As with the Bash shell, which has a configuration named '.bashrc', for zsh, we need a '.zshrc' configuration file. It's available in the oh-my-zsh templates directory.

Copy the template .zshrc.zsh-template configuration file to the home directory .zshrc and apply the configuration by running the source command, as shown below.

```shell
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc
```

## Step 3 - Change default themes
The Oh-my-zsh framework provides many themes for your zsh shell, head to the link below to take a look at the available options.

[https://github.com/robbyrussell/oh-my-zsh/wiki/Themes](https://github.com/robbyrussell/oh-my-zsh/wiki/Themes)

Alternatively, you can go to the 'themes' directory and see the list of available themes.

```shell
cd ~/.oh-my-zsh/themes/
ls -a
```

In order to change the default theme, we need to edit the .zshrc configuration file. Edit the configuration with the nano editor.
```shell
ZSH_THEME='powerlevel10k/powerlevel10k'
```

## Step 4 - Enable Oh-my-zsh plugins

Edit .zshrc configuration file.
```shell
plugins=(git git-extras docker zsh-autosuggestions z)
```
