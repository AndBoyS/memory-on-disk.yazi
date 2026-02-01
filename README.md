# memory-on-disk.yazi

Plugin for [Yazi](https://github.com/sxyazi/yazi) that displays the remaining available memory in the status bar.

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
