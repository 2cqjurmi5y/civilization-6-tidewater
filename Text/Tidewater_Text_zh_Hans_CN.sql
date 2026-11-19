-- ===========================================================================
--  Tidewater 1.0.0 - 简体中文文本
--
--  只做追加，不覆盖原文，因此基础版、迭起兴衰、风云变幻三种规则集都能
--  保留自己的描述文字，只在末尾补一行潮汐改动。
-- ===========================================================================

-- 渔船
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]潮汐：+1 [ICON_Food] 食物，+1 [ICON_Gold] 金币。'
WHERE Tag IN (
		'LOC_IMPROVEMENT_FISHING_BOATS_DESCRIPTION',
		'LOC_IMPROVEMENT_FISHING_BOATS_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'zh_Hans_CN';

-- 灯塔
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]潮汐：+1 [ICON_Housing] 住房。'
WHERE Tag IN (
		'LOC_BUILDING_LIGHTHOUSE_DESCRIPTION',
		'LOC_BUILDING_LIGHTHOUSE_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'zh_Hans_CN';

-- 造船厂
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]潮汐：+2 [ICON_Production] 生产力，+1 [ICON_Housing] 住房，建造费用降低。'
WHERE Tag IN (
		'LOC_BUILDING_SHIPYARD_DESCRIPTION',
		'LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'zh_Hans_CN';

-- 海港
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]潮汐：+2 [ICON_Production] 生产力，+1 [ICON_Housing] 住房，建造费用降低。'
WHERE Tag IN (
		'LOC_BUILDING_SEAPORT_DESCRIPTION',
		'LOC_BUILDING_SEAPORT_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'zh_Hans_CN';

-- 港口区域
UPDATE LocalizedText
SET Text = Text || '[NEWLINE][NEWLINE]潮汐：建造费用降低，从这里训练出的舰船维护费也更低。'
WHERE Tag IN (
		'LOC_DISTRICT_HARBOR_DESCRIPTION',
		'LOC_DISTRICT_HARBOR_EXPANSION2_DESCRIPTION'
	)
	AND Language = 'zh_Hans_CN';
