/* PROJECT: Denial Detective - Monitoring Phase
PURPOSE: Automated Clean Claim Rate (CCR) Monitoring
LOGIC: Trigger warning at 2-Sigma (95% variance) 
*/

WITH DailyStats AS (
    SELECT 
        submission_date,
        (COUNT(CASE WHEN status = 'PAID' THEN 1 END) * 1.0 / COUNT(*)) AS ccr
    FROM claim_history
    GROUP BY submission_date
),
Metrics AS (
    SELECT 
        ccr,
        AVG(ccr) OVER() as mean_ccr,
        STDDEV(ccr) OVER() as std_dev
    FROM DailyStats
)
SELECT 
    ccr,
    mean_ccr,
    CASE 
        WHEN ccr < (mean_ccr - (2 * std_dev)) THEN '⚠️ 2-SIGMA WARNING: LOGIC AUTOPSY REQUIRED'
        WHEN ccr < (mean_ccr - (3 * std_dev)) THEN '🚨 3-SIGMA ALERT: SYSTEMIC FAILURE'
        ELSE '✅ STABLE'
    END AS monitoring_status
FROM Metrics
ORDER BY ccr ASC;
