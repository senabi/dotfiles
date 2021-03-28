function extract --description 'extract compressed files like .tar.gz, .zip, etc'
    if test ! -e $argv[1]
		echo "'$argv[1]' does not exist"
        return 1
    end

    if string match -q "*.tar.bz2" $argv[1]
        tar xjf $argv[1]
    end
    if string match -q "*.tar.gz" $argv[1]
        tar xzf $argv[1]
    end
    if string match -q "*.gz" $argv[1]
    	gunzip $argv[1]
    end
    if string match -q "*.bz2" $argv[1]
        bunzip2 $argv[1]
    end
    if string match -q "*.rar" $argv[1]
        unrar x $argv[1]
    end
    if string match -q "*.tar.xz" $argv[1]
        tar xf $argv[1]
    end
    if string match -q "*.tar.zst" $argv[1]
        unzstd $argv[1]
    end
    if string match -q "*.deb" $argv[1]
        ar x $argv[1]
    end
    if string match -q "*.Z" $argv[1]
        uncompress $argv[1]
    end
    if string match -q "*.7z" $argv[1]
        7z x $argv[1]
    end
    if string match -q "*.zip" $argv[1]
        unzip $argv[1]
    end
    if string match -q "*.tgz" $argv[1]
        tar xzf $argv[1]
    end
    if string match -q "*.tbz2" $argv[1]
        tar xjf $argv[1]
    end
end
