## Installing tmux
```shell
sudo apt install tmux
```

### Verify and start tmux

```shell
# verify tmux is installed
which tmux
# start a new session
tmux attach
# OR
tmux a
```

## Panes in Tmux
#### Horizontal and vertical panes
Tmux prefix to trigger tmux to listen our commands. Default keybinding is `ctrl + b`.

#### Creating horizontal pane
Press `ctrl + b` and then press `shift + "`

#### Creating vertical pane
Press `ctrl + b` and then press `shift + %`

#### Killing an active pane
Press `ctrl + b` and then press `x` which will ask for confirmation before killing the pane.

Whereas to kill a pane without confirmation `ctrl + d` which will kill it without any confirmation.

#### Moving from a pane to another
Press `ctrl + b` and then press arrow keys to move to desired pane.

#### Moving from a pane to another
Press `ctrl + b` and then press arrow keys to move to desired pane.

#### To open a pane in zoom/maximize mode
Press `ctrl + b` and then press `z` key on desired pane and that will open the pane into maximize mode.

To un-zoom it repeat same command.

## Windows in Tmux

#### Create a new window
Press `ctrl + b` and then press `c` that will create a new window

#### Going back to previous and next window
Press `ctrl + b` and then press `p` that will take us back to previous window and press `n` to take me to the
next window.

#### Naming windows
Press `ctrl + b` and then press `,` that will ask for the new name for active window

#### Create a new window
Press `ctrl + b` and then press `c` that will create a new window

#### Killing a window
Press `ctrl + b` and then press `&` that will kill the active window

## Sessions in Tmux

#### Create a new session
Press `ctrl + b` and then press `d` that will disconnect the session and will take back us to terminal. Note we
just disconnected the session not killed it.

#### Create a new session and naming at the same time
Issue it from terminal `tmux new -s "My web project"`

#### Viewing active sessions from terminal
`tmux list-sessions` or `tmux ls` or `ps aux | grep tmux` (not recommended)

#### Renaming an active sessions
`ctrl + b` and then press key `$` then give a session a name

#### Opening a session manually terminal
1. First check the active sessions by `tmux list-sessions`
2. Then use `tmux attach -t 1` (t for target)
3. OR for named sessions `tmux a -t web-dev` (a is short of attach)

#### Opening a sessions interactively
`ctrl + b` and then press key `s` then use arrow keys to choose from the list

## Customization and tweaks

#### Create a config file
Create a new file in home directory `.tmux.conf` and then add the following

