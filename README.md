# University Data Warehouse
This project demonstrates the design and implementation of a **data warehouse for university analytics** using Microsoft BI stack tools. It includes **relational modeling, ETL, OLAP cubes, MDX queries, KPIs, and data visualizations**.

## **Business Process and Metrics**  
**Course Execution:** Lecturers assigned to courses conduct classes and grade students.  
**Student Feedback:** Students complete satisfaction surveys.  
**Performance Goals:**  
- **Student satisfaction:** increase 7.5% per year until 95%.  
- **Success rates:** increase 3% per year until 75%.  

**Analytical Challenges:** Tracking trends, identifying courses needing improvement, and ensuring efficient aggregation for reporting.  
## Technologies Used
- **Database & ETL:** SQL Server Management Studio, T-SQL, Visual Studio  
- **Data Modeling:** Snowflake schema, fact and dimension tables  
- **OLAP / Analytics:** SSAS cubes, MDX queries, KPIs  
- **Scripting:** Python (data generation)  
- **Business Intelligence:** Power BI (dashboards, not included)  
- **Data Sources:** Relational database & Excel file - Student satisfaction survey  

## Project Overview
1. **Relational Database:** Modeled university processes (students, courses, enrollments, grades) in SQL Server.  
2. **Data Generation:** Created realistic synthetic data using Python scripts.  
3. **Data Warehouse:** Designed and implemented a **snowflake-schema warehouse** (fact & dimension tables).  
4. **ETL Pipelines:** Developed using **T-SQL and SSIS** to load data from multiple sources.  
5. **OLAP Cube:** Built in Visual Studio / SSAS with **measures, dimensions, partitions, and KPIs**.  
6. **MDX Queries & Analytical Reporting:** Queries designed to analyze student performance and course metrics.
7. **Power BI Dashboards:** Designed interactive dashboards to visualize key metrics from the warehouse (Power BI files not included).
8. **OLAP Storage and Aggregation Analysis:** Compared **MOLAP, ROLAP, and HOLAP** storage modes with and without aggregations to evaluate performance differences, query response times, and storage efficiency.
