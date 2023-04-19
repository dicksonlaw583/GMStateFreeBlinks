# State-Free Blinks

This GameMaker Studio 2022 project contains utility functions for various blinking animations and a demo of these functions.

## Requirements

GameMaker Studio 2022.1 or above. 2022 LTS and 2.3.7+ are also supported.

## Installation

For the library that you can import into your project, get the installation packages [here](https://www.github.com/dicksonlaw583/GMStateFreeBlinks/releases).

For the demo, clone this repository and run it in GameMaker Studio.

## How to Use

**Example 1:** Flashing the current sprite colour blend between white and red

```gml
image_blend = merge_colour(c_white, c_red, blink_cos());
```

**Example 2:** Drawing flashing text

```gml
draw_text_colour(x, y, "WARNING!", c_red, c_red, c_maroon, c_maroon, blink_camel());
```

Please see [this article](https://forum.gamemaker.io/index.php?threads/state-free-blinks.102930/) for a full description of the included functions.
