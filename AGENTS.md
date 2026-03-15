# TreehouseGen

Phoenix LiveView application (Elixir). No database, no Node.js required.

## Cursor Cloud specific instructions

### Runtime versions

Erlang and Elixir versions are pinned in `.tool-versions` and managed via `mise`. The VM snapshot has `mise` pre-installed and activated in `~/.bashrc`.

### Key commands

| Task | Command |
|---|---|
| Install deps + build assets | `mix setup` |
| Start dev server (port 4000) | `mix phx.server` |
| Run tests | `mix test` |
| Format check | `mix format --check-formatted` |
| Compile (strict) | `mix compile --warnings-as-errors` |
| Pre-commit suite | `mix precommit` (format + compile + test) |

### Notes

- The dev server binds to `127.0.0.1:4000` by default.
- Asset watchers (esbuild, tailwind) start automatically with `mix phx.server`.
- The `watchman: not found` warning on server start is benign — Phoenix falls back to polling for file changes.
- LiveDashboard is available at `/dev/dashboard` in dev mode.
- There is no database; no migrations or DB setup needed.
- Git hooks path is set to `.githooks/` via `mix hooks.install` (part of `mix setup`).
