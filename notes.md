# Notes

## Sublime
Install Subl Command
```
$ ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" subl
```

If using tmux:
```
$ brew install reattach-to-user-namespace
```

## Git
Autocomplete
```
$ curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o
```

Add to `.bash_profile`
```
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
```