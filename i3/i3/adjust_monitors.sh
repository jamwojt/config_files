# function that checks if a value is already in the array
# contains_element <searched_value> ${<array_name>[@]}
contains_element() {
  local element
  for element in "${@:2}"; do
    if [[ "$element" == "$1" ]]; then
      return 1
    fi
  done
  return 0
}

# Terminate already running bar instances
killall -q polybar

declare -a handled_monitor_alignment_array

# get px alignment of each connected monitor
monitor_alignment=$(xrandr | grep " connected" | cut -d "+" -f2,3 | cut -d " " -f1)
readarray -t monitor_alignment_array <<< $monitor_alignment

# get name of each connected monitor
monitor_alignment_names=$(xrandr | grep " connected" | cut -d " " -f1)
readarray -t monitor_alignment_names_array <<< $monitor_alignment_names

monitor_index=0
previous_monitor_name="eDP-1"

for monitor_alignment in "${monitor_alignment_array[@]}"
do
    monitor_name=${monitor_alignment_names_array[$monitor_index]}
    if [[ "$monitor_name" != "eDP-1" ]]; then
        # first external monitor goes above the built-in screen
        if [[ $monior_index == 1 ]]; then
            xrandr --output $monitor_name --auto --above eDP-1
        else
            # place monitor relative to the last handled one
            xrandr --output $monitor_name --auto --left-of $previous_monitor_name
        fi
        # update last monitor name
        previous_monitor_name=$monitor_name
    fi

    # set wallpaper
    nitrogen --head=$monitor_index --set-zoom-fill ~/Wallpapers/control_wp.jpg
    
    # check if this alignment was handled already
    contains_element "$monitor_alignment" "${handled_monitor_alignment_array[@]}"
    # if not
    if [[ $? -eq 0 ]]; then
        # display polybar on that monitor
        MONITOR=${monitor_alignment_names_array[$monitor_index]} polybar --reload example &
        # add this alignment to handled list
        handled_monitor_alignment_array+=($monitor_alignment)
    fi
    monitor_index=$(($monitor_index + 1))
done
# automatically handle case with less monitors
xrandr --auto
