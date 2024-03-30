SELECT DISTINCT [YEAR]
FROM [ProjectDB].[Energy].[MonthlyConsumption]


ALTER TABLE Energy.MonthlyConsumption DROP CONSTRAINT [PK_MonthlyConsumption];
CREATE CLUSTERED INDEX [IX_MonthlyConsumption_Partitioned] ON Energy.MonthlyConsumption(Year)
ON MonthlyConsumption_PartitionScheme(Year);

SELECT
    $PARTITION.MonthlyConsumption_Years(Year) AS PartitionNumber,
    COUNT(*) AS NumberOfRecords
FROM
    Energy.MonthlyConsumption
GROUP BY
    $PARTITION.MonthlyConsumption_Years(Year);