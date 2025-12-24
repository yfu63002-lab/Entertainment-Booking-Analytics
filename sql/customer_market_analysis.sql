-- Identify the city generating the highest total booking revenue

SELECT
  C.CustCity AS Customer_City,
  SUM(E.ContractPrice) AS Total_Revenue_From_City
FROM Customers AS C
JOIN Engagements AS E
  ON C.CustomerID = E.CustomerID
GROUP BY C.CustCity
ORDER BY Total_Revenue_From_City DESC
LIMIT 1;

-- Identify high-value customers based on total spending

SELECT
  C.CustFirstName,
  C.CustLastName,
  C.CustCity,
  SUM(E.ContractPrice) AS Total_Customer_Spending,
  COUNT(E.EngagementNumber) AS Total_Bookings
FROM Customers AS C
JOIN Engagements AS E
  ON C.CustomerID = E.CustomerID
GROUP BY
  C.CustomerID, C.CustFirstName, C.CustLastName, C.CustCity
ORDER BY Total_Customer_Spending DESC
LIMIT 5;

-- Analyze customer preferences, bookings, and entertainer supply by musical style

WITH overall_likes AS (
  SELECT styleid, COUNT(*) AS overall_likes
  FROM musical_preferences
  GROUP BY styleid
),
top1_likes AS (
  SELECT styleid, COUNT(*) AS top1_likes
  FROM musical_preferences
  WHERE preferenceseq = 1
  GROUP BY styleid
),
bookings AS (
  SELECT es.styleid, COUNT(*) AS num_bookings
  FROM engagements e
  JOIN entertainer_styles es
    ON e.entertainerid = es.entertainerid
  GROUP BY es.styleid
),
supply AS (
  SELECT styleid, COUNT(DISTINCT entertainerid) AS num_supply
  FROM entertainer_styles
  GROUP BY styleid
)
SELECT
  ms.styleid,
  ms.stylename,
  COALESCE(ol.overall_likes, 0) AS overall_likes,
  COALESCE(t1.top1_likes, 0) AS top1_likes,
  COALESCE(bk.num_bookings, 0) AS num_bookings,
  COALESCE(sp.num_supply, 0) AS num_supply
FROM musical_styles ms
LEFT JOIN overall_likes ol ON ms.styleid = ol.styleid
LEFT JOIN top1_likes t1 ON ms.styleid = t1.styleid
LEFT JOIN bookings bk ON ms.styleid = bk.styleid
LEFT JOIN supply sp ON ms.styleid = sp.styleid
ORDER BY ms.stylename;
