if status is-interactive
    # variables
    set -gx EDITOR nvim
    set -gx MANPAGER "nvim +Man!"
    set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
    set -gx RIPGREP_CONFIG_PATH ~/.config/ripgrep/config
    set -gx GOPATH ~/.local/share/go/
    fish_add_path -g ~/.local/bin/ ~/.cargo/bin/ $GOPATH/bin/

    # colors
    set -g fish_color_command blue
    set -g fish_color_keyword magenta
    set -g fish_color_param brmagenta
    set -g fish_color_error red
    set -g fish_color_comment brblack

    set -l selection 223249
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection

    set -g fish_pager_color_prefix blue --bold
    set -g fish_pager_color_description cyan --italic
    set -g fish_pager_color_progress brmagenta

    # pure prompt
    set -g async_prompt_functions _pure_prompt_git
    set -g pure_color_primary cyan
    set -g pure_color_success white
    set -g pure_enable_single_line_prompt true
    set -g pure_symbol_prompt "\$"
    set -g pure_show_prefix_root_prompt true
    set -g pure_threshold_command_duration 1
    set -g pure_show_jobs true

    set -g fish_greeting ""

    if type -q zoxide
        zoxide init fish | source
    end

    function take
        mkdir -p $argv
        cd $argv
    end

    # aliases and abbrs
    alias l "eza -MF --icons --group-directories-first --smart-group"
    abbr la "l -a"
    abbr ll "l -l"
    abbr lla "l -la"
    alias ff "fastfetch --disable-linewrap"
end
