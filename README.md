# 📖 Project Overview

This project analyzes the usage of AI tools among students in the school, exploring patterns across grades, fields of study, and devices. The goal is to uncover insights about AI adoption and its perceived usefulness among students.
The dataset originally contained student information; however, **due to confidentiality, all student names have been removed**
---

# 🗂️ Project Structure

- **schema.sql**  
  Defines the database schema: tables for student info, AI tool usage, and ratings.

- **data_cleaning.sql**  
  Standardizes and cleans the data, e.g., formatting grades and normalizing Yes/No responses.

- **analysis.sql**  
  Contains queries to:  
  - Count students per grade using AI  
  - Analyze AI usage by field of study  
  - Investigate devices used for AI activities  
  - Identify the most popular AI tools per grade  
  - Calculate average usefulness ratings per tool  

---

# 🔑 Key Insights

- 8th-grade students show the highest AI tool adoption.  
- Mathematics students use AI tools most actively, while Humanities students use them less.  
- Mobile devices are the dominant platform for AI usage.  
- ChatGPT and Notion AI are perceived as the most useful tools; Phind scores lower in usefulness.  

These insights reveal patterns in AI adoption and help identify which tools are most effective for different student groups.

---

# 🚀 How to Use This Project

1. Run **schema.sql** to create the database structure.  
2. Execute **data_cleaning.sql** to prepare and standardize the data.  
3. Run **analysis.sql** to generate reports and insights.  
4. Check the **screenshots/** folder for tables and results.
