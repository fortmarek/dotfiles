{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs;
    [ 
        vim
        gitAndTools.gitFull
        gitAndTools.delta
        gitAndTools.gh
        python37
    ];

  programs.zsh.enable = true;  # default shell on catalina

  system.stateVersion = 4;
}
