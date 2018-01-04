## Docker based HUGO static site engine

> Docker based container image of the [HUGO](http://gohugo.io) static site generator. Provides a quick way to develop with the HUGO platform.

More about Hugo: http://www.gohugo.io/

I uses Hugo for my personal blog [joshuabradley.io](https://joshuabradley.io/). The image is  basically to fulfill my automated publishing process, but you're welcome to source via github.

## Running

This is a simplistic example of how to call the hugo executable:

    docker run --rm -ti joshuabradley/hugo help

To make it really useful, you'll need to mount the current directory to the container, so hugo can write files:

    docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) joshuabradley/hugo new site ./site

To make the command a bit more accessible, create an alias. Note that we add the `-p` option here to make hugo's HTTP port 1313 available.

    alias myhugo="docker run --rm -ti -v $(pwd):$(pwd) -w $(pwd) -p 1313:1313 joshuabradley/hugo"

Then we can call hugo like this:

    # Creating a new site in folder ./site
    myhugo new site ./site

    # Serve using hugo's built-in server
    # (use your currect Docker IP address in the baseUrl)
    myhugo server --theme=hyde --baseUrl=http://192.168.59.103 --bind=0.0.0.0 -s ./site

    # Generate public files and exit
    myhugo --theme=hyde --baseUrl=http://192.168.59.103 -s ./site

## Build your own

To build your own image, do this:

    docker build -t joshuabradley/hugo .
