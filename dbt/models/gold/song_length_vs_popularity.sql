{{ config(materialized='view') }}

SELECT
    duration_bucket,
    count_track,
    avg_popularity
FROM {{ source('spotify_gold', 'song_length_vs_popularity') }}