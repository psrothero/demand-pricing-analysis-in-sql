WITH params AS (
    SELECT
        regr_intercept(LN(quantity_sold), price) AS intercept,
        regr_slope(LN(quantity_sold), price) AS slope
    FROM demand_curve_data
)
SELECT
    (-1 / slope) AS optimal_price,
    (-1 / slope) * EXP(intercept - 1) AS max_revenue
FROM params;
