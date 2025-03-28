# Setup shell history
#
# --------------------------------------------------

HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:ignorespace:erasedups
#       A colon-separated list of values controlling  how  commands  are
#       saved  on  the  history  list.   If  the list of values includes
#       ignorespace, lines which begin with a space  character  are  not
#       saved  in  the history list.  A value of ignoredups causes lines
#       matching the previous history entry to not be saved.  A value of
#       ignoreboth is shorthand for ignorespace and ignoredups.  A value
#       of erasedups causes all previous lines matching the current line
#       to  be  removed from the history list before that line is saved.
#       Any value not in the above list is ignored.  If  HISTCONTROL  is
#       unset,  or does not include a valid value, all lines read by the
#       shell parser are saved on the history list, subject to the value
#       of  HISTIGNORE.  The second and subsequent lines of a multi-line
#       compound command are not tested, and are added  to  the  history
#       regardless of the value of HISTCONTROL.

HISTIGNORE="?":"??":"???":"cd ..":"cdg ?":"man *":groups:"history*"
# HISTIGNORE+=":""git push":"git pull":"git switch -":"git add -A"
#       A  colon-separated list of patterns used to decide which command
#       lines should be saved on the  history  list.   Each  pattern  is
#       anchored  at  the  beginning of the line and must match the com‐
#       plete line (no implicit  `*'  is  appended).   Each  pattern  is
#       tested  against  the line after the checks specified by HISTCON‐
#       TROL are applied.  In  addition  to  the  normal  shell  pattern
#       matching characters, `&' matches the previous history line.  `&'
#       may be escaped using  a  backslash;  the  backslash  is  removed
#       before attempting a match.  The second and subsequent lines of a
#       multi-line compound command are not tested, and are added to the
#       history  regardless  of  the  value  of HISTIGNORE.  The pattern
#       matching honors the setting of the extglob shell option.

shopt -s cmdhist
#       If set, bash attempts to save all lines of a multiple-
#       line command in the same history entry. This allows
#       easy re-editing of multi-line commands.
 
hist_save()
{
    history -a
}

hist_load()
{
    history -r
}

hist_find()
{
    grep "$@" ~/.history/*
}

hist_file()
{
    mkdir -p ~/.history
    if [ $# -gt 0 ]; then
        case $1 in
            1) HISTFILE=~/.history/1-left-col.hist  ;;
            2) HISTFILE=~/.history/2-left-col.hist  ;;
            3) HISTFILE=~/.history/3-left-col.hist  ;;
            4) HISTFILE=~/.history/4-left-col.hist  ;;
            5) HISTFILE=~/.history/5-right-col.hist ;;
            6) HISTFILE=~/.history/6-right-col.hist ;;
            7) HISTFILE=~/.history/7-right-col.hist ;;
            8) HISTFILE=~/.history/8-right-col.hist ;;
        esac
        return 0
    fi

    # Otherwise prompt for history file
    files="1-left-col 2-lef-col 3-left-col 4-left-col \
           5-right-col 6-right-col 7-right-col 8-right-col"
    PS3="Select history file: "
    select w in ${files}; do
        if [ ${w} ]; then
            HISTFILE=~/.history/${w}.hist
            break
        fi
    done
}

let _hist_count=0
hist_crossing()
{
    let _hist_count++
    if [ $_hist_count -gt 20 ]; then
        let _hist_count=0
        hist_save
    fi
}

hist_sync()
{
    hist_file $1
    hist_load
}

PROMPT_COMMAND="hist_crossing"
PROMPT_DIRTRIM=5
# If set to a number greater than zero, the value is used as the number
# of trailing directory components to retain when expanding the \w and
# \W prompt string escapes (see PROMPTING below).  Characters removed
# are replaced with an ellipsis.

# HISTTIMEFORMAT="%y-%m-%d-%H:%M:%S "
# history -w writes the entire history adding timestamps if configured# history -w writes the entire history adding timestamps if configured
# history -a writes only the delta from the last -a
# history -r loads from file but does not consider these as new entries
# thus a history -r followed a history -a writes nothing
