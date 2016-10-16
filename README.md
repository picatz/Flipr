# Flipr

A simple, configurable flip table / put table command-line application with optional rainbows.

TODO: 
* Stuff.

## Installation
You're going to need to install the following ruby gems:
`$ gem install trollop colorize`

## Screen Shot

![lolololol](http://imgur.com/a/8Izhg)

## Usage

```
FLIPR [ ╯ ' □']╯︵┻━┻)
  -f, --flip               Flip a table
  -p, --put                Put a table
  -F, --Flip-config=<s>    Flip table configuration
  -P, --Put-config=<s>     Put table configuration
  -l, --lol                Rainbow support, because we need it
  -h, --help               Show this message
```

### Flip Table

`$ ruby flipr.rb -f`

### Put Table

`$ ruby flipr.rb -p`

### Specify your own Flips

`$ ruby flipr.rb -f -F flips.yaml`

### Help

Program should default to a help menu when no flags are specified.

`$ ruby flipr.rb`

You can also ask for help.

`$ ruby flipr.rb -h`

### Credits
Kent 'picat' Gruber
