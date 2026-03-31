# NYC Airbnb Market Analysis

This project analyzes the New York City Airbnb market using SQL in DBeaver and Tableau.

## Tools Used
- SQL
- DBeaver
- Tableau Public

## Project Workflow
1. Imported the dataset into DBeaver
2. Cleaned and filtered the listing data with SQL
3. Created summary views for borough, room type, and top neighbourhood analysis
4. Exported SQL outputs as CSV files
5. Built a Tableau dashboard to visualize the market structure and pricing patterns

## Files
- `airbnb_map_ready.csv`: cleaned listing-level dataset for map visualization
- `airbnb_borough_summary.csv`: borough-level summary of listing count, average price, availability, and reviews
- `airbnb_room_type_summary.csv`: room-type summary of listing count, average price, reviews, and availability
- `airbnb_top_neighbourhoods_price.csv`: top neighbourhoods by average price
- `airbnb_borough_roomtype_summary.csv`: borough and room-type combined summary
- `airbnb_queries.sql`: SQL queries used for cleaning and analysis
- dashboard image: final Tableau dashboard screenshot

## Key Insights
- Manhattan is the largest and most expensive Airbnb market in NYC.
- Brooklyn is the second-largest market, with lower average prices than Manhattan.
- Entire home or apartment listings dominate the market and command the highest prices.
- Private rooms remain highly common and much more affordable.
- Premium neighbourhoods are concentrated mainly in Manhattan, especially Tribeca, NoHo, Midtown, and SoHo.
- Staten Island and the Bronx show higher average availability, which may suggest lower occupancy pressure.

## Dashboard Focus
The dashboard highlights:
- geographical distribution of Airbnb listings across NYC
- listing count by borough
- average price by borough
- listing count by room type
- average price by room type
- top neighbourhoods ranked by average price

## Outcome
This project demonstrates how SQL and Tableau can be combined to clean raw marketplace data, generate business-focused summaries, and create a professional dashboard for portfolio use.
