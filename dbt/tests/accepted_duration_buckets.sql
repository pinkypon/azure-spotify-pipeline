SELECT duration_bucket
FROM dbo_gold_views.song_length_vs_popularity
WHERE duration_bucket NOT IN ('Short', 'Medium', 'Long')