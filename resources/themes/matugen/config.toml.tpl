[config]

[templates.hyprland]
input_path = '../templates/colors.hyprland.tpl'
output_path = '${DOTFILES}/hypr/colors.conf'
post_hook = 'hyprctl reload'

[templates.waybar]
input_path = '../templates/colors.waybar.tpl'
output_path = '${DOTFILES}/waybar/colors.css'
post_hook = 'pkill -SIGUSR2 waybar'

[templates.kitty]
input_path = '../templates/colors.kitty.tpl'
output_path = '${DOTFILES}/kitty/current-theme.conf'
post_hook = 'pkill -SIGUSR1 kitty'

[templates.wofi]
input_path = '../templates/colors.css.tpl'
output_path = '${DOTFILES}/wofi/colors.css'

[templates.zathura]
input_path = '../templates/colors.zathura.tpl'
output_path = '~/.config/zathura/zathurarc'

[templates.gtk3]
input_path = '../templates/colors.gtk.tpl'
output_path = '${DOTFILES}/gtk-3.0/colors.css'
post_hook = 'gsettings set org.gnome.desktop.interface gtk-theme ""; gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-{{mode}}'

[templates.gtk4]
input_path = '../templates/colors.gtk.tpl'
output_path = '${DOTFILES}/gtk-4.0/colors.css'

[templates.qt5ct]
input_path = '../templates/colors.qt.tpl'
output_path = '${DOTFILES}/qt5ct/matugen.conf'

[templates.mako]
input_path = '../templates/colors.mako.tpl'
output_path = '$DOTFILES/mako/config'
