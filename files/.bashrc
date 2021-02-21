# bash sources
declare -a bashSources=(
    $(brew --prefix)/etc/bash_completion
    ~/.fzf.bash
    ~/.travis/travis.sh
)
for s in ${bashSources[@]}; do
    source $s
done
