## Setting up Lua language server using pre compiled binaries

* Download official binary release for your platform (page)[https://github.com/sumneko/lua-language-server/releases]
* Extract the downloaded source into `~./config/nvim/lua-language-server`
* Creat a new empty file with this exact name `lua-language-server`, inside `/.config/nvim/lua-language-server`
* So, this file will act as dynamic wrapper, and we will place this inside `usr/local/bin`
* Before that add following content inside the newly created `~/.config/nvim/lua-language-server/lua-language-server` file

```shell
#!/bin/bash
exec "~/.config/nvim/lua-language-server/bin/lua-language-server" "$@"
```
* Note that the above file will expose the extracted binary hence make sure the path used is correct
* Move the file to bin by running this command from te directory

```shell
sudo mv lua-language-server /usr/local/bin
```
