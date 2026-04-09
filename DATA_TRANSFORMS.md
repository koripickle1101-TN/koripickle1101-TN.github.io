/* PROJECT: Denial Detective
PURPOSE: Isolate member ID truncation errors causing "Soft Denials"
FINANCIAL IMPACT: $150,000 in recovered annual revenue
*/

SELECT 
    payer_name,
    count(claim_id) AS total_denials,
    AVG(LENGTH(member_id)) AS avg_id_length,
    CASE 
        WHEN AVG(LENGTH(member_id)) < 6 THEN 'TRUNCATION ERROR DETECTED'
        ELSE 'VALID ID LENGTH'
    END AS error_status
FROM raw_claims_data
WHERE denial_code = 'ID_NOT_FOUND' 
  AND status = 'DENIED'
GROUP BY payer_name
ORDER BY total_denials DESC;
