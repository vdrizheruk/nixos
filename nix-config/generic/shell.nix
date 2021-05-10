{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    screenfetch most gnupg grc
    abduco dvtm dtach
  ];

  environment.shellAliases = {
    wm   = "abduco -A wm-$UID dvtm -m ^A";
    wmdt = "dtach -A /tmp/dvtm-$UID -r winch dvtm -m ^A";
    sw   = "sudo nixos-rebuild switch --show-trace";
    swu  = "sudo nixos-rebuild switch --show-trace --upgrade";
    swd  = "sudo nixos-rebuild dry-build --show-trace";
    swdu = "sudo nixos-rebuild dry-build --show-trace --upgrade";
    swb  = "sudo nixos-rebuild boot --show-trace";
    swbu = "sudo nixos-rebuild boot --show-trace --upgrade";
    php = "/etc/php74/bin/php";
    php74 = "/etc/php74/bin/php";
    php73 = "/etc/php73/bin/php";
    php72 = "/etc/php72/bin/php";
  };

  programs.nano = {
    nanorc = ''
      set constantshow
      set indicator
      set nowrap
      set positionlog
      set smarthome
      set stateflags
      set tabsize 2
      set tabstospaces
      set unix
      set wordbounds
    '';
    syntaxHighlight = true;
  };

  programs.bash = {
    enableCompletion = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    histSize = 1000000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "CORRECT" "GLOB_COMPLETE" "HASH_CMDS" "HASH_DIRS" "HASH_LIST_ALL" "NO_BEEP" "NOTIFY" "RM_STAR_WAIT"
      "EXTENDED_HISTORY" "HIST_FCNTL_LOCK" "HIST_IGNORE_ALL_DUPS" "HIST_IGNORE_SPACE" "HIST_REDUCE_BLANKS"
      "HIST_SAVE_NO_DUPS" "HIST_VERIFY" "INC_APPEND_HISTORY_TIME" "NO_HIST_IGNORE_DUPS" "SHARE_HISTORY"
    ];
    ohMyZsh.enable = true;
    ohMyZsh.custom = "${pkgs.nur.repos.izorkin.oh-my-zsh-custom}"; 
    ohMyZsh.theme = "rkj-mod";
    ohMyZsh.plugins = [ "command-time" "history-sync" "git" "sudo" ];
    syntaxHighlighting.enable = true;
    syntaxHighlighting.highlighters = [ "main" "brackets" "pattern" "cursor" "line" ];
    syntaxHighlighting.patterns = { };
    syntaxHighlighting.styles = { "globbing" = "none"; };
    loginShellInit = "screenfetch";
    interactiveShellInit = ''
      export PATH=$PATH:/root/.symfony/bin:/etc/php72/bin:/etc/php73/bin:/etc/php74/bin:/etc/php80/bin
      export PAGER=most
      export EDITOR=nano
      ZSH_COMMAND_TIME_COLOR="yellow"
      ZSH_COMMAND_TIME_ECHO=1
      ZSH_COMMAND_TIME_MIN_SECONDS=3
      source "${pkgs.grc}/etc/grc.zsh"
    '';
  };

  users = {
    defaultUserShell = pkgs.zsh;
  };
}
