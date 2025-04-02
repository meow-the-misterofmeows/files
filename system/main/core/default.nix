{lib, ...}:
# default configuration shared by all hosts
{
  imports = [
    ./users.nix
    ../nix
  ];

  documentation.dev.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    # saves space
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
      "ro_RO.UTF-8/UTF-8"
    ];
  };

  # don't touch this
  system.stateVersion = lib.mkDefault "25.05";

  time.timeZone = lib.mkDefault "Asia/Makassar";
}