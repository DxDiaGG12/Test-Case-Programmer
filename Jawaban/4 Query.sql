WITH date_range AS (
    SELECT '2021-11-01' AS transaction_date
    UNION ALL SELECT '2021-11-02'
    UNION ALL SELECT '2021-11-03'
    UNION ALL SELECT '2021-11-04'
    UNION ALL SELECT '2021-11-05'
    UNION ALL SELECT '2021-11-06'
    UNION ALL SELECT '2021-11-07'
    UNION ALL SELECT '2021-11-08'
    UNION ALL SELECT '2021-11-09'
    UNION ALL SELECT '2021-11-10'
    UNION ALL SELECT '2021-11-11'
    UNION ALL SELECT '2021-11-12'
    UNION ALL SELECT '2021-11-13'
    UNION ALL SELECT '2021-11-14'
    UNION ALL SELECT '2021-11-15'
    UNION ALL SELECT '2021-11-16'
    UNION ALL SELECT '2021-11-17'
    UNION ALL SELECT '2021-11-18'
    UNION ALL SELECT '2021-11-19'
    UNION ALL SELECT '2021-11-20'
    UNION ALL SELECT '2021-11-21'
    UNION ALL SELECT '2021-11-22'
    UNION ALL SELECT '2021-11-23'
    UNION ALL SELECT '2021-11-24'
    UNION ALL SELECT '2021-11-25'
    UNION ALL SELECT '2021-11-26'
    UNION ALL SELECT '2021-11-27'
    UNION ALL SELECT '2021-11-28'
    UNION ALL SELECT '2021-11-29'
    UNION ALL SELECT '2021-11-30'
)
SELECT 
    M.merchant_name,
    GROUP_CONCAT(DISTINCT O.outlet_name ORDER BY O.outlet_name SEPARATOR ', ') AS outlet_names,
    COALESCE(SUM(T.bill_total), 0) AS omzet,
    D.transaction_date
FROM 
    date_range D
LEFT JOIN 
    Merchants M ON M.user_id = (SELECT id FROM Users WHERE user_name = 'admin1')
LEFT JOIN 
    Outlets O ON O.merchant_id = M.id
LEFT JOIN 
    Transactions T ON DATE(T.created_at) = D.transaction_date AND T.merchant_id = M.id
GROUP BY 
    M.merchant_name, D.transaction_date
ORDER BY 
    D.transaction_date ASC;
