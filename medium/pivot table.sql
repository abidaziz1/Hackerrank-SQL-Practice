/*
A **pivot table** is a powerful tool used in data processing and reporting to summarize and reorganize data from a larger table. It allows you to quickly analyze large datasets by grouping and aggregating the data into a more readable and manageable format. Pivot tables are widely used in spreadsheet software like Excel and in SQL-based reporting tools.

### Key Concepts of a Pivot Table:

1. **Rows (Row Labels)**: These are the categories or groups you want to summarize or group by. The row labels define how the data will be grouped vertically.

2. **Columns (Column Labels)**: These are the categories by which you want to break down the data horizontally. You can choose specific fields to create columns, helping to compare data side-by-side.

3. **Values (Metrics/Measures)**: These are the numeric fields that you want to aggregate (e.g., sums, counts, averages, etc.). Values typically occupy the middle of the pivot table and are aggregated based on the rows and columns.

4. **Filters**: These are criteria that allow you to filter the data before applying the pivot. Filters help to refine the data and focus on specific segments.

### Example of a Pivot Table in Excel or a Spreadsheet

Let’s assume you have a dataset representing sales data:

| Date       | Product | Region | Sales |
|------------|---------|--------|-------|
| 2024-01-01 | Apples  | East   | 100   |
| 2024-01-01 | Bananas | East   | 150   |
| 2024-01-02 | Apples  | West   | 200   |
| 2024-01-02 | Bananas | West   | 250   |
| 2024-01-03 | Apples  | East   | 120   |
| 2024-01-03 | Bananas | West   | 220   |

Now, you want to create a pivot table to show **total sales by product for each region**.

#### Row Labels: `Product`
#### Column Labels: `Region`
#### Values: `Sum of Sales`

The resulting pivot table would look like this:

| Product | East | West | Grand Total |
|---------|------|------|-------------|
| Apples  | 220  | 200  | 420         |
| Bananas | 150  | 470  | 620         |
| **Grand Total** | **370**  | **670**  | **1040**       |

In this example:
- **Rows** represent the `Product` field.
- **Columns** represent the `Region` field.
- **Values** represent the sum of `Sales`.
- The **Grand Total** row and column show the total sales across products and regions.

### SQL Pivot Example:

You can also create pivot tables in SQL, though the syntax differs. Let’s say you have a table called `Sales` with the following columns:
- `Product` (e.g., Apples, Bananas)
- `Region` (e.g., East, West)
- `Sales` (the number of sales)

To create a pivot-like result in SQL, you can use the `PIVOT` function or `CASE` statements to transform rows into columns. Here's an example of an SQL query that achieves the same as the above pivot table:

This query will output the same kind of result:

| Product | East | West | Total_Sales |
|---------|------|------|-------------|
| Apples  | 220  | 200  | 420         |
| Bananas | 150  | 470  | 620         |

### Benefits of a Pivot Table:
- **Summarization**: Quickly summarize and aggregate data without having to manually calculate values.
- **Dynamic Reporting**: You can easily change the rows, columns, and measures to get different perspectives on the data.
- **Filtering and Sorting**: Pivot tables allow you to filter and sort the data, giving more control over the data view.
- **Data Comparison**: Break data into different categories and compare side-by-side (e.g., comparing sales of products across different regions).

### Use Cases for Pivot Tables:
- Sales reporting: Summarize total sales by product, region, and time period.
- Financial analysis: Summarize expenses by category and time period.
- Inventory management: Track stock levels by category and location.
- Survey results: Summarize responses by question and demographic.

### Conclusion:
A pivot table helps you summarize large datasets into an easy-to-read format by grouping and aggregating data, allowing for quick analysis and decision-making. You can use pivot tables both in spreadsheet software like Excel and in SQL queries to generate insights from your data.
*/
SELECT 
    Product,
    SUM(CASE WHEN Region = 'East' THEN Sales ELSE 0 END) AS East,
    SUM(CASE WHEN Region = 'West' THEN Sales ELSE 0 END) AS West,
    SUM(Sales) AS Total_Sales
FROM Sales
GROUP BY Product;
