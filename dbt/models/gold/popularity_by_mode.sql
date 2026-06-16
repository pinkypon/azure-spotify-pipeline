{{ config(materialized='view') }}

SELECT
    mode,
    avg_popularity,
    track_count
FROM {{ source('spotify_gold', 'popularity_by_mode') }}