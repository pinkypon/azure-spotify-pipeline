{{ config(materialized='view') }}

SELECT
    explicit,
    avg_popularity,
    track_count
FROM {{ source('spotify_gold', 'popularity_by_explicit') }}