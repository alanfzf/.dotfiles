dirs="${XDG_DATA_DIRS}"
extra="$HOME/.local/bin"
term="foot -e"
paths="${dirs//:/ }"

cmd=$(
{
    # Desktop entries
    for p in $paths; do
      find -L "$p/applications" -type f -name '*.desktop' 2>/dev/null
    done | while read -r f; do
        name=$(grep -m1 '^Name=' "$f" | cut -d= -f2-)
        # Raw Exec (without % arguments)
        exec=$(grep -m1 '^Exec=' "$f" | cut -d= -f2- | sed 's/ *%[A-Za-z]//g')
        # Detect Terminal=true
        terminal=$(grep -m1 '^Terminal=' "$f" | cut -d= -f2-)

        if [ -n "$name" ] && [ -n "$exec" ]; then
            if [ "$terminal" = "true" ]; then
                printf "%s\t%s\n" "$name" "$term $exec"
            else
                printf "%s\t%s\n" "$name" "$exec"
            fi
        fi
    done

    # Scripts under ~/.local/bin
    if [ -d "$extra" ]; then
        find "$extra" -maxdepth 1 -type f -executable | while read -r s; do
            printf "%s\t%s\n" "$(basename "$s")" "$term $s"
        done
    fi
} | sort | fzf --delimiter=$'\t' --with-nth=1 | cut -f2
)

[ -n "$cmd" ] && swaymsg exec "$cmd"
