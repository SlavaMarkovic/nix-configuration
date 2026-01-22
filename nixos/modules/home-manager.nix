{ inputs, user, ... }: { # Получаем переменную 'user' из specialArgs
  imports = [
     # Подключаем модуль HM к системе
     inputs.home-manager.nixosModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    # ВАЖНО: Передаем inputs и user внутрь home-manager, чтобы они были доступны в home.nix
    extraSpecialArgs = { inherit inputs user; };

    # ВАЖНО: Явно указываем конфигурацию пользователя
    users.${user} = import ../../home-manager/home.nix;
  };
}
