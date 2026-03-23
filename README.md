# ☕ Bright Coffee Shop — Sales Analysis
### BrightLearn | Case Study 1 | 2026

> **Role:** Junior Data Analyst  
> **Due Date:** 31 March 2026  
> **Objective:** Extract actionable insights from 6 months of transactional data to support the incoming CEO's revenue growth strategy.

---

## 📌 Project Overview

A new CEO has been appointed at Bright Coffee Shop with a clear mission — **grow revenue and improve product performance**. This project delivers a full end-to-end data analytics pipeline, from raw transactional records to an executive-ready CEO presentation, answering four core business questions:

- 📦 Which products generate the most revenue?
- 🕐 What time of day does the store perform best?
- 📈 What are the sales trends across products and time intervals?
- 💡 What can be done to improve sales performance?

---

## 📂 Dataset Overview

| Attribute | Detail |
|---|---|
| **File** | `Bright_Coffee_Shop_Sales.csv` |
| **Records** | 149,116 transactions |
| **Period** | 1 January 2023 — 30 June 2023 (6 months) |
| **Delimiter** | Semicolon (`;`) |
| **Store Locations** | Lower Manhattan · Hell's Kitchen · Astoria |

### Columns

| Column | Description |
|---|---|
| `transaction_id` | Unique identifier per transaction |
| `transaction_date` | Date of the transaction (`YYYY/MM/DD`) |
| `transaction_time` | Time of transaction (`HH:MM:SS`) |
| `transaction_qty` | Number of units sold |
| `store_id` | Internal store identifier |
| `store_location` | Store name / location |
| `product_id` | Internal product identifier |
| `unit_price` | Price per unit (may contain commas, e.g. `3,1` → `3.1`) |
| `product_category` | High-level category (e.g. Coffee, Tea, Bakery) |
| `product_type` | Sub-type within category (e.g. Drip coffee, Scone) |
| `product_detail` | Full product name and size |

### Product Categories in Dataset

`Coffee` · `Tea` · `Bakery` · `Drinking Chocolate` · `Coffee beans` · `Loose Tea` · `Packaged Chocolate` · `Flavours` · `Branded`

---

## 🗂️ Repository Structure

```
bright-coffee-shop-sales-analysis/
│
├── 📁 planning/
│   └── architecture_diagram.miro          # Data flow & ETL architecture (Miro export)
│
├── 📁 data/
│   └── Bright_Coffee_Shop_Sales.csv       # Source dataset (149,116 rows)
│
├── 📁 sql/
│   └── coffee_shop_analysis.sql           # All SQL transformation & analysis queries
│
├── 📁 analysis/
│   └── bright_coffee_shop_processed.xlsx  # Processed data with pivot tables & charts
│
├── 📁 presentation/
│   ├── methodology.docx                   # Analytical approach & methodology document
│   └── ceo_presentation.pptx             # Executive PowerPoint presentation
│
└── README.md
```

---

## 🏗️ Task Breakdown

### Task 1 — Planning & Architecture (Miro)

A Data Flow & Architecture Diagram was designed in Miro covering the full pipeline:

```
[CSV Source] → [Databricks Ingest] → [SQL Transforms] → [Excel Dashboard] → [CEO Presentation]
```

**Key insights scoped for delivery:**
- Revenue by product category and time intervals
- High-performing vs. low-performing products
- Total revenue calculations across 3 store locations

**Calculations outlined:**
- `total_amount = unit_price × transaction_qty`
- Grouping transactions into 30-minute time buckets
- Total units sold by product type and product detail

---


## 👤 Author

**Thato Mohale**  
Junior Data Analyst  
BrightLearn — Case Study 1 · 2026
