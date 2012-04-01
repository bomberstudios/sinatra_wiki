# sinatra\_wiki

sinatra\_wiki is the minimal expression of a wiki.

It uses Sinatra.rb, and is being built as a learning experiment.

## Required gems
* rubygems
* sinatra
* erb
* rdiscount
* thin
* haml

## Other dependencies
* sinatra-cache submodule (git submodule update --init)

## Usage

    $ ruby sinatra_wiki.rb

Then open a browser in http://0.0.0.0:4567/

To create a page, just type the URL for it (the URL is the command line, baby :)

## License

This program is free software. It comes without any warranty,
to the extent permitted by applicable law. You can redistribute it
and/or modify it under the terms of the Do What The Fuck You Want
To Public License, Version 2, as published by Sam Hocevar. See
http://sam.zoy.org/wtfpl/COPYING for more details.