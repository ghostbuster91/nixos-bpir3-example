# NixOS on BPi-R3 Example

This is an example of booting NixOS on a BPi-R3.

Build an SD-Image with:

```
$ nix build -L '.#nixosConfigurations.bpir3.config.system.build.sdImage'
```


generate age key from ssh using:
```sh
$ nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"

```

obtain public key:
```sh
$ nix-shell -p ssh-to-age --run 'cat ~/.ssh/id_ed25519.pub | ssh-to-age'
```
