# Entertainment Booking Analytics

##、## Project Overv
This project analyzes an entertainment booking database to uncover business insights related to agent performance, customer behavior, entertainer profitability, and seasonal revenue patterns. The analysis was completed as part of an MSBA coursework project and focuses on applying SQL to real-world business questions using a relational database.

The project demonstrates end-to-end analytical thinking, including data quality validation, exploratory analysis, and insight-driven recommendations.

---

## Dataset Description
The database represents an entertainment agency that manages bookings between customers, agents, and entertainers. Key entities include:

- **Agents**: Sales representatives responsible for negotiating bookings
- **Customers**: Clients who book entertainment services
- **Entertainers**: Performers providing entertainment services
- **Engagements**: Individual booking contracts linking customers, agents, and entertainers
- **Musical Styles & Preferences**: Supply-and-demand relationships between customer preferences and entertainer specialties
- **Members**: Individual performers associated with entertainer groups

---

## Database Structure
The core schema follows a relational design centered around the `Engagements` table, which connects customers, agents, and entertainers. Many-to-many relationships are handled through junction tables such as `Entertainer_Styles`, `Entertainer_Members`, and `Musical_Preferences`.

Primary and foreign key constraints ensure referential integrity across all tables.

---

## Data Preparation & Quality Checks
Before analysis, data quality was evaluated to ensure reliability of insights:

- **Missing Values**  
  - Missing values were limited to optional attributes (e.g., entertainer email, webpage, member gender).
  - No critical identifiers contained missing values.

- **Duplicate Records**  
  - Duplicate checks confirmed no duplicated customers, entertainers, or engagement records based on business keys.

- **Inconsistent Values**  
  - Identified engagements with invalid time ranges (stop time earlier than start time).
  - Flagged unrealistic engagement durations for further review.

These checks ensured that downstream analysis was based on clean and trustworthy data.

---

## Key Analyses

### Agent Performance Analysis
- Compared agent salary with total revenue, booking frequency, and revenue per engagement
- Identified two successful sales profiles:
  - **Volume-based agents** with high booking counts
  - **Value-based agents** generating high revenue per engagement
- Found weak correlation between salary and performance, highlighting compensation inefficiencies
- Detected a non-performing agent with anomalous salary data

### Customer & Market Analysis
- Identified the most profitable customer cities
- Segmented customers into:
  - **High-value customers** (high spending per booking)
  - **High-frequency customers** (frequent bookings)
- Analyzed market gaps by comparing customer musical preferences with actual bookings

### Entertainer Analysis
- Identified top-performing entertainers by total revenue and booking volume
- Highlighted high-margin, underutilized entertainers as strategic growth opportunities
- Flagged entertainers with zero bookings for roster optimization

### Seasonality Analysis
- Analyzed revenue and booking trends by season and month
- Found strong seasonality with winter as the peak revenue period
- Identified January as the most profitable month and November as a revenue trough

---

## SQL Techniques Used
- Multi-table `JOIN`s (INNER, LEFT)
- Aggregations with `GROUP BY`
- Conditional logic using `CASE WHEN`
- Window functions (`DENSE_RANK`)
- Common Table Expressions (CTEs)
- Correlation analysis using `corr()`
- Date and time analysis with `EXTRACT()`

---

## Project Structure
Entertainment-Booking-Analytics/
├── README.md
├── sql/
│ ├── schema.sql
│ ├── data_quality.sql
│ ├── agent_analysis.sql
│ ├── customer_market_analysis.sql
│ ├── entertainer_analysis.sql
│ └── seasonality.sql

## Business Impact & Recommendations
Key recommendations derived from the analysis include:

- Prioritize high-margin entertainers with strong revenue potential but low booking frequency
- Address non-performing agents and anomalous compensation records
- Diversify entertainer offerings to reduce dependency on top performers
- Target under-served markets and cities with high customer demand
- Leverage seasonality insights for pricing and staffing strategies

---

## Tools & Technologies
- **SQL (PostgreSQL syntax)**
- Relational database design
- Google Colab (for visualization and extended analysis)

---

## Author
This project was completed as part of an MSBA program to demonstrate SQL-driven data analysis and business insight generation.
