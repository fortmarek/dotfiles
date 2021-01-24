{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs;
    [ 
        vim
        gitAndTools.gitFull
        gitAndTools.delta
        gitAndTools.gh
        python37
        nodejs
    ];

  programs.zsh.enable = true;  # default shell on catalina

  system.stateVersion = 4;
}
