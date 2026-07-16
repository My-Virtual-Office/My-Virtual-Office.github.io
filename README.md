<h1 align="center">Virtual Office</h1>

<p align="center">
  <b>One workspace. Not five disconnected tools.</b><br>
  Chat, tasks, meetings, an AI assistant, and a real-time 2D office you can walk into —
  on web, mobile, and a place your team actually inhabits.
</p>

<p align="center">
  <a href="https://my-virtual-office.github.io"><b>→ Live site</b></a>
</p>

---

This repository is the product's **documentation & marketing site** — deployed to
[my-virtual-office.github.io](https://my-virtual-office.github.io) on every push to `main`.

Every screenshot on it is the **real running product**, captured from a seeded workspace
of 15 people across 6 teams with three months of history — nothing is a mockup, and every
architecture diagram is generated from source, not drawn by hand.

## What's inside

- **Landing page** — what Virtual Office is, and who it's for.
- **16 feature chapters** — 12 product, 4 architecture — each one screenshot- or
  diagram-led, one topic at a time.
- **The backend, honestly** — nine microservices, one gateway, database-per-service,
  E2E-encrypted DMs, and the trade-offs stated plainly rather than hidden.

## The product it documents

| | |
|---|---|
| **Backend** | 9 Spring Boot services · Spring Cloud Gateway · PostgreSQL · MongoDB · MySQL · Redis · RabbitMQ |
| **Web** | React · STOMP over WebSocket · E2E-encrypted DMs (ECDH + AES-GCM in the browser) |
| **2D office** | Phaser + Colyseus · proximity voice via Agora |
| **Mobile** | Flutter — the whole workspace, one gateway, no separate backend |
| **Ops** | Docker Compose · Grafana · Loki · Prometheus · `docker compose up` and it runs |

## Running this site locally

No build step — it's static HTML, CSS, and pre-rendered SVG.

```bash
npx serve .          # or just open index.html
```

## Regenerating assets

```bash
./build-diagrams.sh  # diagrams/*.mmd → assets/diagrams/*.svg (needs mermaid-cli)
```

Screenshots are committed images captured from the running app; replace the file in
`assets/screenshots/` to update one.

## Deployment

`.github/workflows/deploy.yml` publishes the site to GitHub Pages on every push to `main`.
The repo root **is** the site — there is no build stage to break.
