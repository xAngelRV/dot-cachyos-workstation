function backup-dots --description "Respalda dotfiles de CachyOS a GitHub"
    set -l DOTDIR ~/dot-cachyos-workstation
    mkdir -p $DOTDIR/.config/pipewire/pipewire.conf.d $DOTDIR/.config/systemd/user $DOTDIR/.config/fish/functions $DOTDIR/.config/fish/conf.d $DOTDIR/.config/kitty $DOTDIR/scripts
    cp -f ~/.config/pipewire/pipewire.conf.d/*.conf $DOTDIR/.config/pipewire/pipewire.conf.d/ 2>/dev/null
    cp -f ~/.config/systemd/user/windows-audio-link.service $DOTDIR/.config/systemd/user/ 2>/dev/null
    cp -f ~/.config/fish/config.fish $DOTDIR/.config/fish/ 2>/dev/null
    cp -f ~/.config/starship.toml $DOTDIR/.config/ 2>/dev/null
    cp -f ~/.config/kitty/kitty.conf $DOTDIR/.config/kitty/ 2>/dev/null
    find ~/.config/fish/functions -maxdepth 1 -type f -exec cp -f {} $DOTDIR/.config/fish/functions/ \;
    find ~/.config/fish/conf.d -maxdepth 1 -type f -exec cp -f {} $DOTDIR/.config/fish/conf.d/ \;
    find ~/.local/bin -maxdepth 1 -type f -exec cp -f {} $DOTDIR/scripts/ \;

    git -C $DOTDIR add -A
    if not git -C $DOTDIR diff --cached --quiet
        git -C $DOTDIR commit -m "chore: sync dotfiles "(date "+%Y-%m-%d %H:%M")
        git -C $DOTDIR push
    else
        echo "Sin cambios nuevos para respaldar."
    end
end
