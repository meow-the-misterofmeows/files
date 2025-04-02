{
  inputs,
  pkgs,
  lib,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
        configurationLimit = 10;
        editor = false;
      };
      timeout = 3;
      efi = {
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "snd_hda_intel.dmic_detect=0"
      "acpi_osi=linux"
      "nowatchdog"
    ];
    initrd.availableKernelModules = [
      "xhci_pci"
      "ahci"
      "usbhid"
      "sd_mod"
      "dm_mod"
      "dm_crypt"
      "cryptd"
      "input_leds"
    ];
  };

  services.xserver.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  networking = {
    hostName = "andromeda";
    networkmanager.enable = true;
  };

  system.stateVersion = lib.mkDefault "25.05";
}
