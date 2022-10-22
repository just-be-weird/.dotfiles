# Setting up cursor
* I'm using oreo cursor pack
  * Get the official source files - [link](https://www.gnome-look.org/p/1360254)
* For newer icons - [link](https://www.gnome-look.org/browse?cat=107&ord=rating)

Once you get the icons source files follow the next steps
* cd into directory where the downloaded files are saved
```shell 
cd ~/Downloads
```
* Each one of downloadable theme files is distributed in the TarGZ file format, a type of archive
* The contents of the archive must be unzipped before the cursor files can be installed
```shell
tar xvf oreo_grey_cursors.tar.gz
```
* Once the files are unzipped from the TarGZ archive, it’ll appear in your folder

## Installing the cursor - Single-user
* Create a new folder in your home directory with name `.icons`.
* This is a special directory, viz recognized by OS
```shell
mkdir -p ~/.icons
```
* After creating the folder, use the `mv` command and place the Oreo Cursors files into the `~/.icons` directory
```shell
mv oreo_*/ ~/.icons/
```

## Installing the cursor - System-wide
Move the downloaded files to system recognized icons folder
```shell
mv oreo_*/ /usr/share/icons/
```

Now activate it using Genome Tweak tool or settings

# Setting up theme
