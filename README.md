# Craft on DDEV

**Dockerized local development for Craft CMS, pre-configured with Vite and built on DDEV.**

## Features

-   [DDEV](https://ddev.com/get-started/) for local development in a Docker setup that just works
-   [Vite](https://vitejs.dev/) for HMR with live reloading in development, and asset optimization bundling for production
-   [Tailwind 3.x](https://tailwindcss.com) for utility-first CSS and [Alpine](https://alpinejs.dev/) for lightweight reactivity

## Installation

### I. Getting Started

Make sure you have installed [Docker](https://www.docker.com/), [DDEV](https://ddev.com/) and [Composer](https://getcomposer.org/) before continuing.

-   Docker Desktop - Visit [docker.com/get-started](https://www.docker.com/get-started)
-   DDEV - Visit [ddev.com/get-started/](https://ddev.com/get-started/)
-   Composer - You could visit [getcomposer.org/](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos) but if you're using macOS and already running Homebrew, simply run `brew install composer`.

With that behind you, open a terminal prompt and run:

```shell
composer create-project kerns/craft-on-ddev <YOUR PATH HERE> --no-install && cd <YOUR PATH HERE>
```

Make sure that `<YOUR PATH HERE>` is the location of a **new** or **existing and empty** directory.

Though not a requirement, it would be a good idea (and allow you to skip Step 2) if you named this directory after your desired DDEV subdomain. For example, a directory named `my-website` would be pre-configured to use `https://my-website.ddev.site` in Step 3.


### II. Configure DDEV (Optional)

You can skip this step if the name of your root directory matches your desired DDEV subdomain.

If you need your local DDEV domain to be different from the name of this project's root directory, run the following command from inside said directory:

```shell
ddev config
```

Follow the prompts.

-   **Project name:** `my-test-site` would establish a project URL of `https://my-test-site.ddev.site`
-   **Docroot location:** defaults to `web`, should be kept as-is
-   **Project Type:** defaults to `php`, should be kept as-is

### III. Install

To install Craft, Vite and a few supporting plugins run the following command and follow the prompts.

```shell
make install
```

This builds a sane, Dockerized development environment running the latest version of Craft CMS. It also installs a selection of plugins for Craft as defined in `composer.json.default`. You can edit/expand this list however you like, just remember to mirror those choices in your `Makefile` prior to running `make install`.

**Pay special attention to the Craft installation prompts**. After setting the admin's account credentials, you'll be prompted for your desired site name and url.

The **Site name** can be anything, can include spaces and capital letters, and doesn't need to correspond to your project's root folder name or DDEV domain.

The **Site url** If for some reason the suggested default isn't acceptable, answer the prompt for a url with the full url (😎 e.g. `https://my-website.ddev.site`)

_💡 If you're unclear about the url of your project open another terminal window in the same directory and run `ddev describe`.

## Usage

### Development

Start Vite for HMR and live reloading with:

```shell
make dev
```

Edit the default `index.twig` file in `templates/` to confirm that changes are being pushed to your browser.

_💡 Run `ddev launch` to open the domain of your Craft project in your default browser. Like all project specific DDEV commands, it can be run from any location below your project's root directory._


### Building for Production

Generate a production ready build of your site with:


```shell
make build
```

Bundles and exports assets for use in production (default location is `/web/dist/`).

### Other Makefile Commands

-   `make up` - Confirms your DDEV project is running. Rebuilds the containers and pushes over your SSH credentials if needed.
-   `make install` - Runs a complete one-time process to set the project up and install Craft
-   `make composer <command>` - Run Composer commands inside the container, e.g. `make composer install`
-   `make craft <command>` - Run Craft commands inside the container, e.g. `make craft project-config/touch`
-   `make npm <command>` - Run npm commands inside the container, e.g. `make npm install`
-   `make pull` - Pull remote db & assets (requires setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/))

### Useful DDEV Commands

<code>ddev start</code>, <code>ddev stop</code>, <code>ddev restart</code>, <code>ddev import-db</code>, <code>ddev describe</code>, and <code>ddev poweroff</code> are among [the most useful commands available when using DDEV](https://ddev.readthedocs.io/en/latest/users/cli-usage/). They can be run from any directory below your project's root directory.

### Included Craft CMS Plugins

The following plugins are installed by default:

-   [Vite](https://github.com/nystudio107/craft-vite)
-   [Template Comments](https://github.com/nystudio107/craft-templatecomments)
-   [Postmark](https://plugins.craftcms.com/postmark)

To add or remove plugins to your installation edit your `composer.json` prior to running `make install`. Remember to mirror those choices in `Makefile`.

_💡Note that some plugins require an additional configuration file be added to your `/config` directory._

### Included Tailwind Plugins

-   [Aspect Ratio](https://github.com/tailwindlabs/tailwindcss-aspect-ratio)
-   [Line Clamp](https://github.com/tailwindlabs/tailwindcss-line-clamp)
-   [Typography](https://github.com/tailwindlabs/tailwindcss-typography)
-   [Forms](https://github.com/tailwindlabs/tailwindcss-forms)

### Included Javascript Libraries

-   [AlpineJS](https://alpinejs.dev/)
-   [Lazysizes](https://afarkas.github.io/lazysizes/)

## Roadmap

-   ~~Tailwind 3~~
-   ~~Thin out the plugins~~
-   ~~Bump php, mariadb + node~~
-   ~~Include most useful DDEV commands~~
-   Improve default error page layouts

## Acknowledgements & Credits

Based on 1DR's excellent [Craft CMS Starter](https://github.com/onedarnleyroad/craftcms). Please read [1DR's credits](https://github.com/onedarnleyroad/craftcms#acknowledgements--credits)! Landing page bg courtesy [svgbackgrounds.com](https://svgbackgrounds.com/svgbackgrounds.com) and [@MattVisiwig](https://twitter.com/MattVisiwig) 🙏.
