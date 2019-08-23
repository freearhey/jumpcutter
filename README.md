# jumpcutter
Automatically edits videos. Explanation here: https://www.youtube.com/watch?v=DQ8orIurGxw

## Usage

### Basic

```sh
python jumpcutter.py --input_file test.mp4 --output_file test.alter.mp4 --sounded_speed 1 --silent_speed 999999 --frame_margin 2 --frame_rate 24
```

### With splitting

```sh
echo 00:10:00 | ./jumpcutter.sh --input_file test.mp4 --output_file test.alter.mp4 --sounded_speed 1 --silent_speed 999999 --frame_margin 2 --frame_rate 24
```

## Some heads-up:

It uses Python 3.

It works on Ubuntu 16.04 and Windows 10. (It might work on other OSs too, we just haven't tested it yet.)

This program relies heavily on ffmpeg. It will start subprocesses that call ffmpeg, so be aware of that!

As the program runs, it saves every frame of the video as an image file in a
temporary folder. If your video is long, this could take a LOT of space.
I have processed 17-minute videos completely fine, but be wary if you're gonna go longer.

I want to use pyinstaller to turn this into an executable, so non-techy people
can use it EVEN IF they don't have Python and all those libraries. Jabrils 
recommended this to me. However, my pyinstaller build did not work. :( HELP

## Building with nix
`nix-build` to get a script with all the libraries and ffmpeg, `nix-build -A bundle` to get a single binary.
