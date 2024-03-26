EXCLUDES=-x install -x README -x Makefile -x provision.sh
update:
	rcup -v $(EXCLUDES) -d .
	# installs
	ln -sf $$HOME/.git_rb_sh $$HOME/git-rb
