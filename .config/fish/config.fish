source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# opencode
fish_add_path /home/xlucky/.opencode/bin

# --- Modern CLI Tools ---
if status is-interactive
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source

    alias ls="eza --icons --group-directories-first"
    alias ll="eza -lh --icons --git --group-directories-first"
    alias tree="eza --tree --icons"
    alias cat="bat --paging=never"
end
