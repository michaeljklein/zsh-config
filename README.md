# zsh-config
My Zsh `.zshrc` file

Here's a screenshot of the theme:

![Oh my zsh!](https://cdn.rawgit.com/michaeljklein/zsh-config/master/screenshot.gif)

Besides the theme, there are two interesting features:

1. Enter twice on a blank line reruns the previous command
2. `N` tabs on a blank line then enter reruns the last `N` commands. 

For example:

```
$> echo 'hello'
hello
$> echo 'there,'
there,
$> echo 'world!'
world!
$> <Cr> to execute the following commands or <Tab> to fetch another command:
echo 'world!'
echo 'there,'
echo 'hello'
hello
there,
world!
```

Also, I'm a bit red-green colorblind so forgive me if the colors in the theme look weird to you.
I try to lessen the effects with [this](https://github.com/michaeljklein/colorblind-lcd) config, 
but I really can't tell. 
