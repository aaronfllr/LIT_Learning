{ pkgs, lib, config, inputs, ... }:

let
  # Configure which Android tools we'll need (mostly the recommended ones)
  sdk = (import inputs.android-nixpkgs { }).sdk (sdkPkgs:
    with sdkPkgs; [
      build-tools-30-0-3
      build-tools-33-0-0
      cmdline-tools-latest
      emulator
      patcher-v4
      platform-tools
      platforms-android-33
      system-images-android-32-google-apis-x86-64
    ]);
in
{
  # https://devenv.sh/basics/
  env.GREET = "Aaron, happy coding!!";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    postgresql_16
    android-studio
    watchman
  ];

  env = {
    PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
    PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
    PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
    ANDROID_HOME = "/home/aaron/Android/Sdk";
    ANDROID_SDK_ROOT = "${pkgs.android-tools}/bin";
  };


  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo Hey $GREET";
  
  scripts = {
    prisma.exec = "npx prisma $@";
  };

  enterShell = ''
    hello
    git --version
    export PATH="${sdk}/bin:$PATH"
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep "2.42.0"
  '';
  
  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/languages/
  # languages.nix.enable = true;
  languages.javascript.enable = true;
  languages.javascript.npm.enable = true;
  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
