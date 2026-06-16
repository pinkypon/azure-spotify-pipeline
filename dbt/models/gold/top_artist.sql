{{ config(materialized='view') }}

SELECT
    artist,
    avg_popularity,
    avg_danceability,
    count_track
FROM {{ source('spotify_gold', 'top_artist') }}