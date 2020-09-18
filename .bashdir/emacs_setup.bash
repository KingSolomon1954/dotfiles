# --------------------------------------------------
#
# Setup for emacs
#
# The following is the preferred way to test for variable existence in
# bash, but -v doesn't exist yet in cygwin version of bash, so this file
# for now uses old style.
#
# Preferred:  if [[ ! -v EMACSCLIENT ]]; then
# Old style:  if [[ -z "${EMACSCLIENT}" ]]; then
#
# --------------------------------------------------
#
# Emacs Client Frame - Emacsclient opens and creates new frame

emc()
{
    if [[ -z "${EMACSCLIENT}" ]]; then
        echo "[ERROR] EMACSCLIENT undefined" 1>&2
        return 1
    fi
    ${EMACSCLIENT} -n -c -q "$@" &
}

# --------------------------------------------------
#
# Emacs Terminal - Emacsclient opens within terminal
# Yuk, avoid this one, my keybindings and terminal are
# not totally sympatico

emt()
{
    if [[ -z "${EMACSCLIENT}" ]]; then
        echo "[ERROR] EMACSCLIENT undefined" 1>&2
        return 1
    fi
    ${EMACSCLIENT} -nw "$@"
}

# --------------------------------------------------
#
# Emacs Client in existing frame

ems()
{
    if [[ -z "${EMACSCLIENT}" ]]; then
        echo "[ERROR] EMACSCLIENT undefined" 1>&2
        return 1
    fi
    ${EMACSCLIENT} -n -q "$@" &
}

# --------------------------------------------------
#
# Emacs Daemon -start it

emdaemon()
{
    if [[ -z "${EMACS}" ]]; then
        echo "[ERROR] EMACS undefined" 1>&2
        return 1
    fi
    rm -f ~/.emacs.desktop.lock ~/.emacs.d/.emacs.desktop.lock
    (cd ~ && ${EMACS} --daemon)
}

# --------------------------------------------------
#
# Emacs - the traditional way - no daemon

em()
{
    if [[ -z "${EMACS}" ]]; then
        echo "[ERROR] EMACS undefined" 1>&2
        return 1
    fi
    
    if isCygwin; then
        # On cygwin, apparently emacs doesn't see INFOPATH so you can't
        # "read the manual" from within emacs itself. But if I supply 
        # INFOPATH directly on the command line invocation, then it works.
        INFOPATH=$(cygpath -w -p "${INFOPATH}") "${EMACS}" $(cygpath -i -w -- "$@" ) &
    else
        local xyz="$*"
        if [ "${xyz/-nw }" != "${xyz}" ]; then
            ${EMACS} "$@"
        elif [[ -z "${DISPLAY}" ]]; then
            ${EMACS} -nw "$@"
        else
            ${EMACS} -fh "$@" &
        fi
    fi
}

# --------------------------------------------------
#
# JASSPA microemacs - mostly obsolete now

me()
{
    if isCygwin; then
        if fileExists /cygdrive/c/Program\ Files/JASSPA/MicroEmacs/me32.exe; then
            /cygdrive/c/Program\ Files/JASSPA/MicroEmacs/me32 $(cygpath -i -w "$*") &
        elif fileExists /cygdrive/c/Program\ Files\ \(x86\)/JASSPA/MicroEmacs/me32.exe; then
            /cygdrive/c/Program\ Files\ \(x86\)/JASSPA/MicroEmacs/me32 $(cygpath -i -w "$*" ) &
        else
            echo "Cant find me executable in me() function"
        fi
    elif isLinux; then
        local xyz="$*"
        if [ "${xyz/-n}" != "${xyz}" -o "${DISPLAY}X" = "X" ]; then
            command me -n "$@"
        else
            command me "$@" &
        fi
    else
        echo "Unavailable for unknown OS"
    fi
}

# --------------------------------------------------

findEmacs()
{
    local listOfEmacsLocations="${HOME}/bin/emacs /usr/local/bin/emacs /usr/bin/emacs"

    for e in ${listOfEmacsLocations} ; do
        if [ -x "$e" ]; then
            EMACS="$e"
            EMACSCLIENT="${e}client"
            export EMACS
            export EMACSCLIENT
            return 0
        fi
    done
}

# --------------------------------------------------

findEmacs
unset findEmacs

# Set EDITOR environment var. But cygwin has no emacslient

if ! isCygwin; then
    if [[ -n "${DISPLAY}" ]] && [[ -n "${EMACS}" ]]; then
        export EDITOR="${EMACSCLIENT} -c -q"
        export VISUAL="${EMACSCLIENT} -c -q"
    fi
fi

# --------------------------------------------------
