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
          "neovim/single" = {
            "type" = "app";
            "program" =
              if (pkgs.lib.any (x: x == system) [ "aarch64-linux" "x86_64-linux" ])
              then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme murphy' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
              else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme murphy' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
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
          "neovim/runAll" = {
            "type" = "app";
            "program" = "${let
        dev = pkgs.mkShell {};
        shell = "${pkgs.process-compose}/bin/process-compose up -f ${pkgs.writeText "process-compose.yml" (builtins.toJSON { "version" = "0.5"; "processes" = { "blue" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme blue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme blue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "darkblue" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme darkblue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme darkblue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "default" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme default' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme default' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "delek" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme delek' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme delek' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "desert" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme desert' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme desert' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "elflord" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme elflord' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme elflord' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "evening" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme evening' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme evening' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "habamax" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme habamax' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme habamax' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "industry" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme industry' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme industry' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "koehler" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme koehler' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme koehler' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "lunaperche" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme lunaperche' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme lunaperche' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "morning" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme morning' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme morning' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "murphy" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme murphy' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme murphy' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "pablo" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme pablo' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme pablo' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "peachpuff" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme peachpuff' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme peachpuff' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "quiet" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme quiet' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme quiet' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "ron" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme ron' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme ron' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "shine" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme shine' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme shine' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "slate" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme slate' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme slate' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "torte" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme torte' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme torte' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "environment" = []; }; "zellner" = { "command" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme zellner' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme zellner' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
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
          "neovim/battle" = {
            "type" = "app";
            "program" = "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.deno)];
        });
        shell = "deno run --allow-read --allow-run ${./knockout-runner.ts} ${pkgs.writeTextFile {
        name = "executables-json";
        text = builtins.toJSON { "blue" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme blue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme blue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "darkblue" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme darkblue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme darkblue' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "default" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme default' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme default' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "delek" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme delek' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme delek' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "desert" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme desert' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme desert' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "elflord" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme elflord' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme elflord' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "evening" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme evening' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme evening' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "habamax" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme habamax' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme habamax' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "industry" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme industry' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme industry' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "koehler" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme koehler' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme koehler' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "lunaperche" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme lunaperche' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme lunaperche' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "morning" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme morning' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme morning' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "murphy" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme murphy' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme murphy' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "pablo" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme pablo' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme pablo' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "peachpuff" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme peachpuff' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme peachpuff' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "quiet" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme quiet' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme quiet' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "ron" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme ron' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme ron' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "shine" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme shine' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme shine' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "slate" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme slate' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme slate' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "torte" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme torte' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme torte' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; "zellner" = if (pkgs.lib.any (x : x == system) ["aarch64-linux" "x86_64-linux"])
      then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "exec lxterminal --no-remote --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme zellner' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"
      else "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.alacritty)];
        });
        shell = "exec alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${let dev = pkgs.mkShell {}; in
    pkgs.runCommand "garn-pkg" {
      buildInputs = dev.buildInputs ++ dev.nativeBuildInputs;
    } "${"mkdir -p \$out"}
${"
      ${""}
      ${""}
    "}
${"
        echo 'colorscheme zellner' > \$out/.vimrc
      "}
"}/.vimrc ${pkgs.writeTextFile {
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
  }}"}";
        buildPath = pkgs.runCommand "build-inputs-path" {
          inherit (dev) buildInputs nativeBuildInputs;
        } "echo $PATH > $out";
      in
      pkgs.writeScript "shell-env"  ''
        #!${pkgs.bash}/bin/bash
        export PATH=$(cat ${buildPath}):$PATH
        ${dev.shellHook}
        ${shell} "$@"
      ''}"; };
      }}";
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
