{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "fil";
  home.homeDirectory = "/home/fil";
  home.stateVersion = "26.05";
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.posy-cursors;
    name = "Posy_Cursor_Mono_Black";
    size = 24;
  };
  #imports
  imports = [
    ./modules/terminal.nix
    ./modules/niri.nix
    ./modules/file-manager.nix
    ./modules/git.nix
    ./modules/services.nix
    ./modules/noctalia.nix
    ./modules/zen.nix
  ];

  #packages
  home.packages = with pkgs; [
    #useful stuff
    wev
    qimgv
    brightnessctl
    playerctl
    usbutils
    unzip
    libreoffice-stable
    gparted
    udisks2
    feishin
    qbittorrent
    gale
    protontricks
    obs-studio
    nwg-look
    qt6Packages.qt6ct
    whitesur-icon-theme
    kdePackages.qtstyleplugin-kvantum
    #nix lang
    nixd
    alejandra
    inputs.uwu-colors.packages.${pkgs.stdenv.hostPlatform.system}.default
    #c
    clang-tools
    gnumake
    clang
    lldb
    #python
    python314
    python314Packages.virtualenv
    python314Packages.pip
    python314Packages.numpy
    python314Packages.onnx
    python314Packages.onnxruntime
    python314Packages.pillow
    jq
    #rust
    rust-analyzer
    rustc
    rustfmt
    #quickshell stuff
    qt6.qtdeclarative
    #messanger
    mumble
    element-desktop
    #wine
    winetricks
    wine
    #small stuff
    lsd
    bat
    ripgrep
    fd
    btop
    dysk
  ];
}
