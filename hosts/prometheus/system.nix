{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    acpi
  ];

  # we enable and modify tpm2 *per host* because not all devices I own
  # actually support tmp2, i.e my Pi 400 will error out if tmp2 is enabled anyhow
  security.tpm2 = {
    # enable Trusted Platform Module 2 support
    enable = lib.mkDefault true;
    # enable Trusted Platform 2 userspace resource manager daemon
    abrmd.enable = lib.mkDefault true;
    # set TCTI environment variables to the specified values if enabled
    # - TPM2TOOLS_TCTI
    # - TPM2_PKCS11_TCTI
    tctiEnvironment.enable = lib.mkDefault true;
    # enable TPM2 PKCS#11 tool and shared library in system path
    pkcs11.enable = lib.mkDefault true;
  };

  # filesystem options that are *generally* specific to hosts
  # TODO: this might be mixed into the common "btrfs" module in the future
  # might want to finalize my preferred btrfs schema before I do that
  fileSystems = {
    "/".options = ["compress=zstd" "noatime"];
    "/home".options = ["compress=zstd"];
    "/nix".options = ["compress=zstd" "noatime"];
  };

  hardware = {
    # allow usage of potentially proprietary firmware b lobs
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    # my GPU is not properly supported by open source drivers
    nvidia.open = lib.mkForce false;
  };

  boot = {
    # FIXME xanmod causes regular kernel to become unable to be built
    # latest xanmod Linux kernel for speed and android
    # boot.kernelPackages = with pkgs; linuxPackages_xanmod_latest;

    kernelParams = [
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
      "nohibernate"
    ];
  };
}
