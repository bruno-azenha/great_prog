# GreatProg

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Deployment with Fly.io

This project is configured to deploy on [Fly.io](https://fly.io). Here are key commands for managing the deployment:

### Initial Setup

```bash
# Install flyctl if you haven't already
curl -L https://fly.io/install.sh | sh

# Login to your Fly.io account
fly auth login

# Launch the app (first time only)
fly launch
```

### Deployment Commands

```bash
# Deploy your application
fly deploy

# View deployment status
fly status

# View application logs
fly logs

# Connect to the production console
fly ssh console -C "/app/bin/great_prog remote"

# Run migrations
fly ssh console -C "/app/bin/great_prog eval \"Release.migrate\""

# View application metrics
fly metrics

# SSH into the VM
fly ssh console

# Check the configuration
fly config show
```