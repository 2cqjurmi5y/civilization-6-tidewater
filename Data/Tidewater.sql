-- ===========================================================================
--  Tidewater 1.0.0
--  Coastal & naval rebalance for Civilization VI
--
--  Design notes
--  ------------
--  The sea is the cheapest part of the map to ignore. A harbor city pays a
--  district, three buildings and a maintenance bill, and in return it works
--  tiles that give food and gold and nothing else - while every land city
--  gets production from hills it did not have to pay for. The result is that
--  maritime play is a hobby, not a strategy.
--
--  Tidewater does not add new toys. It reprices the ones that already exist
--  so that going to sea is a real investment with a real return:
--
--    1. Sea resources  - fishing boats are worth working from turn one.
--    2. Harbor chain   - the harbor buildings finally produce something.
--    3. Coastal growth - the harbor chain houses the city that builds it.
--    4. Navy           - hulls and upkeep are cheaper across the board.
--
--  Every statement is additive and defensive:
--   *  UPDATE hits existing rows and does nothing if the row is absent.
--   *  New rows are added with "INSERT ... WHERE NOT EXISTS", never with a
--      blind INSERT, so a duplicate can not be created on any ruleset.
--   *  Nothing is deleted, so the mod stacks on top of other balance mods
--      instead of fighting them.
-- ===========================================================================


-- ---------------------------------------------------------------------------
--  1. SEA RESOURCES
--     Fishing Boats: +1 Food, +1 Gold (on top of the ruleset value).
--     Vanilla is +1 Food and no gold until much later, which is why nobody
--     works a crab tile in the first fifty turns.
-- ---------------------------------------------------------------------------

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange + 1
WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS' AND YieldType = 'YIELD_FOOD';

INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange)
SELECT 'IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 1
WHERE NOT EXISTS (
	SELECT 1 FROM Improvement_YieldChanges
	WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS' AND YieldType = 'YIELD_FOOD'
);

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange + 1
WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS' AND YieldType = 'YIELD_GOLD';

INSERT INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange)
SELECT 'IMPROVEMENT_FISHING_BOATS', 'YIELD_GOLD', 1
WHERE NOT EXISTS (
	SELECT 1 FROM Improvement_YieldChanges
	WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS' AND YieldType = 'YIELD_GOLD'
);


-- ---------------------------------------------------------------------------
--  2. THE HARBOR CHAIN PRODUCES
--     Shipyard: +2 Production. In vanilla the shipyard only mirrors the
--     harbor adjacency bonus, which is usually one or two points, so the
--     building that is supposed to industrialise the coast does almost
--     nothing on a map with shallow water.
--     Seaport: +2 Production, same reasoning, later in the game.
-- ---------------------------------------------------------------------------

UPDATE Building_YieldChanges
SET YieldChange = YieldChange + 2
WHERE BuildingType = 'BUILDING_SHIPYARD' AND YieldType = 'YIELD_PRODUCTION';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange)
SELECT 'BUILDING_SHIPYARD', 'YIELD_PRODUCTION', 2
WHERE NOT EXISTS (
	SELECT 1 FROM Building_YieldChanges
	WHERE BuildingType = 'BUILDING_SHIPYARD' AND YieldType = 'YIELD_PRODUCTION'
);

UPDATE Building_YieldChanges
SET YieldChange = YieldChange + 2
WHERE BuildingType = 'BUILDING_SEAPORT' AND YieldType = 'YIELD_PRODUCTION';

INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange)
SELECT 'BUILDING_SEAPORT', 'YIELD_PRODUCTION', 2
WHERE NOT EXISTS (
	SELECT 1 FROM Building_YieldChanges
	WHERE BuildingType = 'BUILDING_SEAPORT' AND YieldType = 'YIELD_PRODUCTION'
);


-- ---------------------------------------------------------------------------
--  3. COASTAL GROWTH
--     The harbor chain now houses the people who work it:
--     Lighthouse +1 Housing, Shipyard +1 Housing, Seaport +1 Housing.
--     A coastal capital has almost no farmland; without this it stalls at
--     six or seven population while an inland city with the same districts
--     keeps growing.
-- ---------------------------------------------------------------------------

UPDATE Buildings
SET Housing = IFNULL(Housing, 0) + 1
WHERE BuildingType IN ('BUILDING_LIGHTHOUSE', 'BUILDING_SHIPYARD', 'BUILDING_SEAPORT');


-- ---------------------------------------------------------------------------
--  4. THE PRICE OF A HARBOR
--     Harbor district base cost is trimmed, and the two big buildings in it
--     get cheaper. The district is the entry ticket to the whole tree, and
--     the entry ticket was priced like a Commercial Hub with none of the
--     trade route capacity.
-- ---------------------------------------------------------------------------

UPDATE Districts
SET Cost = Cost - 9
WHERE DistrictType = 'DISTRICT_HARBOR' AND Cost > 9;

UPDATE Buildings
SET Cost = Cost - 30
WHERE BuildingType = 'BUILDING_SHIPYARD' AND Cost > 30;

UPDATE Buildings
SET Cost = Cost - 60
WHERE BuildingType = 'BUILDING_SEAPORT' AND Cost > 60;


-- ---------------------------------------------------------------------------
--  5. THE NAVY
--     Every naval hull costs 15% less to build and 1 less gold per turn to
--     keep. A frigate in vanilla costs as much as a musketman plus a
--     builder, and then eats five gold a turn while sitting in port waiting
--     for a war that may never come.
--
--     The filter is the formation class, so naval civilians and great people
--     are untouched, and unique hulls (longship, jong, sea dog...) are
--     included because they are naval units too.
-- ---------------------------------------------------------------------------

UPDATE Units
SET Cost = CAST(Cost * 0.85 AS INTEGER),
	Maintenance = MAX(IFNULL(Maintenance, 0) - 1, 0)
WHERE FormationClass = 'FORMATION_CLASS_NAVAL' AND Cost > 0;


-- ---------------------------------------------------------------------------
--  End of Tidewater 1.0.0
-- ---------------------------------------------------------------------------
