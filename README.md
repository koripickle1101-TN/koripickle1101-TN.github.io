# Denial Detective: From SQL to Strategy 🕵️‍♂️

**Project Overview:** A Healthcare Informatics case study transforming billing-level denial patterns into enterprise-level ROI through SQL-driven automation and statistical monitoring.

---

## 💰 The Bottom Line: $166,500 Total Impact
By identifying and correcting a systemic 5-digit member ID truncation error, this project achieves:
* **Recovered Revenue:** **$150,000** annually by converting "Soft Denials" into paid claims.
* **FTE Efficiency:** **3,000 hours** of manual rework eliminated, reclaiming roughly **1.5 Full-Time Equivalents (FTEs)** for high-value revenue cycle tasks.

## 🛠️ The "Engine": SQL Logic
The core of this project uses **BigQuery/SQL** to isolate the "smoking gun." 
* **Pattern Recognition:** Using `AVG(LEN(member_id))` to prove that specific payers were receiving truncated IDs.
* **Payer Offender Table:** A window-function-driven query that ranks payers by their contribution to the total error volume.

## 🛡️ The "Shield": 2σ Automated Monitoring
To ensure the fix remains sustainable, I engineered a **2-sigma (2σ) warning flag** on the Clean Claim Rate (CCR). 
* **Statistical Logic:** If the CCR drops more than two standard deviations from the 83% mean, an automated alert triggers.
* **Proactive Defense:** This allows the informatics team to identify new payer rule changes before they impact the bottom line.

---
### 📂 Repository Structure
- `/sql/`: Production-ready scripts for denial analysis and CCR monitoring.
- `DATA_TRANSFORMS.md`: Documentation on data anonymization and HIPAA compliance.
