# My dotfiles

I spend a *lot* of time in the CLI, therefore I find it very important that it is setup in a way I like. That is not only because I want the time I spend in my CLI to be pleasant (although, that is absolutely a good reason!) but also to be *efficient*.

To achieve that it is important to have a look at your dotfiles.

While a lot of users do personalize their CLI in some way, it is not at all so common that people version their changes to them. They are also strewn all around the home directory and it is very hard to be sure where you can find what. As a result, this might make it harder for you to make customizations, so in a lot of cases you will not that make small change that might make your life a little better at all. But in the long run this all adds up.

Full disclosure:
This project is heavily inspired by [holman/dotfiles](https://github.com/holman/dotfiles) but there are some major differences (eg oh-my-zsh integration)

## Topics

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Install

Run this:

```sh
git clone https://github.com/fortmarek/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

Running this should not be a destructive action as the script asks you if there is some file it would overwrite. But please use with care as there might be some changes I did not anticipate.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dotfile` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dotfile` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

You also might want to update the `Brewfile` to configure your applications you want to install as the list there is completely personal - or delete it altogether if you prefer not to have this in your dotfiles.