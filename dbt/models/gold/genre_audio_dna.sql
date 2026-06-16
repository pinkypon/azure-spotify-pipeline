{{ config(materialized='view') }}

SELECT
    track_genre,
    avg_danceability,
    avg_energy,
    avg_valence,
    avg_tempo,
    avg_acousticness,
    count_tracks
FROM {{ source('spotify_gold', 'genre_audio_dna') }}