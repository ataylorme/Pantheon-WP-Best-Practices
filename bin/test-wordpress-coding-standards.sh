#!/bin/bash

# Add WordPress coding standards path to code sniffer
phpcs --config-set installed_paths $HOME/.composer/vendor/wp-coding-standards/wpcs

# Don't exit on warnings
phpcs --config-set ignore_warnings_on_exit 1

# Change to project directory
cd $HOME/$CIRCLE_PROJECT_REPONAME

# Sniff all PHP files
phpcs --standard=phpcs.ruleset.xml $(find . -name '*.php')

# Change directories back to wherever we were before
cd -