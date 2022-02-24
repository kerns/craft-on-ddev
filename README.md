## Craft on DDEV

Forked from 1DR's [Craft CMS Starter](https://github.com/onedarnleyroad/craftcms#acknowledgements--credits)

Uses DDEV for local hosting and Vite for front-end bundling and HMR/Live Reload.

## Features:

- [DDEV](https://ddev.com/get-started/) for local development with Docker that doesn't feel insane
- [Vite](https://vitejs.dev/) for HMR / Live reloading and bundling for production
- [Tailwind 3.x](https://tailwindcss.com) for utility-first CSS
- [Alpine](https://alpinejs.dev/) for lightweight reactivity
- [DeployHQ](https://www.deployhq.com/) for automated deployment
- [Postmark](https://postmarkapp.com/) for email delivery
- [Makefile](https://www.gnu.org/software/make/manual/make.html) for common CLI commands

## Requirements:

1. [Docker](https://www.docker.com/)
2. [DDEV](https://ddev.com/)
3. [Composer](https://getcomposer.org/)

## Getting Started

Assuming you have [Composer](https://getcomposer.org/) installed on your local machine,
you can use the `create-project` command to setup a new development site.

If you don't have composer, [get composer](https://getcomposer.org/). Mac users running Homebrew can simply run `brew install composer`. With that behind you, open a terminal prompt and run:

```shell
composer create-project kerns/craft-on-ddev <YOUR PATH HERE> --no-install
```

Make sure that `<YOUR PATH HERE>` is the location of a **new** or **existing and empty** folder.
 

## Configuring DDEV (Optional)

You can skip this step if you're happy using the default domain, `https://craftcms.ddev.site`. But don't be happy with the default domain. If you're serious about this project dream up a better test domain and specify it by running:

```shell
ddev config
```

Follow the prompts.

- **Project name:** e.g. `boss-website` would result in a project URL of `https://boss-website.ddev.site` (make note of this for later when you're setting up Craft)
- **Docroot location:** defaults to `web` and should be kept as-is
- **Project Type:** defaults to `php` and should be kept as-is

## Installing Craft

Finally, to install a clean version of Craft, run the following command and follow the prompts.

```shell
make install
```

This will do all the heavy lifting of spinning up and configuring a sane, Dockerized development environment tuned with a new version of Craft.

Part of that tuning involved installing a raft of different plugins as defined in `composer.json.default`. You can edit/expand this list however you like, just remember to mirror those decisions in your `Makefile`.

Pay special attention to the Craft installation prompts. After setting the admin's account credentials, you'll be prompted for your desired site name and url.

`<image>`

Note that the url defaults to `https://craftcms.ddev.site`, making the assumption that you did not run `ddev config` to specify a custom name for your project. Remember to update this with the full and correct url if you did ran `ddev config` and specified a custom name. (for ex. `https://boss-website.ddev.site`).

(💡: If you forgot the name open another terminal window in the same directory and run `ddev describe`.)

Once the process is complete, type `ddev launch` to open the project in your default browser. 🚀

## Local Development with Vite

To begin development with Vite's dev server & HMR run:

```shell
make dev
```

This command will:

1. Copy your local SSH keys into the container (handy if you are setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/) or just want to shell into your project's container with `ddev ssh` )
2. (Re)Start your DDEV project (a series of networked Docker containers)
3. (Re)Install Composer and npm, together with their dependencies
4. Do a one-time build of Vite, and start your Vite dev server

Edit code in `src/` or `templates/` to confirm that changes are being pushed to your browser. (💡: `ddev launch` opens a browser pointed to the domain of your Craft project. It works from any location your project's root directory.)

Subsequently, you can save some time just running `ddev exec npm run serve` to initiate your Vite dev server, but after a `git pull` or other big changes to the codebase you'll want to re-run `make dev`.

Similarly, to build assets for use in production, stop your Vite server and run `ddev exec npm run build`. But run `make build` periodically or after pulling down major changes.


## Makefile

A Makefile has been included to provide a unified CLI for common development commands.

- `make install` - Runs a complete one-time process to set the project up and install Craft.
- `make up` - Starts the DDEV project, ensuring that SSH keys have been added, and npm & Composer have been installed.
- `make dev` - Runs a one-time build of all front-end assets, then starts Vite's server for HMR and live reloading.
- `make build` - Builds all front-end assets.
- `make composer xxx` - Run Composer commands inside the container, e.g. `make composer install`
- `make craft xxx` - Run Craft commands inside the container, e.g. `make craft project-config/touch`
- `make npm xxx` - Run npm commands inside the container, e.g. `make npm install`
- `make pull` - Pull remote db & assets (requires setting up [craft-scripts](https://github.com/nystudio107/craft-scripts/)

## Craft CMS Plugins

[Vite](https://github.com/nystudio107/craft-vite) and [Postmark](https://plugins.craftcms.com/postmark) are the only two plugins installed by default. You can expand this list in `composer.json.default`, but if you do not remember to mirror those changes in your `Makefile`, you will need to install them in Craft manually after logging in.


## Tailwind Plugins

1. [Aspect Ratio](https://github.com/tailwindlabs/tailwindcss-aspect-ratio)
1. [Line Clamp](https://github.com/tailwindlabs/tailwindcss-line-clamp)
1. [Typography](https://github.com/tailwindlabs/tailwindcss-typography)
1. [Forms](https://github.com/tailwindlabs/tailwindcss-typography) (* Beta)

## Javascript Libraries

1. [AlpineJS](https://alpinejs.dev/)
1. [Lazysizes](https://afarkas.github.io/lazysizes/)


## Roadmap
- Tailwind 3
- Thin out the plugins
- Add some more commands
- Improve default typography
- Add some basic user management


## Acknowledgements & Credits

Please read [1DR's credits](https://github.com/onedarnleyroad/craftcms#acknowledgements--credits)
