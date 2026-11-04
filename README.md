# 📊 Telecom Customer Churn & Revenue Loss Analysis

<img width="998" height="557" alt="Dashboard image" src="https://github.com/user-attachments/assets/2cf8dea0-26a7-4d0e-bb04-f1ea3d96a4cf" />


## 📌 Executive Summary
Customer churn poses a significant threat to subscription-based telecommunication companies. This project delivers an **end-to-end data analysis pipeline** analyzing **7,043 customer records** to uncover primary retention bottlenecks, quantify financial revenue loss, and evaluate operational churn drivers.

By leveraging **SQL**, **Python (pandas)**, and **Power BI**, this project identifies key churn patterns across contract structures, internet service types, billing methods, and customer service support.

---

## 💡 Key Business Insights

* **High Financial Impact:** Total customer churn rate stands at **26.54%** (1,869 subscribers), resulting in a cumulative revenue loss of **$3.68M**.
* **Contract Volatility:** Month-to-Month contract holders exhibit a **46% churn rate**, compared to **11%** for 1-year contracts and **3%** for 2-year contracts.
* **Competitor Pressure:** Competitors offering superior device models and higher download speeds represent the top reported churn drivers ($1.16M total revenue lost).
* **Impact of Premium Tech Support:** Fiber Optic subscribers without Premium Tech Support churn at **48.19%**, whereas subscribing to tech support reduces Fiber Optic churn to **17.73%**.
* **Payment Method Risk:** Customers paying via Mailed Check (**41.4%**) or Bank Withdrawal (**35.6%**) churn at more than double the rate of automated Credit Card users (**15.8%**).

---

## 🛠️ Tech Stack & Workflow Pipeline
```text
[ PostgreSQL Database ]  --->  [ Python (Pandas) ]  --->  [ Clean CSV Staging ]  --->  [ Power BI ]
 Data Extraction &             Data Cleaning, Feature         Refined Dataset          Interactive Dashboard
 Aggregations                  Engineering & Binning                                   & DAX Modeling
```
---

| Tool | Role in Pipeline | Key Features Used |
| :--- | :--- | :--- |
| **SQL (PostgreSQL)** | Data Staging & Aggregation | DDL Table Creation, Data Import, Baseline Business Queries & Aggregations |
| **Python** | Data Cleaning & Feature Engineering | `pandas`, `numpy`, Missing Value Imputation, Custom Binning (`Tenure Groups`), Feature Flagging |
| **Power BI** | Data Modeling & Interactive BI | DAX (`CALCULATE`, `DIVIDE`, `COUNT`), Custom Visual Formatting, Dynamic Slicers |

---

## 📊 Power BI Dashboard Highlights

The interactive dashboard features:
1. **Executive KPI Cards:** Tracking total customers (`7,043`), total churned (`1,869`), churn rate (`26.54%`), lost revenue (`$3.68M`), and ARPU (`$63.60`).
2. **Contract & Tenure Breakdown:** Highlighting high churn during the initial 0–6 month customer onboarding period.
3. **Service & Tech Support Matrix:** Visualizing the retention boost provided by service add-ons.
4. **Lost Revenue Drivers:** Ranking primary churn reasons by direct dollar impact.
5. **Dynamic Filter Controls:** Interactive side panel slicers for `Offer`, `Internet Type`, `Payment Method`, and `Customer Risk Tier`.

---

## 🎯 Actionable Strategic Recommendations

1. **Incentivize Contract Upgrades:** Offer targeted promotional discounts to transition high-value Month-to-Month subscribers onto 1- or 2-year fixed plans.
2. **Bundle Tech Support with Fiber Optic:** Include 3 months of complimentary Premium Tech Support with new Fiber Optic activations to curb early-tenure drop-offs.
3. **Drive Automatic Payment Adoption:** Implement a small monthly discount (e.g., $2/month) for customers switching to automated Credit Card billing.

---

## 👤 Author
* **Aman Singh Rawat**
* **Role:** Aspiring Data Analyst
* **Skills:** SQL, Python (pandas, NumPy), Power BI, Data Warehousing, Statistical Analysis

