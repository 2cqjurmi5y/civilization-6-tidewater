-- ===========================================================================
--  Tidewater 1.0.0 - English text
--
--  The descriptions are extended instead of replaced, so the mod keeps
--  whatever wording the current ruleset ships with (base game, Rise and
--  Fall, Gathering Storm) and only adds its own line at the end.
-- ===========================================================================

-- Fishing Boats
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]Tidewater: +1 [ICON_Food] Food and +1 [ICON_Gold] Gold.'
WHERE Tag IN (
		'LOC_IMPROVEMENT_FISHING_BOATS_DESCRIPTION',
		'LOC_IMPROVEMENT_FISHING_BOATS_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'en_US';

-- Lighthouse
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]Tidewater: +1 [ICON_Housing] Housing.'
WHERE Tag IN (
		'LOC_BUILDING_LIGHTHOUSE_DESCRIPTION',
		'LOC_BUILDING_LIGHTHOUSE_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'en_US';

-- Shipyard
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]Tidewater: +2 [ICON_Production] Production, +1 [ICON_Housing] Housing, cheaper to build.'
WHERE Tag IN (
		'LOC_BUILDING_SHIPYARD_DESCRIPTION',
		'LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'en_US';

-- Seaport
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]Tidewater: +2 [ICON_Production] Production, +1 [ICON_Housing] Housing, cheaper to build.'
WHERE Tag IN (
		'LOC_BUILDING_SEAPORT_DESCRIPTION',
		'LOC_BUILDING_SEAPORT_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'en_US';

-- Harbor district
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]Tidewater: cheaper to build, and the hulls it trains are cheaper to keep.'
WHERE Tag IN (
		'LOC_DISTRICT_HARBOR_DESCRIPTION',
		'LOC_DISTRICT_HARBOR_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'en_US';
