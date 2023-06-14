({ lib, pkgs, ... }: {
  system.stateVersion = lib.mkDefault "22.11";
  networking.hostName = "bpir3";

  networking.useDHCP = false;
  networking.bridges = {
    br0 = {
      interfaces = [ "wan" "lan0" "lan1" "lan2" "lan3" ];
    };
  };
  networking.interfaces.br0.useDHCP = true;

  services.openssh.enable = true;
  # For initial setup
  users.users.root.password = "bananapi";
  services.openssh.settings.PermitRootLogin = "yes";

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # enable flakes globally
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git # used by nix flakes
    wget
    curl

    neofetch
    nnn # terminal file manager
    btop # replacement of htop/nmon
    htop
    iotop
    iftop
    nmon

    # system call monitoring
    strace
    ltrace # library call monitoring
    lsof

    mtr # A network diagnostic tool
    iperf3 # A tool for measuring TCP and UDP bandwidth performance
    nmap # A utility for network discovery and security auditing
    ldns # replacement of dig, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    tcpdump # A powerful command-line packet analyzer

    # system tools
    sysstat
    lm_sensors # for `sensors` command

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    viu # terminal image viewer
    file
    which
    tree
    gnused
    gnutar
    gawk
  ];

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
})