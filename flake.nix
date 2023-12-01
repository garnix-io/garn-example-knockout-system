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
            "program" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
            then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"murphy"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"murphy"}";
      }} ${pkgs.writeTextFile {
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
      ''}");
          };
          "neovim/runAll" = {
            "type" = "app";
            "program" = "${let
        dev = pkgs.mkShell {};
        shell = "${pkgs.process-compose}/bin/process-compose up -f ${pkgs.writeText "process-compose.yml" (builtins.toJSON { "version" = "0.5"; "processes" = { "blue" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"blue"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"blue"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "darkblue" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"darkblue"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"darkblue"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "default" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"default"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"default"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "delek" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"delek"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"delek"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "desert" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"desert"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"desert"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "elflord" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"elflord"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"elflord"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "evening" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"evening"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"evening"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "habamax" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"habamax"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"habamax"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "industry" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"industry"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"industry"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "koehler" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"koehler"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"koehler"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "lunaperche" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"lunaperche"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"lunaperche"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "morning" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"morning"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"morning"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "murphy" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"murphy"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"murphy"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "pablo" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"pablo"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"pablo"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "peachpuff" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"peachpuff"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"peachpuff"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "quiet" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"quiet"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"quiet"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "ron" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"ron"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"ron"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "shine" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"shine"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"shine"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "slate" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"slate"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"slate"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "torte" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"torte"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"torte"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; "zellner" = { "command" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"zellner"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"zellner"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "environment" = []; }; }; })}";
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
        text = builtins.toJSON { "blue" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"blue"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"blue"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "darkblue" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"darkblue"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"darkblue"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "default" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"default"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"default"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "delek" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"delek"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"delek"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "desert" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"desert"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"desert"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "elflord" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"elflord"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"elflord"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "evening" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"evening"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"evening"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "habamax" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"habamax"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"habamax"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "industry" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"industry"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"industry"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "koehler" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"koehler"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"koehler"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "lunaperche" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"lunaperche"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"lunaperche"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "morning" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"morning"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"morning"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "murphy" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"murphy"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"murphy"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "pablo" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"pablo"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"pablo"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "peachpuff" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"peachpuff"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"peachpuff"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "quiet" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"quiet"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"quiet"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "ron" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"ron"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"ron"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "shine" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"shine"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"shine"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "slate" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"slate"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"slate"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "torte" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"torte"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"torte"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); "zellner" = builtins.toString (if system == "aarch64-linux" || system == "x86_64-linux"
          then "${let
        dev = (pkgs.mkShell {}).overrideAttrs (finalAttrs: previousAttrs: {
          nativeBuildInputs =
            previousAttrs.nativeBuildInputs
            ++
            [(pkgs.lxterminal)];
        });
        shell = "lxterminal --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"zellner"}";
      }} ${pkgs.writeTextFile {
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
        dev = pkgs.mkShell {};
        shell = "alacritty --command ${"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
        name = "vimrc";
        text = "colorscheme ${"zellner"}";
      }} ${pkgs.writeTextFile {
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
      ''}"); };
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
