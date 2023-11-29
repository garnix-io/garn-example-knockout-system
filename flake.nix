{
  inputs.nixpkgs-repo.url = "github:NixOS/nixpkgs/6fc7203e423bbf1c8f84cccf1c4818d097612566";
  outputs = { self, nixpkgs-repo }:
    let
      nixpkgs = nixpkgs-repo;
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import "${nixpkgs}" {
            config.allowUnfree = true;
            inherit system;
          };
        in
        { }
      );
      checks = forAllSystems (system:
        let
          pkgs = import "${nixpkgs}" {
            config.allowUnfree = true;
            inherit system;
          };
        in
        { }
      );
      devShells = forAllSystems (system:
        let
          pkgs = import "${nixpkgs}" {
            config.allowUnfree = true;
            inherit system;
          };
        in
        { }
      );
      apps = forAllSystems (system:
        let
          pkgs = import "${nixpkgs}" {
            config.allowUnfree = true;
            inherit system;
          };
        in
        {
          "all" = {
            "type" = "app";
            "program" = "${let
        dev = pkgs.mkShell {};
        shell = "${pkgs.process-compose}/bin/process-compose up -f ${pkgs.writeText "process-compose.yml" (builtins.toJSON { "version" = "0.5"; "processes" = { "Abyss" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Abyss\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Default Dark+" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Default Dark+\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Default High Contrast" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Default High Contrast\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Default High Contrast Light" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Default High Contrast Light\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Default Light+" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Default Light+\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Default Light Modern" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Default Light Modern\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Kimbie Dark" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Kimbie Dark\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Monokai" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Monokai\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Monokai Dimmed" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Monokai Dimmed\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Quiet Light" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Quiet Light\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Red" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Red\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Solarized Dark" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Solarized Dark\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Solarized Light" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Solarized Light\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Tomorrow Night Blue" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Tomorrow Night Blue\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Visual Studio Dark" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Visual Studio Dark\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "Visual Studio Light" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    set -euo pipefail

    TEMP_DIR=\$(mktemp -d --suffix vscodium)

    # copy the vscodium config
    cp -r ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
    USER_CONFIG=.config/VSCodium/User
    if test \$(uname) = \"Darwin\" ; then
      USER_CONFIG=\"Library/Application Support/VSCodium/User\"
    fi
    mkdir -p \"\$out/\$USER_CONFIG/User\"
    cp ${pkgs.writeTextFile {
    name = "${"vscodium-config"}";
    text = "${"{
  \"update.mode\": \"none\",
  \"window.menuBarVisibility\": \"hidden\",
  \"workbench.colorTheme\": \"Visual Studio Light\"
}"}";
  }} \"\$out/\$USER_CONFIG/settings.json\"
  "}
"}/. \$TEMP_DIR
    chmod -R u+rwX \$TEMP_DIR

    echo \$TEMP_DIR

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    ${(pkgs.vscode-with-extensions.override
    {
      vscode = pkgs.vscodium;
      vscodeExtensions = [
      ];
    }
  )}/bin/codium --new-window --disable-workspace-trust ${"${pkgs.writeTextFile {
    name = "${"example.ts"}";
    text = "${"function fac(x: number): number {
  if (x === 0) {
    return 1;
  } else if (x < 0) {
    throw new Error(\"fac called with a negative number\");
  } else {
    return x * fac(x - 1);
  }
}

console.log(fac(6));"}";
  }}"} --wait

    rm -rf \$TEMP_DIR
  ";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; }; })}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}";
          };
        }
      );
    };
}
