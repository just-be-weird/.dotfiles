#### 1. Goto symbols directory
```shell
cd /usr/share/X11/xkb/symbols
```
#### 2. Find `us` file and open with xed, nano or code
```shell
sudo xed us
```
#### 3. Now in `us` file find the `colemak_dh_iso` layout entry and below that add the `colemak_dhk`

```shell
xkb_symbols "colemak_dhk" {

    include "us(colemak_dh)"
    name[Group1]= "English (Colemak-DHk Mod)";

    key <AB01> { [            z,            Z,              ae,               AE ] };
    key <AB02> { [            x,            X, dead_circumflex,       asciitilde ] };
    key <AB03> { [            c,            C,        ccedilla,         Ccedilla ] };
    key <AB04> { [            d,            D,  dead_diaeresis,       asciitilde ] };
    key <AB05> { [            v,            V,              oe,               OE ] };
    key <AB06> { [            k,            K,  dead_abovering,       asciitilde ] };
    key <AB07> { [            h,            H,      dead_caron,       asciitilde ] };
    key <AB08> { [        comma,         less,    dead_cedilla,       asciitilde ] };
    key <AB09> { [       period,      greater,   dead_abovedot,       asciitilde ] };
    key <AB10> { [        slash,     question,    questiondown,       asciitilde ] };

    include "level3(ralt_switch)"
};
```
#### Note the caps entry in above config didn't work still adding here for reference.
```shell
key <CAPS> { [    BackSpace	] };
```

Backspace to caps is working, but it's not required as I'm running Xmodmap script
```shell
key <BKSP> { [    Caps_Lock		] };
```

#### 4. To swap caps and backspace keys add .Xmodmap file in home directory then inside the file add following code
```shell
!Turn Caps Lock into a second Escape key
remove Lock = Caps_Lock
keysym Caps_Lock = BackSpace
remove Lock = BackSpace
keysym BackSpace = Caps_Lock
```

#### 5. Now goto rules directory add the entries of new config from `us` file
```shell
cd /usr/share/X11/xkb/rules
```
```shell
sudo xed evdev.lst
```

Now add the following before code snippet by locating `colemak_dh      us: English (Colemak-DH)`
```shell
colemak_dhk     us: English (Colemak-DHk Mod)
```

#### 6. Now open `evdev.xml` file and add the next code snippet
```shell
sudo xed evdev.xml
```
locate this 
```xml
<variant>
<configItem>
<name>colemak_dh</name>
<description>English (Colemak-DH)</description>
</configItem>
</variant>
```
and add this
```xml
<variant>
  <configItem>
    <name>colemak_dhk</name>
    <description>English (Colemak-DHk Mod)</description>
  </configItem>
</variant>
```
#### For reloading the keyboard script add following to alias file
```shell
alias reload='source ~/.bash_profile'
```
