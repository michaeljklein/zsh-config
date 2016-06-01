# zsh-config
My Zsh `.zshrc` file

Here's a screenshot of the theme:

![Oh my zsh!](https://cdn.rawgit.com/michaeljklein/zsh-config/master/screenshot.png)

Besides the theme, the only interesting thing is a convenient `magic-enter` command:

```
# enter twice on blank line reruns previous command
magic-enter () {
        if [[ -z $BUFFER ]]
        then
#                zle clear-screen
                zle up-history
        else
                zle accept-line
        fi
}
```

