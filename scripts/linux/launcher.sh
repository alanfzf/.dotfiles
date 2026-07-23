data_dirs="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
terminal_command="${LAUNCHER_TERMINAL:-"foot -e"}"

find_desktop_files() {
    old_ifs=$IFS
    IFS=:

    for data_dir in $data_dirs; do
        applications_dir="$data_dir/applications"

        [ -d "$applications_dir" ] || continue

        find -L "$applications_dir" \
            -type f \
            -name '*.desktop' \
            -print0 \
            2>/dev/null
    done

    IFS=$old_ifs
}

extract_app_commands() {
    xargs -0 awk -F= -v terminal_command="$terminal_command" '
        function print_entry() {
            if (!name || !exec_command) {
                return
            }

            # Remove desktop-entry placeholders such as %f, %U, and %i.
            gsub(/[[:space:]]*%[A-Za-z]/, "", exec_command)

            if (opens_in_terminal == "true") {
                exec_command = terminal_command " " exec_command
            }

            print name "\t" exec_command
        }

        FNR == 1 {
            if (NR > 1) {
                print_entry()
            }

            name = ""
            exec_command = ""
            opens_in_terminal = "false"
        }

        $1 == "Name" && !name {
            name = substr($0, 6)
        }

        $1 == "Exec" && !exec_command {
            exec_command = substr($0, 6)
        }

        $1 == "Terminal" {
            opens_in_terminal = $2
        }

        END {
            print_entry()
        }
    '
}

choose_command() {
    LC_ALL=C sort |
        fzf \
            --delimiter="$(printf '\t')" \
            --with-nth=1 |
        cut -f2-
}


launch_command() {
    command=$1
    [ -n "$command" ] || return
    setsid /bin/sh -c "$command" \
        </dev/null \
        >/dev/null \
        2>&1 &
    sleep 0.01
}

launch_command "$(find_desktop_files | extract_app_commands | choose_command)"
