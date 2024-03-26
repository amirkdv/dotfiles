EXCLUDES=-x install -x README -x Makefile -x provision.sh
update:
	rcup -v $(EXCLUDES)
