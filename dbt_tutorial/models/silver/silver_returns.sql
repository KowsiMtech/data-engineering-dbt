WITH returns AS (
    SELECT
        sales_id,
        product_sk,
        store_sk,
        returned_qty,
        return_reason,
        refund_amount
    FROM {{ ref('bronze_returns') }}
),

product AS (
    SELECT
        product_sk,
        category
    FROM {{ ref('bronze_product') }}
),

store AS (
    SELECT
        store_sk,
        store_name
    FROM {{ ref('bronze_store') }}
),

joined_query AS (
    SELECT
        r.sales_id,
        r.returned_qty,
        r.return_reason,
        r.refund_amount,
        p.category,
        s.store_name
    FROM returns r
    JOIN product p
        ON r.product_sk = p.product_sk
    JOIN store s
        ON r.store_sk = s.store_sk
)

SELECT
    category,
    store_name,
    return_reason,
    SUM(returned_qty) AS total_returned_qty,
    SUM(refund_amount) AS total_refund_amount
FROM joined_query
GROUP BY
    category,
    store_name,
    return_reason
ORDER BY
    total_refund_amount DESC
