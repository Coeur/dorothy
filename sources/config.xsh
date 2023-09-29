#!/usr/bin/env xonsh

from os import path

# for scripts and sources to load a configuration file
# load_dorothy_config ...<filename>
def load_dorothy_config(*args):
	dorothy_config_loaded = 'no'

	# for each filename, load a single config file
	for filename in args:
		if path.exists($DOROTHY + '/user/config.local/' + filename):
			# load user/config.local/*
			execx(compilex(open($DOROTHY + '/user/config.local/' + filename).read()))
			dorothy_config_loaded = 'yes'
		elif path.exists($DOROTHY + '/user/config/' + filename):
			# otherwise load user/config/*
			execx(compilex(open($DOROTHY + '/user/config/' + filename).read()))
			dorothy_config_loaded = 'yes'
		elif path.exists($DOROTHY + '/config/' + filename):
			# otherwise load default configuration
			execx(compilex(open($DOROTHY + '/config/' + filename).read()))
			dorothy_config_loaded = 'yes'
		# otherwise try next filename

	# if nothing was loaded, then fail
	if dorothy_config_loaded == 'no':
		echo-style --error=@('Missing the configuration file: ' + args.join(' ')) >/dev/stderr
		return 2  # No such file or directory
