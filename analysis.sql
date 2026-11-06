-- Construction Cost Tracker
-- I ran these after cleaning the data in Python

-- 1. First, the big picture - total budget vs what we actually spent
SELECT
    SUM(budget_cost) AS total_budget,
    SUM(actual_cost) AS total_actual,
    SUM(actual_cost) - SUM(budget_cost) AS variance,
    ROUND(SUM(actual_cost) * 100.0 / SUM(budget_cost), 2) AS pct_spent
FROM costs;

-- 2. Then I broke it down by category
-- Because the total doesn't tell you WHERE it's going wrong
-- This one showed Materials was driving most of the overrun
SELECT
    category,
    SUM(budget_cost) AS budget,
    SUM(actual_cost) AS actual,
    SUM(actual_cost) - SUM(budget_cost) AS variance
FROM costs
GROUP BY category
ORDER BY variance DESC;

-- 3. Monthly trend - to see WHEN it started going over
-- September stood out straight away, that's when prices jumped
SELECT
    month,
    SUM(budget_cost) AS budget,
    SUM(actual_cost) AS actual,
    SUM(actual_cost) - SUM(budget_cost) AS variance
FROM costs
GROUP BY month
ORDER BY month;

-- 4. And finally, the top 10 worst items
-- So instead of saying "we're over budget", I could say "look at THESE 10 items first"
SELECT
    cost_code,
    description,
    category,
    supplier,
    budget_cost,
    actual_cost,
    actual_cost - budget_cost AS variance
FROM costs
WHERE actual_cost > budget_cost
ORDER BY variance DESC
LIMIT 10;