-- Analyze relationship between agent salary and average contract price

SELECT
  A.AgtFirstName,
  A.AgtLastName,
  A.Salary,
  AVG(E.ContractPrice) AS Average_Contract_Price,
  COUNT(E.EngagementNumber) AS Number_Of_Bookings
FROM Agents AS A
JOIN Engagements AS E
  ON A.AgentID = E.AgentID
GROUP BY
  A.AgentID, A.AgtFirstName, A.AgtLastName, A.Salary
ORDER BY
  A.Salary DESC;

-- Calculate total commission earned by each agent

SELECT
  A.AgtFirstName,
  A.AgtLastName,
  COUNT(E.EngagementNumber) AS Frequency_Of_Bookings,
  SUM(E.ContractPrice * A.CommissionRate) AS Total_Commission_Fee
FROM Agents AS A
JOIN Engagements AS E
  ON A.AgentID = E.AgentID
GROUP BY
  A.AgentID, A.AgtFirstName, A.AgtLastName
ORDER BY
  Total_Commission_Fee DESC;

-- Test correlation between agent salary and total revenue generated

SELECT corr(salary, total_revenue) AS corr_salary_revenue
FROM (
  SELECT
    a.agentid,
    a.salary,
    SUM(e.contractprice) AS total_revenue,
    COUNT(e.engagementnumber) AS numengagements
  FROM agents a
  LEFT JOIN engagements e
    ON a.agentid = e.agentid
  GROUP BY a.agentid, a.salary
) t
WHERE numengagements > 0;

-- Correlation between agent salary and number of engagements

SELECT corr(salary, numengagements) AS corrsalaryfrequency
FROM (
  SELECT
    a.agentid,
    a.salary,
    COUNT(e.engagementnumber) AS numengagements
  FROM agents a
  LEFT JOIN engagements e
    ON a.agentid = e.agentid
  GROUP BY a.agentid, a.salary
) t
WHERE numengagements > 0;
