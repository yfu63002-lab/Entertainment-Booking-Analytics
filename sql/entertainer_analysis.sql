-- Identify the entertainer generating the highest total revenue

SELECT
  E.EntStageName,
  SUM(Eng.ContractPrice) AS Total_Revenue
FROM Entertainers AS E
JOIN Engagements AS Eng
  ON E.EntertainerID = Eng.EntertainerID
GROUP BY E.EntertainerID, E.EntStageName
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Find entertainers that have never been booked

SELECT
  E.EntStageName,
  E.EntPhoneNumber,
  E.EntCity
FROM Entertainers AS E
LEFT JOIN Engagements AS Eng
  ON E.EntertainerID = Eng.EntertainerID
WHERE Eng.EngagementNumber IS NULL;
