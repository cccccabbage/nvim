# Intro

My personal nvim config based on AstroNvim.
There are only some key mapping changes and little plugin adjust compared to the AstroNvim.

1. It can correctly toggle pwsh/powershell terminal on windows now.
2. Some key mapping change, see the table below for details.
3. Completely disabled mouse
4. Disabled format on start and save

## Key Mapping Changes
| mode| Key Map| Former Function| New Function|
|---:|---:|---:|---:|
| n| Alt + h| None| Move to left split|
| n| Alt + j| None| Move to below split|
| n| Alt + k| None| Move to above split|
| n| Alt + l| None| Move to right split|
| n| Ctrl + h| Move to left split| Move to left/previous buffer|
| n| Ctrl + l| Move to right split| Move to right/next buffer|
| n| Ctrl + p| Perious Completion| Find files|
| n| Leader + a| None| Open code outline|
| t| Alt + h| None| Terimal left window navigation|
| t| Alt + j| None| Terimal down window navigation|
| t| Alt + k| None| Terimal up window navigation|
| t| Alt + l| None| Terimal right window navigation|


## Change Terminal
Edit the local value in the ```pairs``` function, [terminal.lua](./lua/plugins/terminal.lua).

For example, if powershell is needed, the codes below would be fine.
```lua
for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
```

## im-select
Please make sure to edit `plua/plugins/im-select.lua`.

```
default_command = "/path/to/your/im-select",
```

See [im-select.nvim](https://github.com/keaising/im-select.nvim) for more information.