#!/bin/sh

set -e

CONF_DIR="$( cd "$(dirname "$0")" && pwd )"

PLUGINS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/tmux/plugins"


plugin_name() {
    local plugin
    plugin="$(basename "$1")"
    echo "${plugin%.git}"
}


list_plugins() {
    cat "${CONF_DIR}/tmux.conf" |
    awk '/^[ \t]*set(-option)? +-g +@plugin/ { print $4 }' |
    sed -Ee "s/^(\"(.*)\"|'(.*)')$/\2\3/"
}


install_plugins() {
    local plugins plugin name
    mkdir -p "$PLUGINS_DIR"
    plugins=""
    for plugin in $(list_plugins); do
        name=$(plugin_name "$plugin")
        plugins="${plugins}:$name:"

        if [ -d "${PLUGINS_DIR}/${name}" ]; then
            echo "Updating $name"
            {
                pushd "${PLUGINS_DIR}/${name}"
                git pull
            } > /dev/null 2>&1
        elif [ ! -d "${PLUGINS_DIR}/${name}" ]; then
            echo "Installing $name"
            git clone \
                "https://github.com/${plugin}" \
                "${PLUGINS_DIR}/${name}" \
                2>&1 > /dev/null
        fi
    done

    for plugin_dir in "${PLUGINS_DIR}"/*; do
        [ -d "$plugin_dir" ] || continue
        name="$(plugin_name "$plugin_dir")"
        case "$plugins" in
            *":${name}:"*) : ;;
            *)
                echo "Deleting $name"
                rm -rf "${plugin_dir}" >/dev/null 2>&1
                [ -d "$plugin_dir" ] &&
                    echo "Failed!"
                ;;
        esac
    done
}


install_hooks() {
    tmux bind-key -N "Install plugins" "I" run-shell "${CONF_DIR}/plugins.tmux install"
}


main() {
    case "$1" in
        "install")
            install_plugins
            ;;
        "")
            install_hooks
            ;;
    esac
}

main "$@"
