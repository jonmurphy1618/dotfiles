#!/bin/bash
# setup script for new dev enviroment setup

echo "Did you copy ~/.ssh/config and ~/.ssh/id_keys?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) break;;
    esac

echo "Do you want to install all custom packages?"
select yn in "Yes" "No"; do
	case $yn in
    	Yes ) break;;
        No ) break;;
    esac

echo "Do you want to setup dotfile symlink?"
select yn in "Yes" "No"; do
	case $yn in
    	Yes ) break;;
        No ) break;;
    esac

echo "Do you want to install docker?"
select yn in "Yes" "No"; do
	case $yn in
    	Yes ) break;;
        No ) break;;
    esac

done