Instructions:
````bash
git clone http://github.com/amirkdv/dotfiles.git
dotfiles/install dotfiles pubkey locale
````
The `install` script will install the dotfiles for the user who runs the script.
If `rcm` is not already installed root privileges are required and `wget` is
assumed to be installed. To install ``locale`` too, root privileges are
required.
To merely install my public key:
```bash
sh <(wget -qO- https://raw.githubusercontent.com/amirkdv/dotfiles/master/install) pubkey
```
