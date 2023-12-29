#!/bin/sh

SPACE_ICONS=("" "" "" "" "" "" "" "" "" "")

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)
# SPACE_CLICK_SCRIPT='[ "$BUTTON" = "right" ] && (yabai -m space --destroy $SID; sketchybar --trigger space_change) || yabai -m space --focus $SID 2>/dev/null'

sid=0
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space      space.$sid left                             \
             --set space.$sid associated_space=$sid                       \
                              icon=${SPACE_ICONS[i]}                      \
                              icon.color=$FOREGROUND                      \
                              icon.padding_left=24                        \
                              icon.padding_right=24                       \
                              icon.font="JetBrainsMonoNL Nerd Font Mono:Regular:18" \
                              icon.highlight_color=$WHITE                 \
                              background.color=$BACKGROUND                \
                              background.padding_left=-8                  \
                              background.padding_right=-12                \
                              background.corner_radius=12                 \
                              background.drawing=on                       \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=32                      \
                              label.padding_left=32                      \
                              label.background.height=20                  \
                              label.background.drawing=on                 \
                              label.background.corner_radius=9            \
                              label.background.color=$WHITE  \
                              label.drawing=off\
                              script="$PLUGIN_DIR/space.sh"               \
                              # click_script="$SPACE_CLICK_SCRIPT"
done

# sketchybar   --add item       separator left                                  \
             # --set separator  icon=                                          \
                              # icon.font="JetBrainsMonoNL Nerd Font Mono:Regular:12" \        \
                              # background.padding_left=26                      \
                              # background.padding_right=15                     \
                              # label.drawing=off                               \
                              # associated_display=active                       \
                              # icon.color=$WHITE                               \
                              # click_script='yabai -m space --create
                                            # sketchybar --trigger space_change'\
