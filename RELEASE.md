# Tidewater 1.0.0

**A coastal and naval rebalance for Civilization VI.** Pure data mod — no new art, no DLL,
works with the base game, Rise and Fall and Gathering Storm.

---

## Why

Every Civ VI map has an ocean, and almost every game ignores it. The reason is not that naval
units are weak — a frigate battery is terrifying. The reason is that the coast never pays back
what it costs.

Look at what a harbor city buys: a district, a lighthouse, a shipyard, a seaport, and the
upkeep on all of it. Look at what it gets: coast tiles that give food and gold, a shipyard that
only copies the harbor's adjacency bonus (one or two points on a shallow map), and a city that
stalls at seven population because there is no farmland. Meanwhile the inland city next door
gets production from hills it never paid for, and grows on farms that cost a builder charge.

So players build one harbor for the trade route, park a couple of caravels in it, and go back
to playing a land game. Tidewater reprices the coast so that decision is no longer automatic.

## What it does

**Sea resources pay from turn one.** Fishing Boats go from +1 Food / +0 Gold to **+2 Food /
+1 Gold**. The resources are rare and contested; working them should beat working a plain
farm, and now it does.

**The harbor chain produces.** The **Shipyard** gains a flat **+2 Production** on top of the
harbor adjacency copy and drops from 290 to **260** production. The **Seaport** gains the same
**+2 Production** and drops from 580 to **520**. The building that is supposed to industrialise
the coast now actually does.

**Coastal cities can grow.** **+1 Housing** on the Lighthouse, the Shipyard and the Seaport.
Three extra housing is the difference between a harbor capital that plateaus and one that keeps
climbing.

**The harbor is cheaper to enter.** District base cost 54 → **45**. It was priced like a
Commercial Hub without the trade route capacity.

**The navy is affordable.** Every naval hull is **15% cheaper** to build and **1 gold cheaper
per turn** to maintain. Galley 65 → 55 and free to keep. Frigate 280 → 238, upkeep 5 → 4.
Destroyer 540 → 459, upkeep 7 → 6. Battleship 430 → 365. Unique hulls included; naval
civilians and great people untouched.

Full numbers, including the complete hull table, are in the README.

## Install

1. Download `Tidewater-1.0.0.zip` below.
2. Extract into `Documents/My Games/Sid Meier's Civilization VI/Mods/` so you end up with
   `Mods/Tidewater/Tidewater.modinfo`. The zip already contains the `Tidewater` folder.
3. Enable **Tidewater** in Additional Content.
4. New game or existing save — the changes apply the next time the gameplay database loads.

## Compatibility

- Game version `1.0.12.9` (final retail patch), ruleset `2.0`. `1.0.11.16` is also listed.
- Base game, Rise and Fall and Gathering Storm.
- Additive by design: existing rows are updated, new rows are guarded with
  `WHERE NOT EXISTS`, nothing is deleted and no IDs are reused. It stacks with other balance
  mods; where two mods touch the same number, the changes add up.
- Multiplayer requires every player to have the mod enabled.

## Changelog

### 1.0.0

- Fishing Boats: +1 Food, +1 Gold.
- Lighthouse: +1 Housing.
- Shipyard: +2 Production, +1 Housing, cost 290 → 260.
- Seaport: +2 Production, +1 Housing, cost 580 → 520.
- Harbor district: cost 54 → 45.
- All naval units: cost −15%, maintenance −1.
- English and Simplified Chinese description notes for every changed object.

## Roadmap

Not promised, but the direction if this gets a 1.1:

- A look at the Privateer line, which is the only naval class with no upgrade path worth the
  production.
- Harbor adjacency, which needs more than SQL.
- Something for the AI, which will keep underbuilding navies no matter how cheap hulls get.

Bug reports and number complaints are welcome in the issues tab. If a figure feels wrong on
your difficulty and map size, say which — the numbers were tuned on standard speed,
continents, emperor.
