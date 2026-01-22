# Causal-Revenue-Intelligence-System
An end-to-end causal inference project identifying $203,686 in annual profit leakage. This system utilizes SQL for data orchestration, Python (Propensity Score Matching) to isolate causal drivers of loss, and Tableau to deliver strategic business insights.
# 🎯 Causal Revenue Intelligence System (C-RIS)

### **Executive Summary**
This project identifies a significant profit leakage of **$203,686 annually** directly linked to aggressive discounting strategies. By implementing **Propensity Score Matching (PSM)** in Python, I established a causal link showing that "High Discount" orders result in an average loss of **$146.22** compared to identical "Control" orders, with a statistical significance of **p < 0.0001**.

---

## 🚀 The Business Problem
In retail environments, high discounts are often used to drive sales volume. However, without causal analysis, it is difficult to determine if those discounts are truly driving incremental profit or simply eroding margins. 

**Research Question:** What is the true causal effect of high discounts (>20%) on profit when controlling for confounding variables like Region, Category, and Order Quantity?

---

## 🛠️ Technical Stack & Workflow
This project demonstrates a full-stack data analytics pipeline:

* **SQL:** Data extraction, categorical binning, and preliminary profit variance analysis.
* **Python (Pandas, Scikit-Learn, Statsmodels):** * Developed a **Logistic Regression** model to calculate Propensity Scores.
    * Utilized **Nearest Neighbor Matching** to create balanced groups.
    * Validated results through **Placebo Tests** to ensure model robustness.
* **Tableau:** Created a strategic executive dashboard featuring geographic risk maps, causal verdict bar charts, and interactive sensitivity filters.

---

## 📂 Project Structure
```text
├── sql/                    # SQL scripts for data extraction and prep
│   ├── 01_data_prep.sql
│   └── 02_profit_leakage_queries.sql
├── notebooks/              # Python Causal Analysis logic
│   └── causal_inference_model.ipynb 
├── tableau/                # Dashboard workbook and preview
│   ├── Revenue_Intelligence_Final.twbx
│   └── dashboard_screenshot.png
├── data/                   # Processed datasets
│   └── matched_orders_final.csv
└── README.md               # Project documentation
