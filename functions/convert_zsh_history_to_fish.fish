function convert_zsh_history_to_fish
    set -l zsh_history (zsh -i -c 'fc -R ~/.zsh_history; fc -l -t "%s" 0')

    for line in $zsh_history
        set -l line (string replace --regex --all ' +' ' ' $line |string trim)
        set -l arr (string split -n ' ' --max 2 $line)

        if test -n $arr[3]
            echo "- cmd: $arr[3]
  when: $arr[2]"
        end
    end
end
