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
          "neovimBattle" = {
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
        text = builtins.toJSON { "blue" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "darkblue" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "default" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "delek" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "desert" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "elflord" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "evening" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "habamax" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "industry" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "koehler" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "lunaperche" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "morning" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "murphy" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "pablo" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "peachpuff" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "quiet" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "ron" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "shine" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "slate" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "torte" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "zellner" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
          "neovimRunAll" = {
            "type" = "app";
            "program" = "${let
        dev = pkgs.mkShell {};
        shell = "${pkgs.process-compose}/bin/process-compose up -f ${pkgs.writeText "process-compose.yml" (builtins.toJSON { "version" = "0.5"; "processes" = { "blue" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "darkblue" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "default" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "delek" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "desert" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "elflord" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "evening" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "habamax" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "industry" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "koehler" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "lunaperche" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "morning" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "murphy" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "pablo" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "peachpuff" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "quiet" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "ron" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "shine" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "slate" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "torte" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
      ''}"; "environment" = []; }; "zellner" = { "command" = "${let
        dev = pkgs.mkShell {};
        shell = "
    exec ${pkgs.xfce.xfce4-terminal}/bin/xfce4-terminal --hide-menubar --disable-server --command \"${pkgs.neovim}/bin/nvim -u ${pkgs.writeTextFile {
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
  }}\" &> /dev/null
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
          "vscodiumBattle" = {
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
        text = builtins.toJSON { "Abyss" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Default Dark+" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Default High Contrast" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Default High Contrast Light" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Default Light+" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Default Light Modern" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Kimbie Dark" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Monokai" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Monokai Dimmed" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Quiet Light" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Red" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Solarized Dark" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Solarized Light" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Tomorrow Night Blue" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Visual Studio Dark" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
      ''}"; "Visual Studio Light" = "${let
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
          "vscodiumRunAll" = {
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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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

    export HOME=\$TEMP_DIR
    export XDG_CONFIG_HOME=\$TEMP_DIR/.config

    killVsCodium() {
      kill \$(cat \$XDG_CONFIG_HOME/VSCodium/code.lock) || true;
      rm -rf \$TEMP_DIR
    }
    trap \"killVsCodium &> /dev/null\" EXIT

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
