# get piped input from cat
input=$(cat)

# check if the first character is a + or -
action=${input:0:1}
# get the rest of the string which is the device
device=${input:1}

# if it is a +, set a varible to 5, else set it to -5
if [ "$action" = "+" ]; then
    # brightnessctl --device=acpi_video0 set +5%
    brightnessctl --device=$device set 5%+
else
    # brightnessctl --device=acpi_video0 set 5%-
    brightnessctl --device=$device set 5%-
fi