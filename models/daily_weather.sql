with daily_weather as(
    select
    date(time) as weather_date,
    temp,
    pressure,
    weather,
    clouds
    from {{ source('demo', 'weather') }}

    -- limit 10
),

daily_weather_agg as (
    select
    weather_date,
    weather,
    round(avg(temp), 2) as avg_temp,
    round(avg(pressure), 2) as avg_pressure,
    round(avg(clouds), 2) as avg_clouds
    from daily_weather

    group by weather_date, weather

    qualify row_number() over (partition by weather_date order by count(weather) desc) = 1
)

select * from daily_weather_agg