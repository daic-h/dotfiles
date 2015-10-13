#
# Options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
# setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
# setopt CDABLE_VARS          # Change directory to a path stored in a variable.
# setopt EXTENDED_GLOB        # Use extended globbing syntax.
# setopt MULTIOS              # Write to multiple descriptors.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
# setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
# setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
# unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
# setopt pushdminus

#
# Functions
#

function chpwd() { ls -GF } # LSのあとcdしてくれるよ
