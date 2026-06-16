{{ config(materialized='view') }}

SELECT
    time_signature,
    avg_popularity,
    track_count
FROM {{ source('spotify_gold', 'popularity_by_time_signature') }}