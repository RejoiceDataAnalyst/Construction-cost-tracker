import pandas as pd
import numpy as np

# I started with the raw BOQ file - it was messy, as usual
df = pd.read_excel('boq_raw.xlsx', sheet_name='BOQ')

# First, just see how bad it is
print(df.shape)
print(df.isnull().sum())

# Column names were all over the place - spaces, capitals, etc. So I cleaned them up
df.columns = df.columns.str.strip().str.lower().str.replace(' ', '_')

# There were a lot of duplicate rows, probably from copy-pasting
df = df.drop_duplicates()

# Cost codes were written differently - some lower, some upper, some with spaces
df['cost_code'] = df['cost_code'].str.strip().str.upper()

# A lot of blank costs. I treated blanks as 0 for now, and unknown suppliers as 'Unknown'
# so I didn't lose the row completely
df['actual_cost'] = df['actual_cost'].fillna(0)
df['budget_cost'] = df['budget_cost'].fillna(0)
df['supplier'] = df['supplier'].fillna('Unknown')

# Dates were in different formats. This forces them all to one format,
# and drops rows where the date is completely broken
df['date'] = pd.to_datetime(df['date'], errors='coerce')
df = df.dropna(subset=['date'])

# Category names were inconsistent - Material, Materials, Materialss...
# I standardised them so the dashboard grouping actually works
df['category'] = df['category'].str.strip().str.title()
df['category'] = df['category'].replace({
    'Material': 'Materials',
    'Materialss': 'Materials',
    'Subcontractor': 'Subcontractors'
})

# Now create the columns I actually need for the analysis
df['variance'] = df['actual_cost'] - df['budget_cost']
df['variance_pct'] = (df['variance'] / df['budget_cost'] * 100).round(2)
df['month'] = df['date'].dt.to_period('M').astype(str)

# Save the clean version - this is what I used in SQL and Power BI
df.to_csv('data_sample.csv', index=False)
print("Cleaned! Final shape:", df.shape)
print(df.groupby('category')[['budget_cost', 'actual_cost', 'variance']].sum())# Construction cost tracker
Power BI dashboard tracking budget vs actual costs using python , SQL and power BI

