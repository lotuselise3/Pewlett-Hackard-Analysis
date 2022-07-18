# Pewlett-Hackard-Analysis

## Module 7 Challenge ~ WeatherPy with Python APIs
---
## Overview of Project
- In this module, we are exploring SQL and how to organize and query data on a large scale. By understanding entity relationship diagrams, we will practice importing and use different joins to create new tables in pgAdmin. 
### Purpose
- Using SQL technique we will help Pewlett-Hackard compile a list of employees eligible for retirement and plan for those open positions to be filled. From the six csv files provided, we will practice ERD modeling to highlight sections of each table and understand the relationships to each other in order to determine who is retiring and which positions the retiring people are currently holding. 

Below is an ERD schema we created from the six csv files and will be referencing for this project. 
- The connecting lines show the relationships between each table or csv file. 
- Primary keys (unique identifiers) and foreign keys (references another dataset's primary key) are indicated by a key symbol next to the variable in each column line. 

![EmployeeDB](https://user-images.githubusercontent.com/68654746/179533395-a7375111-322f-418b-a064-ce6e42bbe8e0.png)

Below is the code I queried to connect the six tables:
![queries](https://user-images.githubusercontent.com/68654746/179537709-5ea5820e-1cac-4886-ae81-47dc6485f98b.png)

Below is a reference for the queries asked to draw retirement and mentorship program eligibility:
 - retirement_info: all employees born between 1952 and 1955, and hired between 1985 and 1988
 - current_emp: narrows down all employees from the retirement_info to only currently employed employees
 - emp_no: number of employees potentially retiring from the current_emp query
 - emp_info: lists all of the employees from current_emp including their gender and salary
 - manager_info: lists all of the managers and their department from current_emp
 - dept_info: an updated list of current_emp to include each employee’s department
 - sales_info: retirement information (emp_no, first name, last name) for the sales team
 - mentor_info: all sales and development personnel from dept_info
---
### Results: 
**Deliverable 1 ~ The Number of Retiring Employees by Title**
First I queried all the current employees born between January 1, 1952 and December 31, 1955, as well as their employee number. When gathering information to determine which employees are eligible for a retirement package, I ran into some query issues when the returned information contained duplicates. It was because duplicates were a result of employees having more than one job position and have worked in different departments over their course of employment at Pewlett-Hackard. In the table below, it appears that Christian Koblick was an engineer in 1986 and then was promoted to a senior engineer in 1995. Similarly, Sumant Peac began as an Assistant Engineer in 1985, was promoted as Engineer in 1990, and then Senior Engineer in 1995. 
<img width="780" alt="duplicates" src="https://user-images.githubusercontent.com/68654746/179549262-218f8ada-8410-4155-8175-bc15f331483e.png">

Therefore, when combining complete tables, it was necessary to perform different types of joins, such as inner, left or right joins. Then, to remove duplicate rows, I used the DISTINCT ON statement to retrieve a single row defined by the ON () clause, which in our case is emp_no. The row (emp_no) that is returned is then sorted by the ORDER BY clause in ascending order. 
![retiring_emp](https://user-images.githubusercontent.com/68654746/179545073-578dbfbf-75fb-44b4-b215-9194fc450d50.png)

The desired output is seen below:
![unique_titles](https://user-images.githubusercontent.com/68654746/179550106-66e3937f-59e7-4df9-bd1a-80994f01d278.png)


**Deliverable 2** ~ The Employees Eligible for the Mentorship Program**

To prepare for all the potential vacant positions, a mentorship program would have experienced employees born in 1965 and mentor newly hired personnel so that eventually their positions will be filled when they retire. This will prevent potential vacancies and gaps in Pewlett Hackard’s company. Below is the query to collect a list of employees who were born between January 1, 1965 and December 31, 1965 and are eligible for the mentorship program. 
![mentorship_eligibility](https://user-images.githubusercontent.com/68654746/179551653-b305e80f-279d-4ce7-9d00-f797372145e7.png)

Below is the exported Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program:
<img width="748" alt="mentorship_eligibility_output" src="https://user-images.githubusercontent.com/68654746/179551834-69c518b7-6a5b-45b0-a668-1e197282165a.png">

### Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Gathering from the the unique_titles.csv, there are 72,458 employees who can potentially retire and a breakdown of retiring-eligible employees by job title. 
At last, the final output saved as retiring_titles.csv contains the number of retirement-age employees by their most recent job title.
![retiring_title](https://user-images.githubusercontent.com/68654746/179547126-00528c9b-8948-46ad-9d59-578080a84511.png)

Looking from the retiring_titles.csv, it appears there are a lot of senior staff and senior engineer positions, 25,916 and 24,926 employees respectively, that will potentially be vacant. For these reasons, it may be vital to determine which departments each of the employees are in and submit a list to each department to develop specific plans for when their employees retire.   

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
Based on retiring_info_by_dept, it would be beneficial to also include the department of which mentors can be matched to new hires in that department when starting the mentorship program. The unique_titles.csv can be joined with an INNER JOIN on the dept_emp and dept_info.csv to create a retiring_info_by_dept that would include retiring-eligible employees as well as the departments they work in.
