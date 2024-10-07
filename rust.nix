{ pkgs ? import <nixpkgs> {} }:

let
  overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
  libPath = with pkgs; lib.makeLibraryPath [
    # Load external libraries that you need in your Rust project here
  ];
in
  pkgs.mkShell rec {
    buildInputs = with pkgs; [
      clang
      llvmPackages.latest.bintools
      rustup
    ];

    RUSTC_VERSION = overrides.toolchain.channel;

    # Bindgen configuration
    LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages.latest.libclang.lib ];

    shellHook = ''
      export PATH=$PATH:${CARGO_HOME:-~/.cargo}/bin
      export PATH=$PATH:${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
    '';

    # Precompiled library path
    RUSTFLAGS = builtins.map (a: ''-L ${a}/lib'') [
      # Add libraries here (e.g. pkgs.libvmi)
    ];

    LD_LIBRARY_PATH = libPath;

    # Bindgen extra clang args
    BINDGEN_EXTRA_CLANG_ARGS =
      (builtins.map (a: ''-I"${a}/include"'') [
        # Add dev libraries here (e.g. pkgs.libvmi.dev)
        pkgs.glibc.dev
      ])
      ++ [
        ''-I"${pkgs.llvmPackages.latest.libclang.lib}/lib/clang/${pkgs.llvmPackages.latest.libclang.version}/include"''
        ''-I"${pkgs.glib.dev}/include/glib-2.0"''
        ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
      ];
  }
