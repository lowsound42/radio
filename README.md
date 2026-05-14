# Personal radio

This is just a way to save radio channel urls as I find 'em.

To get this to work:
- Clone the repo
- Use my existing `stations.txt` file or add/edit as required (stations are entered as `name | url`)
- Install `mpv` [mpv](https://mpv.io)
- Make the `radio.sh` script executable with `chmod +x /path/to/radio/sh`.
- Create a folder called `$HOME/.config/omaradio` (call it whatever you want, but make sure to change radio.sh to work with the new name)
- Create a symlink to the stations.txt file `ln -s "path/to/stations.txt" ~/.config/omaradio/stations.txt`
- Run `/path/to/radio.sh` and enjoy

Alternatively you could make it accessbile globally:
- `sudo cp "/path/to/radio.sh" /usr/local/bin/omarradio` (again call the file what you want)
- `sudo chmod +x /usr/local/bin/omaradio`
- run it with `omaradio` (or whatever you called it)
