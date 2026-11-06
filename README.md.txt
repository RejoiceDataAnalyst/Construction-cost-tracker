# Construction cost tracker
Power BI dashboard tracking budget vs actual costs using python , SQL and power BI# Construction Cost Tracker - Budget vs Actual Dashboard

I built this project because I kept seeing the same problem on construction sites.

Project managers were tracking costs in messy Excel BOQs. Different files, different formats, missing values. By the time the report was ready - usually 3 days later - the overrun had already happened. It was too late to fix anything.

So I decided to build something better.

### What I used
Python, SQL, Power BI, Excel

### What I actually did

1. **Cleaned the mess with Python:** I had 3 BOQ files that didn't match at all. Duplicates everywhere, cost codes written differently, dates in different formats. I cleaned all of that with Pandas and got it into one clean file.

2. **Moved it to SQL:** I created tables for Budget, Actual Spend and Suppliers, then wrote queries to calculate variance, % spent and forecast final cost. This made it much easier to ask questions like "where are we overspending?"

3. **Built the dashboard in Power BI:** I made it simple on purpose. Filter by Category, Supplier or Month, and you can immediately see Budget vs Actual, forecast, and which items are overrunning.

4. **What I found:** Materials were the biggest problem. There was a big spike in September because of price increases. Once the team could see that weekly instead of monthly, they could actually act on it.

### The numbers
- **Total Budget:** R12.5M
- **Actual Spend:** R9.8M (78% spent)
- **Forecast Final Cost:** R13.2M
- **Variance:** +R700k over budget
- **Biggest overruns:** Materials (+R420k), Subcontractors (+R210k)
- **Reporting time:** From 3 days down to 1 day

### Dashboard
![Dashboard Screenshot](dashboard_screenshot.png)

**Live Dashboard:** [Paste your Power BI Public link here]

### Files here
- `cleaning.py` - how I cleaned the BOQ data
- `analysis.sql` - the queries I used for variance and forecast
- `data_sample.csv` - sample of the cleaned data
- `dashboard_screenshot.png` - dashboard preview

### What I learned
The dashboard itself wasn't the hard part. The hard part was cleaning real, messy data and then explaining it in a way a non-technical manager would actually understand and use. That is what I want to keep getting better at.

