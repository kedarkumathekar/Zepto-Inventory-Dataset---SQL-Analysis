# 🛒 Zepto Inventory Analysis — SQL Project

A structured SQL project that explores a real-world e-commerce inventory dataset from **Zepto**, India's quick-commerce grocery platform. The analysis covers data setup, cleaning, and solving business questions to uncover actionable insights.

---

## 📁 Dataset

- **Source:** [Kaggle — Zepto Inventory Dataset]((https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset))
- **Database:** `customer_behaviour`
- **Table:** `zepto`
- **Key columns:** `name`, `category`, `mrp`, `discountedSellingPrice`, `discountPercent`, `weightInGms`, `availableQuantity`, `outOfStock`

---

## 🔧 Project Workflow

### 1. Database Setup
- Loaded the dataset into a MySQL database under the schema `customer_behaviour`
- Renamed a malformed column (`ï»¿Category → Category`) caused by a UTF-8 BOM encoding issue
- Added a surrogate primary key column `sku_id` using `AUTO_INCREMENT`

### 2. Data Exploration
- Counted total rows and previewed sample records
- Checked for **NULL values** across all key columns
- Identified **distinct product categories**
- Assessed **in-stock vs. out-of-stock** product distribution
- Flagged **duplicate product names** (products with multiple SKU entries)

### 3. Data Cleaning
- Removed records where `mrp = 0` (invalid/incomplete entries)
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** (÷ 100)
- Engineered a new categorical column `Weight_category` (`Low` / `Medium` / `Bulk`) based on product weight

---

## 💼 Business Questions Answered

| # | Question |
|---|----------|
| Q1 | Top 10 best-value products by highest discount percentage |
| Q2 | High-MRP products that are currently out of stock |
| Q3 | Estimated revenue per category (discounted price × available quantity) |
| Q4 | Products with MRP > ₹500 but discount less than 10% |
| Q5 | Top 5 categories offering the highest average discount |
| Q6 | Price per gram for products above 100g (value-for-weight ranking) |
| Q7 | Product segmentation by weight: Low (<1kg), Medium (<5kg), Bulk (5kg+) |
| Q8 | Total inventory weight per category (in kg) |

---

## 🛠️ Tools Used

- **MySQL** — database creation, querying, and data manipulation
- **SQL concepts** — `ALTER TABLE`, `UPDATE`, `DELETE`, `CASE WHEN`, `GROUP BY`, `HAVING`, `ORDER BY`, aggregate functions, and `DISTINCT`

---

## 📂 Repository Structure

```
zepto-sql-analysis/
│
├── Zepto_SQL_analysis.sql    # Full SQL script: setup, cleaning & analysis
└── README.md                 # Project documentation
```

---

## 🚀 How to Run

1. Import the Zepto dataset CSV into your MySQL environment
2. Create the schema: `CREATE DATABASE customer_behaviour;`
3. Run `Zepto_SQL_analysis.sql` sequentially in your SQL client (MySQL Workbench, DBeaver, etc.)

---

## 📌 Key Insights (Sample)

- Several high-MRP products remain out of stock, indicating potential demand gaps worth restocking
- Certain categories offer significantly higher average discounts, useful for promotional targeting
- The price-per-gram metric reveals meaningful value differences within the same category
- Bulk-weight products constitute a small but high-revenue segment of the inventory

---

## 👤 Author

**Kedar**
Data Analyst
*Skills: SQL · Excel · Power BI · Python · Statistical Analysis*
