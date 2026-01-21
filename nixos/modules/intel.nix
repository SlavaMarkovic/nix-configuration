{ pkgs, ... }:

{
  # Настройка графического ускорения (VA-API)
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      # Драйвер i965 специально для старых процессоров Intel (Bay Trail)
      (intel-vaapi-driver.override { enableHybridCodec = true; })
      libvdpau-va-gl
    ];
  };

  # Принудительно указываем системе использовать драйвер i965
  environment.sessionVariables = { 
    LIBVA_DRIVER_NAME = "i965"; 
  };
}
