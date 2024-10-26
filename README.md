# Tailored ✨👗

**Tailored** is a modern Rails application for fashion enthusiasts and professional stylists. It helps users curate,
organize, and share their wardrobe, offering features like virtual wardrobe management, outfit planning, and
collaborative styling tools. Built using **Hotwire** (Turbo + Stimulus), **Tailored** offers a fast, responsive, and
smooth user experience.

## Features
- 🛍 **Wardrobe Management**: Easily upload and categorize wardrobe items.
- 👗 **Outfit Planning**: Create outfits using wardrobe items and share them.
- 📷 **Bulk Upload**: Quickly upload multiple images and manage them asynchronously.
- 👫 **Professional Mode**: Stylists and fashion pros can collaborate with clients using pro features like shared outfits and personalized style advice.
- 🎨 **Styling Suggestions**: AI-based color analysis and fashion recommendations.
- 📆 **Event Planning**: Plan outfits for special occasions, seasons, or events.
- 💬 **Collaboration**: Share wardrobe items and outfits with others.
- 📈 **Analytics & Insights**: Track your most worn pieces and get insights into your style.

## Technologies

### Core Stack
- Rails 7.0 (API + Full-stack)
- Hotwired (Turbo + Stimulus) for frontend interactivity
- PostgreSQL as the primary database
- Redis for ActionCable
- ActiveStorage for image uploads (S3 compatible)
- Stimulus.js with Tailwind CSS for UI

### Additional Tools
- Stripe: For handling payments and subscriptions.
- Honeybadger: For error tracking and logging.
- Devise: For user authentication.
- Pundit: For authorization.
- Pagy: For pagination.

## Getting Started

### Prerequisites
To set up **Tailored**, ensure you have the following:

* **Ruby**: 3.2+
* **PostgreSQL**: 12+
* **Redis**: For ActionCable support and caching
* **Node.js**: v20+
* **Yarn**: For managing JavaScript dependencies
* **Imagicmagick or Libvips**: For image processing via ActiveStorage (`brew install vips imagemagick`)
* [Overmind](https://github.com/DarthSim/overmind) or Foreman - `brew install tmux overmind` or `gem install foreman` - helps run all your processes in development
* [Stripe CLI](https://stripe.com/docs/stripe-cli) for Stripe webhooks in development - `brew install stripe/stripe-cli/stripe`

If you use Homebrew, dependencies are listed in `Brewfile` so you can install them using:

```bash
brew bundle install --no-upgrade
```

Then you can start the database servers:

```bash
brew services start postgresql
brew services start redis
```

### Development Installation

1. **Clone the repository**:
```bash
git clone https://github.com/meaganewaller/tailored.git
cd tailored
```

2. **Install dependencies**:

Run `bin/setup` to install Ruby and JavaScript dependencies and setup your database.

```bash
bin/setup
```

3. **Configure environment variables**: Rename the `.env.erb.example` file to `.env.erb` and set the necessary
   environment variables

4. ##Run the server**:

To run your application, you'll use the `bin/dev` command:

```bash
bin/dev
```

This starts up Overmind (or Foreman) running the processes defined in `Procfile.dev`. We've configured this to run the Rails server, CSS bundling, and JS bundling out of the box. You can add background workers like GoodJob, the Stripe CLI, etc to have them run at the same time.

### Running Tests
To run the test suite, simply execute:

```bash
bin/rails test
bin/rails test:system
```

### Background Jobs
Tailored uses **GoodJob** for background job processing. We kick it off in the `Procfile.dev` with `bundle exec good_job
start`.

## Roadmap

- Add AI-based **Style Recommendations** based on wardrobe content.
- Implement a **Fashion Insights Dashboard**
- **Outfit Sharing** to social platforms like Instagram, Pinterest, LTK, etc
- Add **Customizable Closet Categories** for premium users
- Introduce **Collaborative Mode** for team and professional use.

## Acknowledgments

- Thanks to the Rails and Hotwire community
- Special thanks to Jumpstart Pro for the boilerplate.
