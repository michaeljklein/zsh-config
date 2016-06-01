# zsh-config
My Zsh `.zshrc` file

Here's a screenshot of the theme:

![Oh my zsh!](https://cdn.rawgit.com/michaeljklein/zsh-config/master/screenshot.gif)

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

Also, I'm a bit red-green colorblind so forgive me if the colors in the theme look weird to you.
I try to lessen the effects with [this](https://github.com/michaeljklein/colorblind-lcd) config, 
but I really can't tell. 
