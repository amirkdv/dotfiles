EXCLUDES=-x install -x README -x Makefile -x provision.sh
update:
	rcup -v $(EXCLUDES)
	# installs
	ln -sf $$HOME/.git_rb_sh $$HOME/git-rb
