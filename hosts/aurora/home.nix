# nixOS home-manager config
{ config, pkgs, ... }:

{
  home.username = "ghil";
  home.homeDirectory = "/home/ghil";
  home.stateVersion = "24.11"; # do not change please.
 
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Apps
    atuin
    bottom
    cava
    cliphist
    discord
    dmenu
    dunst
    element-desktop
    gh
    gnome-tweaks
    ncspot
    obsidian
    ranger
    slack
    tana
    telegram-desktop
    vscode-with-extensions
    waybar
    zed-editor
    
    # Gnome Extensions
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.gsconnect


 ];

  home.file = {

  };

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
    };
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      boot-garbage = "sudo /run/current-system/bin/switch-to-configuration boot";
      collect-garbage = "nix-collect-garbage -d";
      dots ="cd ~/.dotfiles/";
      flup = "nix flake update";
      ga = "git add *";
      gc = "git commit --verbose";
      gp = "git push";
      ll = "ls -l";
      v = "nvim";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles/#default";
    };
};

}
