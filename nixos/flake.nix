{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, hyprland, ... }: {
    nixosConfigurations.nyaaxOwOs = nixpkgs.lib.nixosSystem {
      # ...
      system = "x86_64-linux";
      modules = [
        hyprland.nixosModules.default
        {
          programs.hyprland.enable = true;
          programs.hyprland.nvidiaPatches = true;
        }
        ./configuration.nix
      ];
    };
  };
}
