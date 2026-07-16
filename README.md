# Virtual Office — docs & marketing site

A static, no-build-step site documenting every feature of Virtual Office, styled
to match the product's own default "Daylight" theme (same colour values as
`website/src/theme/themes.css`) rather than a generic template.

## Structure

```
index.html      landing / marketing page
features.html   every feature, one section each, with a real screenshot or a
                 clearly marked placeholder
style.css       the whole site's styling — one file, no build step
assets/
  screenshots/  real captures from the running app
  demo/         drop demo.mp4 here (see below)
```

## Viewing it

No build step — open `index.html` directly, or serve the folder:

```bash
npx serve .
```

## Adding the demo video

Drop a file at `assets/demo/demo.mp4`. The landing page's `<video>` element
already points at it — no HTML changes needed. Until the file exists, a
placeholder overlay shows instead of a broken player (checked via a `HEAD`
request in `index.html`'s closing `<script>`).

## Adding a missing screenshot

Some sections deliberately carry a `.shot-placeholder` card instead of an
image — grep `features.html` for `shot-placeholder` to find them. Each one
names the exact file path it expects; add the screenshot there and swap the
`<div class="shot-placeholder">…</div>` block for an `<img>` tag pointing at it
(see any other `.feature-media` block for the pattern).

## Updating a screenshot

Screenshots here are committed images, not generated at build time — if the UI
changes, recapture and overwrite the file in `assets/screenshots/`.
