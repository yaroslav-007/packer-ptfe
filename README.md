# Packer project that builds Virtualbox box for TFE installation

This is project builds Ubuntu 18.4 VirtualBox box that is suitable for TFE and upload it to Vagrant Cloud.


## Pre-requirements

**Install Packer:**
Download and install accordingly to your OS as described here:

https://www.packer.io/downloads.html

**Install rbenv:**


On Linux:
> Note:
> On Graphical environments, when you open a shell, sometimes `~/.bash_profile` doesn't get loaded
> You may need to `source ~/.bash_profile` manually or use `~/.bashrc`

```
apt update
apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```
On MacOS:
```
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
rbenv init
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
```

On Windows:
Install accordingly to https://rubyinstaller.org/

## Add you Vagrant Cloud
 - If you don't have account in Vagrant Cloud create here: https://app.vagrantup.com/account/new

 - Register a box in Vagrant Cloud

 - Replace `<username>/<box>` in `.kitchen.yml` and `template.json` with your username a box name you have created.

## How to run the code


 OS system | Operation
 ------------ | -------------
| Windows | Start menu -> Run and type cmd |
| Linux  |Start terminal |
| macOS | Press Command - spacebar to launch Spotlight and type "Terminal," then double-click the search result. |

## Clone the code locally:

    git clone https://github.com/yaroslav-007/packer-ptfe.git
    cd packer-ptfe
    packer build template.json



## Kitchen test
### Pre-requirements
```
rbenv install 2.5.1
rbenv local 2.5.1
rbenv versions
gem install bundler
bundle install
```

  

### Build

```
make
```

### Test
```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```