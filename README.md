# Welcome to my Fedora Silverblue / NixOs config

## My actual setup relies on two computers, a laptop and a desktop.

My laptop running [NixOs](https://nixos.wiki/); reproducibility, imutabilitty for ephemeral use. (Perfect for studying and making nix-shells for everything)

My Desktop running any [Fedora Silverblue](https://fedoraproject.org/atomic-desktops/silverblue/) distro ([Bluefin](https://projectbluefin.io/) actually), the only thing that this Desktop needs is:

* yubikey with **ALL** your keys.
* a Password database that unlocks with yubikey.
* a good [distros.ini](distros.ini) to work with the beatiful and incredible [Distrobox](https://distrobox.it/)

and im up and running. :)

### Feel free to contribute or take everything from here and making yours. Its public and i don`t care. 

## TODO

- [ ] justfile with 
  - [ ] chronjob setup for backup with veracrypt on a lukd device 
  - [ ] maybe something that installs distrobox and make distros.ini up and running in any distro.(maybe using nix for that).
- [X] distroboxes
  - [X] for managing secrects (has shit like ykman an keepass)
  - [X] Rust dev
  - [X] general(python) Dev

- [ ] NixOs laptop
  - [ ] Barrier
  - [ ] Ephemeral sessions (I log in with my yubi and keepass db, do what i need, the pc deletes everything right before i close the lid, maybe a better ssd would be nice.)
  - [ ] nix-shell for Rust dev
  - [ ] nix-shell for general(python) dev

