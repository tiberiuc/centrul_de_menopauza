# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Setup and Dependencies
- `mix setup` - Install and setup dependencies and build assets
- `mix deps.get` - Install dependencies only

### Development Server
- `mix phx.server` - Start Phoenix server at http://localhost:4000
- `iex -S mix phx.server` - Start server with interactive Elixir shell

### Testing
- `mix test` - Run all tests
- `mix test test/path/to/specific_test.exs` - Run specific test file
- `mix test --failed` - Run only previously failed tests

### Code Quality
- `mix precommit` - Run complete pre-commit checks (compile with warnings as errors, unlock unused deps, format, test)
- `mix format` - Format all Elixir code
- `mix compile --warning-as-errors` - Compile with strict warnings

### Assets
- `mix assets.setup` - Install Tailwind and esbuild if missing
- `mix assets.build` - Build CSS and JS assets for development
- `mix assets.deploy` - Build and minify assets for production

## Architecture Overview

This is a Phoenix 1.8 web application using:
- **Frontend**: LiveView with Tailwind CSS and esbuild
- **HTTP Client**: Req library (preferred over httpoison/tesla/httpc)
- **Email**: Swoosh with local adapter for development
- **Server**: Bandit adapter

### Key Modules Structure
- `Cmen` - Main application module and context
- `Cmen.Application` - OTP application supervisor tree
- `CmenWeb` - Web interface entry point with shared imports
- `CmenWeb.Endpoint` - Phoenix endpoint
- `CmenWeb.Router` - Route definitions
- `CmenWeb.Layouts` - Layout components (aliased in html_helpers)
- `CmenWeb.CoreComponents` - Reusable UI components

### Application Supervision Tree
The application starts these supervised processes:
1. `CmenWeb.Telemetry` - Metrics collection
2. `DNSCluster` - Service discovery
3. `Phoenix.PubSub` - Real-time communication
4. `CmenWeb.Endpoint` - HTTP server (last to start)

### Web Layer Organization
- All web modules use `CmenWeb` with specific roles (:controller, :live_view, :html, etc.)
- Shared imports and aliases are defined in `html_helpers/0` function
- `Layouts` module is pre-aliased for all templates and LiveViews
- Routes use Phoenix 1.8 verified routes with `~p` sigil

### Asset Pipeline
- **CSS**: Tailwind CSS v4.1.7 processes `assets/css/app.css` → `priv/static/assets/css/app.css`
- **JS**: esbuild v0.25.4 bundles `assets/js/app.js` → `priv/static/assets/js/` with ES2022 target
- Both tools configured to run from project root with proper Node.js path resolution

## Project-Specific Guidelines

Refer to AGENTS.md for comprehensive Phoenix, Elixir, LiveView, and HTML development guidelines including:
- Phoenix v1.8 specific patterns and components
- Elixir language conventions and common pitfalls
- LiveView streams, forms, and testing approaches
- HEEx template syntax and interpolation rules

Key points from project guidelines:
- Always use `mix precommit` before finishing changes
- Use Req library for HTTP requests (included by default)
- Follow Phoenix v1.8 LiveView patterns (no live_redirect/live_patch)
- Use LiveView streams for collections to avoid memory issues
- Always provide unique DOM IDs for forms and key elements
- This project does not use a database - avoid Ecto-related patterns