# Tidewater

A coastal and naval rebalance for **Sid Meier's Civilization VI**.

The sea is the cheapest part of the map to ignore. A harbor city pays for a district, three
buildings and the maintenance on all of them, and in exchange it works tiles that give food
and gold and nothing else — while every inland city gets production from hills it never had
to pay for. So most games end up with one harbor for the trade route and a navy that never
leaves port.

Tidewater does not add new toys. It reprices the ones that already exist so that going to
sea is an actual investment with an actual return.

- **Sea resources** — fishing boats are worth working from turn one.
- **Harbor chain** — the harbor buildings finally produce something.
- **Coastal growth** — the harbor chain houses the city that builds it.
- **Navy** — hulls and upkeep are cheaper across the board.

Pure data mod. No new art, no DLL, no UI rewrite, no new content to learn.

---

## What changes

Vanilla figures below are the base-game values; the mod applies its changes as additions, so
it behaves the same way on Rise and Fall and Gathering Storm even where the shipped numbers
differ by a point.

### Sea resources

| Improvement | Vanilla | Tidewater |
| --- | --- | --- |
| Fishing Boats | +1 Food, +0 Gold | **+2 Food, +1 Gold** |

Fishing boats sit on the sea resources that are supposed to make a coastal start good, and
in vanilla they pay one food until the late game hands out a gold. They now pay immediately.

### Harbor buildings

| Building | Cost | Housing | Yields |
| --- | --- | --- | --- |
| Lighthouse | 120 | 1 → **2** | unchanged (+1 Food, +1 Gold on coast tiles) |
| Shipyard | 290 → **260** | 0 → **1** | **+2 Production** (on top of the harbor adjacency copy) |
| Seaport | 580 → **520** | 1 → **2** | **+2 Production** (on top of +2 Food, +2 Gold on coast tiles) |

The shipyard was the strange one: the building that is supposed to industrialise the coast
only mirrors the harbor's adjacency bonus, which on a shallow map is one or two points. It now
gives a flat two production as well. The seaport gets the same treatment, later and larger.

### Harbor district

| District | Vanilla | Tidewater |
| --- | --- | --- |
| Harbor | 54 | **45** |

The harbor is the entry ticket to the whole tree, and it was priced like a Commercial Hub
without the trade route capacity.

### Navy

Every naval hull costs **15% less** to build and **1 less gold per turn** to maintain.
Naval civilians and great people are untouched; unique hulls (longship, jong, sea dog and
friends) are included.

| Unit | Cost | Upkeep |
| --- | --- | --- |
| Galley | 65 → **55** | 1 → **0** |
| Quadrireme | 120 → **102** | 2 → **1** |
| Caravel | 240 → **204** | 4 → **3** |
| Frigate | 280 → **238** | 5 → **4** |
| Privateer | 280 → **238** | 4 → **3** |
| Ironclad | 380 → **323** | 5 → **4** |
| Battleship | 430 → **365** | 6 → **5** |
| Submarine | 480 → **408** | 6 → **5** |
| Destroyer | 540 → **459** | 7 → **6** |
| Aircraft Carrier | 540 → **459** | 7 → **6** |
| Missile Cruiser | 680 → **578** | 8 → **7** |
| Nuclear Submarine | 680 → **578** | 8 → **7** |

A frigate costs as much as a musketman plus a builder, and then eats five gold a turn while
it waits in port for a war that may never come. That is the whole problem in one unit.

---

## Installation

1. Download `Tidewater-1.0.0.zip` from the release page.
2. Extract it so that the folder structure is
   `Documents/My Games/Sid Meier's Civilization VI/Mods/Tidewater/Tidewater.modinfo`.
   The zip already contains the `Tidewater` folder — do not flatten it.
3. Start the game, open **Additional Content**, enable **Tidewater**.
4. Start a new game, or load a save. The changes are applied when the gameplay database is
   rebuilt, so an existing save picks them up on the next load.

macOS: `~/Library/Application Support/Sid Meier's Civilization VI/Mods/`
Linux (Proton): `steamapps/compatdata/289070/pfx/drive_c/users/steamuser/Documents/My Games/Sid Meier's Civilization VI/Mods/`

## Compatibility

- **Game version:** final retail patch `1.0.12.9` (April 2021), ruleset `2.0`. The modinfo
  also lists `1.0.11.16` for players still on the previous patch.
- **Expansions:** works with the base game, Rise and Fall and Gathering Storm. Nothing here
  touches expansion-only tables, so the mod loads cleanly whichever set you own.
- **Other mods:** everything is additive — updates to existing rows plus guarded inserts.
  Nothing is deleted and no IDs are reused, so it stacks with other balance mods. If another
  mod also changes fishing boats or shipyard yields, the two changes add up.
- **Achievements:** data mods of this kind do not disable achievements in single player.
- **Multiplayer:** all players need the mod enabled, otherwise the game will desync on load.

## Files

```
Tidewater/
├── Tidewater.modinfo
├── Data/
│   └── Tidewater.sql              gameplay changes
├── Text/
│   ├── Tidewater_Text_en_US.sql   English description notes
│   └── Tidewater_Text_zh_Hans_CN.sql   简体中文描述补注
├── README.md
└── RELEASE.md
```

The description notes are appended with SQL rather than replacing the shipped strings, so the
mod keeps whatever wording the current ruleset uses and only adds its own line at the end.
That is also why the text files live under `Text/` but are loaded as database updates.

## Not in scope

Deliberately left alone, because they need a DLL or new art and this is a data mod:

- Harbor adjacency rules, trade route capacity, naval promotions.
- Coast tile base yields — changing those is a map-wide change, not a coastal one.
- Anything that would make the AI build more ships. It will still underbuild a navy; it will
  simply get slightly better value from the hulls it does build.

## License

Do what you like with it. Credit is nice, permission is not required. If you want to fold a
piece of this into your own mod, take it.
