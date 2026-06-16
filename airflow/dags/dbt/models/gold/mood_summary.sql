{{ config(materialized='view') }}

SELECT
    mood,
    count_track,
    avg_popularity,
    avg_danceability,
    avg_energy,
    avg_valence
FROM {{ source('spotify_gold', 'mood_summary') }}