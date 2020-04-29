#!/bin/bash
# setup script for new dev enviroment setup

log_file=./log_setup_script.log

function main(){
  echo "Show verbose log?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) break;;
      No ) break;;
    esac
  done

  echo "Did you copy ~/.ssh/config and ~/.ssh/id_keys?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) break;;
      No ) break;;
    esac
  done

  echo "Do you want to install all custom packages?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) install_packages; break;;
      No ) break;;
    esac
  done

  echo "Do you want to setup dotfile symlink?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) dotfiles_symlink; break;;
      No ) break;;
    esac
  done

  echo "Do you want to install docker?"
  select yn in "Yes" "No"; do
    case $yn in
      Yes ) install_docker; break;;
      No ) break;;
    esac
  done
}

function install_packages(){
# credit and reference: https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/install-packages.sh

  sudo apt-get update

  sudo apt-get -y install vim
  if type -p vim > /dev/null; then
    echo "vim install SUCCEEDED" >> $log_file
  else
    echo "vim install FAILED" >> $log_file
  fi

  sudo apt-get -y install tmux
  if type -p tmux > /dev/null; then
    echo "tmux install SUCCEEDED" >> $log_file
  else
    echo "tmux install FAILED" >> $log_file
  fi

  sudo apt-get -y install git
  if type -p git > /dev/null; then
    echo "git install SUCCEEDED" >> $log_file
  else
    echo "git install FAILED" >> $log_file
  fi
}

function dotfiles_symlink(){
  ln -svf ~/dotfiles/.vimrc ~ >> $log_file
  ln -svf ~/dotfiles/.gitignore_global ~ >> $log_file
  ln -svf ~/dotfiles/.bash_profile ~ >> $log_file
  ln -svf ~/dotfiles/.gitconfig ~ >> $log_file
  ln -svf ~/dotfiles/.tmux.conf ~ >> $log_file
}

function verbose_log(){
  echo -e "\n======== setup script log summary ========\n"
  cat $log_file
  echo
}

function install_docker(){
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh
  rm get-docker.sh
  if type -p docker > /dev/null; then
    echo "docker install SUCCEEDED" >> $log_file
  else
    echo "docker install FAILED" >> $log_file
  fi
}


main
