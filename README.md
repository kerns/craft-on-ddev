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

Make sure that `<YOUR PATH HERE>` is the location of a **new** or **existing and empty** folder.

### II. Configuring DDEV

You could skip this step if you're happy settling for the default domain, `https://craftcms.ddev.site`. But cool kidz don't settle for default domains. Demonstrate your commitment to this project by specifying a custom domain. Do so by running the following command from the root of the directory you just created:

```shell
ddev config
```

Follow the prompts.

-   **Project name:** e.g. `my-website` would result in a project URL of `https://my-website.ddev.site` (make note of this for later when you're setting up Craft)
-   **Docroot location:** defaults to `web` and should be kept as-is
-   **Project Type:** defaults to `php` and should be kept as-is

### III. Installing Craft

Finally, to install a clean version of Craft, run the following command and follow the prompts.

```shell
make install
```

This does the heavy lifting of spinning up and configuring a sane, Dockerized development environment running the latest version of Craft CMS. It also installs a selection of plugins for Craft as defined in `composer.json.default`. You can edit/expand this list however you like, just remember to mirror those choices in your `Makefile`.

**Pay special attention to the Craft installation prompts**. After setting the admin's account credentials, you'll be prompted for your desired site name and url.

Note that the url defaults to `https://craftcms.ddev.site`. If you ran `ddev config` and specified a custom name for your project (e.g. "my-project"), then the url of your project has been changed accordingly. Answer this prompt with that full url (😎 e.g. `https://my-website.ddev.site`).

_💡 If you're unclear or forgot to note the url, open another terminal window in the same directory and run `ddev describe`_

## Usage

### Start Vite and Get Coding

After your initial installation, to start Vite (for HMR and live reloading) simply run:

```shell
make serve
```

_💡 Run `ddev launch` to open the domain of your Craft project in your default browser. Like all project specific DDEV commands, it can be run from any location below your project's root directory._

Edit the default `index.twig` file in `templates/` to confirm that changes are being pushed to your browser.

### Rebuilding

There are reasons you may wish to rebuild your development environment from the ground up. For example, if you were to `git pull` changes that effected your `composer.json` or `package.json` files. Or after editing your `.ddev/config.yaml` file to swap in a different version of PHP. In short, anytime the dependencies or requirements of your project's environment have changed.

To do so run:

```shell
make dev
```

This command will:

1. Copy your local SSH keys into the right container (handy if you are setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/) or just want to shell into your project's container later with `ddev ssh` )
2. Start or re-start your DDEV project (a series of magically networked Docker containers)
3. Install or re-install the container's versions of Composer and npm, together with all their dependencies
4. Instruct Vite to perform a one-time build for production (output in `/web/dist`)
5. Finally, start a Vite dev server for HMR and live reloading 🎉

Subsequently, you can save some time just running `make serve` to fire up your Vite server.

### Bundling for Production

To build assets for use in production, stop your Vite server and run `make bundle`. You should run `make build` after pulling down changes that impact your project's dependencies.

### Useful Development Commands

-   `make serve` – Starts your Vite server for HMR and live reloading
-   `make bundle` – Bundles and exports assets for production (default location is `/web/dist/`)
-   `make dev` - Similar to `make serve`, but it fetches/rebuilds all dependencies and exports a production-ready bundle prior to starting your Vite server
-   `make build` - Similar to `make bundle`, but it fetches/rebuilds all dependencies prior to export and bundling
-   `make up` - Starts the DDEV project, ensuring that SSH keys have been added, and npm & Composer have been installed
-   `make install` - Runs a complete one-time process to set the project up and install Craft
-   `make composer <command>` - Run Composer commands inside the container, e.g. `make composer install`
-   `make craft <command>` - Run Craft commands inside the container, e.g. `make craft project-config/touch`
-   `make npm <command>` - Run npm commands inside the container, e.g. `make npm install`
-   `make pull` - Pull remote db & assets (requires setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/))

### Useful DDEV Commands

<code>ddev start</code>, <code>ddev stop</code>, <code>ddev restart</code>, <code>ddev import-db</code>, <code>ddev describe</code>, and <code>ddev poweroff</code> are among [the most useful ddev commands](https://ddev.readthedocs.io/en/latest/users/cli-usage/). They can be run from any directory below your project's root directory.

### Included Craft CMS Plugins

The following plugins are installed by default:

-   [Sprig](https://github.com/putyourlightson/craft-sprig)
-   [Vite](https://github.com/nystudio107/craft-vite)
-   [Template Comments](https://github.com/nystudio107/craft-templatecomments)
-   [Postmark](https://plugins.craftcms.com/postmark)

You could edit your `composer.json.default` prior to running `make install` to add or remove plugins to your installation – just remember to mirror those choices in your `Makefile`.

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
