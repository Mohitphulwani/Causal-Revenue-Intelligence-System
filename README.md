# Causal Revenue Intelligence System (C-RIS)
**Isolating $203,686 in Annual Profit Leakage via Propensity Score Matching**

##  Project Executive Summary
Aggressive discounting is often a "gut-feel" strategy that erodes margins without a clear understanding of incremental gain. Project C-RIS moves beyond descriptive analytics into **causal, decision-grade intelligence**. 

By implementing **Propensity Score Matching (PSM)**, I established a causal link showing that "High Discount" orders (>20%) result in an average loss of **$146.22** per order compared to statistically identical control orders ($p < 0.0001$). This framework identifies a total of **$203,686 in annual profit leakage** primarily driven by non-strategic discounting in specific regional categories.

---

##  The Technical Workflow

### 1. Enterprise Data Architecture (PostgreSQL/Supabase)
Instead of working with flat files, I architected a relational database to mirror a real-world production environment:
* **Star Schema Design:** Developed a robust schema with `dim_customers`, `dim_products`, and a `fact_orders` table to ensure data integrity and query performance.
* **Profitability Audits:** Built regional audit scripts to calculate net margin percentages and identify geographic "Profit Deserts."
* **Tableau Integration:** Created specialized SQL Views (`v_tableau_leakage_summary`) with forced type-casting and boolean logic to serve clean, aggregated data directly to the BI layer.

### 2. Causal Inference & Econometrics (Python)
To solve for **Selection Bias** (the fact that certain regions or categories are more likely to receive discounts), I utilized a "Synthetic Experiment" approach:
* **Propensity Score Matching (PSM):** Used Logistic Regression to calculate the probability of an order being "treated" (discounted) based on confounding variables like `Region`, `Category`, and `Quantity`.
* **Nearest Neighbor Matching:** Paired each high-discount order with a "Twin" control order to isolate the **Average Treatment Effect (ATE)** on profit.
* **Model Validation:** Conducted statistical significance testing to prove that the margin erosion was a direct result of the discount, not random variance.

### 3. Prescriptive Strategy & Visualization (Tableau)
The final output is a strategic dashboard designed for executive decision-making:
* **The "Culprit" Analysis:** Identified the **Furniture category in the Central region** as the primary source of drain, where discounts failed to lift volume enough to offset cost.
* **Sensitivity Simulation:** Provides a roadmap for implementing a **20% hard-cap on discounts** for specific segments, projected to recover ~$140k/year with zero predicted impact on retention.

---

##  Technical Stack
* **Data Engineering:** PostgreSQL (Supabase), Star Schema Modeling, SQL Views.
* **Data Science:** Python (Pandas, Scikit-Learn, Statsmodels, SQLAlchemy).
* **Econometrics:** Propensity Score Matching (PSM), Causal Inference.
* **BI:** Tableau (Geographic Risk Maps, Causal Verdict Bar Charts).

---

##  Key Strategic Insights
* **The "Tipping Point":** Discounts exceeding **20%** show a diminishing return on volume that fails to cover the marginal cost of the product.
* **Causal Impact:** Orders with high discounts result in a statistically significant average profit loss of **$146.22** compared to the control group.
* **Revenue Recovery:** By shifting from a "Volume-First" to a "Causal-Profit" strategy, the organization can reclaim **$203,686** in lost annual margin.

---
**Author:** Mohit Phulwani  
**Focus:** Bridging Behavioral Economics and Cloud-Native Data Science
