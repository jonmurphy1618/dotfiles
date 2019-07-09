#!/bin/bash
# credit and reference: https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/install-packages.sh

log_file=./install_progress_log.txt

sudo apt-get update

# programs
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

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
if type -p docker > /dev/null; then
  echo "docker install SUCCEEDED" >> $log_file
else
  echo "docker install FAILED" >> $log_file
fi

# print log summary
echo -e "\n========== install-packages.sh log summary ==========\n"
cat $log_file
echo
rm $log_file
