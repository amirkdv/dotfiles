1. Install rcm: https://github.com/thoughtbot/rcm

```bash
# ubuntu
$ apt install rcm

# macOS
$ brew install rcm
```

2. Clone dotfiles
```bash
$ cd ~
# NOTE: clone destination is important
$ git clone http://github.com/amirkdv/dotfiles.git .dotfiles
````

3. List dotfiles

```bash
$ lsrc
```

This is effectively the dry-run of `rcup` command below.


4. Update dotfiles

```bash
$ rcup -v
```

By default this symlinks `~/.foo` to `~/.dotfiles/foo` (note the missing period) and
interactively prompts to handle conflicts. See `man rcup` for options.

See `make update` for a better experience.
