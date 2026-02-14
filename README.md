# memory-on-disk.yazi

Plugin for [Yazi](https://github.com/sxyazi/yazi) that displays the remaining available memory in the status bar.

Note: you will see a difference between what Finder on Mac reports and this plugin because `df` doesn't know about purgable space (space for caching that will be automatically freed if necessary)

## Installation

### Using `ya pkg`

```
 ya pkg add AndBoyS/memory-on-disk
```

## Setup

Add the following to your `~/.config/yazi/init.lua`:

```lua

require("memory-on-disk"):setup()
```

## Configuration

You can change the update frequency (in seconds), 5 by default

```lua

require("memory-on-disk"):setup({ update_freq = 5 })
```
