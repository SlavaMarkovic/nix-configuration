{ config, pkgs, ... }:

{
    # Enable the KDE Plasma & SDDM.
   services = {
     desktopManager.plasma6.enable = true;

     displayManager.sddm.enable = true;

     displayManager.sddm.wayland.enable = true;
   };

   environment.systemPackages = with pkgs; [
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.sddm-kcm
    kdePackages.plasma-browser-integration
  ];
}