-- 2.1
SELECT [Parish], [Year], SUM([ActiveEnergy]) AS [ActiveEnergy]
FROM [Energy].[MonthlyConsumption]
WHERE [Municipality] = 'Lisboa'
AND [Month] = '06'
GROUP BY [Parish], [Year]
ORDER BY [Parish], [Year]

-- 2.2
CREATE INDEX IX_Municipality ON [Energy].[MonthlyConsumption] ([Municipality]);

DROP INDEX IX_Municipality ON [Energy].[MonthlyConsumption];

-- 2.3
CREATE INDEX IX_Month ON [Energy].[MonthlyConsumption] (Month);

SELECT [Parish], [Year], SUM([ActiveEnergy]) AS [ActiveEnergy]
FROM [Energy].[MonthlyConsumption]
WITH (INDEX(IX_Month))
WHERE [Municipality] = 'Lisboa'
AND [Month] = '06'
GROUP BY [Parish], [Year]
ORDER BY [Parish], [Year]

DROP INDEX IX_Month ON [Energy].[MonthlyConsumption];

-- 2.4
CREATE NONCLUSTERED INDEX IX_Month_Municipality ON [Energy].[MonthlyConsumption]
([Month],[Municipality]);

DROP INDEX IX_Month_Municipality ON [Energy].[MonthlyConsumption];

-- 2.5
CREATE NONCLUSTERED INDEX IX_Municipality_Month ON [Energy].[MonthlyConsumption]
([Municipality],[Month]);

DROP INDEX IX_Municipality_Month ON [Energy].[MonthlyConsumption];

-- 2.6
CREATE NONCLUSTERED INDEX IX_Month_Municipality_Includes ON [Energy].[MonthlyConsumption]
([Month],[Municipality]) INCLUDE ([Parish], [ActiveEnergy]);

DROP INDEX IX_Month_Municipality_Includes ON [Energy].[MonthlyConsumption];

-- 2.7
CREATE NONCLUSTERED INDEX IX_Month_Municipality_Parish_ActiveEnergy ON
[Energy].[MonthlyConsumption] ([Month],[Municipality], [Parish],[ActiveEnergy]);

DROP INDEX IX_Month_Municipality_Parish_ActiveEnergy ON [Energy].[MonthlyConsumption];

-- 2.8
CREATE NONCLUSTERED INDEX IX_Month_Municipality_Parish_ActiveEnergy_Year ON
[Energy].[MonthlyConsumption] ([Month],[Municipality], [Parish],[ActiveEnergy], [Year]);

DROP INDEX IX_Month_Municipality_Parish_ActiveEnergy_Year ON [Energy].[MonthlyConsumption];

