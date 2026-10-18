# Module and Beacon Config

Fully customize vanilla **beacons** and **modules** (Factorio 2.1, optional Quality/Space Age support).
Originally by Bunshaman; now maintained for 2.1.

## Beacons

- Choose which effects beacons are allowed to transmit: speed, efficiency, productivity, pollution (and
  quality with the Quality mod).
- Force any effect onto all recipes (`everywhere` / `nowhere` / `unchanged`).
- Reshape the vanilla beacon: distribution effectivity (plus bonus per quality level), supply area
  distance, module slots, and distribution profile (default / overload / overload-non-exclusive / custom).

## Modules

- Set the **maximum tier** of each module type (speed, efficiency, productivity, quality) up to 255.
- Control **how each effect scales with tier** per module type: disabled, linear, constant, fibonacci,
  exponential or polynomial extrapolation, with editable per-tier value lists (e.g. Efficiency Module
  100's, exponential speed modules, productivity in beacons).
- Per-effect engine caps: configurable upper/lower limits clamp the summed module+beacon effects on
  recipes and machines (defaults match vanilla engine caps, so nothing changes unless edited).

## Crafting & technology

- Modules per recipe / per result, crafting time, technology time and a formula for science cost
  (e.g. `100*L^2`).
- Space Age: module tiers 1-3 craft in the electromagnetic plant (tier 4+ already could).

## GUI options

- Extra module inventory tab, numbered tier icons on modules and in beacons, alt-mode module display.

## Compatibility

- Factorio **2.1**; optional dependencies: `quality`, `space-age` (quality settings and recipes only
  appear with the Quality mod).

## License

MIT — see [LICENSE](LICENSE).
