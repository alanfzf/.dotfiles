#!/bin/sh

# swaybar protocol header
echo '{"version":1}'
echo '['
echo '[],'

WEATHER_CACHE="/tmp/swaybar_weather.txt"

# In background:
(
  while :; do
    ~/.config/sway/scripts/weather.sh >/dev/null > "$WEATHER_CACHE"
    sleep 600
  done
) &

while :; do
  clock="$(date '+%Y/%m/%d - %H:%M')"
  cpu="$(grep 'cpu ' /proc/stat | awk '{u=($2+$4)*100/($2+$4+$5); printf "%.0f", u}')"
  mem="$(free | awk '/Mem/ {printf "%.0f", $3/$2*100}')"
  net="$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5; exit}')"
  weather="$(cat $WEATHER_CACHE)"

  echo "[
    {\"name\":\"weather\", \"full_text\":\" $weather\" },
    {\"name\":\"net\", \"full_text\":\" 󰈀  $net \" },
    {\"name\":\"mem\", \"full_text\":\"   $mem% \"},
    {\"name\":\"cpu\", \"full_text\":\"   $cpu% \"},
    {\"name\":\"clock\", \"full_text\":\" 󰃰  $clock \"},
  ],"
  sleep 5
done
