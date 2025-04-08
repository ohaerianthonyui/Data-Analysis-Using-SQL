### Data Analysis Project Report: Promotions Effectiveness at AtliQ Mart

---

#### **Project Overview**

The objective of this analysis was to evaluate the effectiveness of promotional campaigns run by AtliQ Mart across 50 supermarkets during the Diwali 2023 and Sankranti 2024 festive periods. This report includes insights into promotional performance across different product categories, promotional types, store locations, and specific products. The findings aim to provide actionable insights to the Sales Director to optimize future promotional strategies.

---

#### **Data Cleaning and Methodology**

- **Data Source**: SQL was used to pull data from multiple tables: `dim_campaigns`, `dim_products`, `dim_stores`, and `fact_events`.
- **Data Cleaning**: During the analysis, any inconsistencies in the data were resolved by ensuring that all necessary fields (like `promo_type`, `product_code`, `store_id`) were correctly joined. Missing or null values in critical fields like `quantity_sold_before_promo` and `quantity_sold_after_promo` were handled with proper filtering techniques to avoid any misleading conclusions.

---

### **Business Requests and Insights**

---

#### **1. Products with Base Price Greater than 500 Featured in 'BOGOF' Promo Type**

- Products like **Atliq Double Bedsheet**, **Atliq Waterproof Immersion Rod**, and **Atliq Double Bedsheet Set** were identified as high-value products that were heavily discounted through the 'BOGOF' promotion type. These products have a base price greater than 500 and were actively featured in promotional campaigns.

  ![base price  500](https://github.com/user-attachments/assets/e4e41632-7e83-462d-811a-76c2a2ccf6a3)

  
---

#### **2. Overview of Store Count by City**

- **Bengaluru** had the highest store count with **10 stores**.
- **Chennai** followed with **8 stores**, and **Hyderabad** had **7 stores**.
- Other cities with significant store presence included **Coimbatore** (5 stores) and **Visakhapatnam** (5 stores).
  
This breakdown is critical for assessing regional store performance and optimizing resource allocation.

![Store count in each city](https://github.com/user-attachments/assets/7c905fc0-89a2-4e29-a246-f58d161648d9)


---

#### **3. Revenue Before and After Promotional Campaigns**

- **Diwali Campaign**: 
  - **Before Promotion**: ₹82,573,759
  - **After Promotion**: ₹207,456,209
- **Sankranti Campaign**: 
  - **Before Promotion**: ₹58,127,429
  - **After Promotion**: ₹140,403,941

Both campaigns showed a significant increase in revenue, indicating the effectiveness of the promotional strategies implemented during these festive periods.

![total revenue generated before and after](https://github.com/user-attachments/assets/43b0c03c-47e3-42d4-8e5f-2e0fe4379d54)


---

#### **4. Incremental Sold Quantity (ISU%) for Each Category During Diwali Campaign**

The **Home Appliances** category saw the highest increase in sales, with an **ISU% of 244%**, followed by:
- **Combo 1**: **202% ISU%**
- **Home Care**: **79% ISU%**
- **Personal Care**: **31% ISU%**
- **Grocery & Staples**: **18% ISU%**

This analysis highlights the categories most positively impacted by the Diwali campaign.

![Incremental sold quantity(ISU%)](https://github.com/user-attachments/assets/b1e40b6e-43e4-4817-ab5d-5782ec481e3c)


---

#### **5. Top 5 Products Ranked by Incremental Revenue Percentage (IR%)**

The following products showed the highest incremental revenue percentage:
- **Atliq Waterproof Immersion Rod (Home Appliance)**: **266% IR%**
- **Atliq High Glo 15W LED Bulb (Home Appliances)**: **262% IR%**
- **Atliq Double Bedsheet Set (Home Care)**: **258% IR%**
- **Atliq Curtains (Home Care)**: **255% IR%**
- **Atliq Home Essential Product Combo**: **183% IR%**

These products performed significantly well in driving incremental revenue.

![Incremental revenue of products](https://github.com/user-attachments/assets/8a831dac-e8cb-4d38-ba1a-05e46ff65e94)



---

#### **Store Performance Insights**

- **Top 10 Stores by Incremental Revenue**: Stores like **STMYS-1**, **STCHE-4**, and **STBLR-6** saw the highest incremental revenue, indicating high-performing locations.
- **Bottom 10 Stores by Incremental Sold Units (ISU)**: Stores such as **STVSK-3**, **STHYD-1**, and **STCHE-1** had the least impact in terms of incremental units sold, suggesting that some stores did not fully capitalize on the promotional period.

The performance variation by city showed that cities like **Bengaluru** (10 stores) and **Madurai** (4 stores) had a high average ISU%.

![Top 10 stores in terms of incremental revenue generated from the promotion](https://github.com/user-attachments/assets/589b6837-f5ac-442d-b6b2-f564d31133da)

![bottom ten stores in terms of ISU%](https://github.com/user-attachments/assets/394d7fd2-da39-4617-a6a0-be50c63003fb)

![-How does the performance of stores vary by city](https://github.com/user-attachments/assets/169bd508-30fc-4c35-bcc3-bcbaa6afe383)



---

#### **Promotion Type Analysis**

- **Top Promotions by Incremental Revenue**:
  - **500 Cashback** and **BOGOF** promotions stood out, with incremental revenue of ₹122,643,000 and ₹69,316,990, respectively.
- **Bottom Promotions by Incremental Sold Units**:
  - Promotions like **25% OFF** and **50% OFF** showed lower sales increases, with incremental units sold at **-5717** and **6931**, respectively.
 

  
There was a **significant difference in the performance** between **discount-based promotions** and **BOGOF or Cashback** promotions. BOGOF and Cashback promotions outperformed traditional discounts in both incremental revenue and ISU%.

- **Best Promotion for Balance Between ISU and Revenue**: Promotions like **BOGOF**, **500 Cashback**, **33% Off**, **50% Off**, and **25% Off** struck a balance by increasing both the quantity sold and revenue generated.

---


  ![What are the two promotions that resulted in the highest incremental revenue](https://github.com/user-attachments/assets/1c2d6d7f-5240-4708-a767-87a72c43f0ba)

  
![which promotion strikes best balance between incremental sold units and maintaining healthy margin](https://github.com/user-attachments/assets/8972b1ca-30c7-4c23-b426-bdc559e78491)


![bottom two promotion types in terms of their impact on the incremental sold units](https://github.com/user-attachments/assets/2f4800df-b8e4-4a5b-b152-5e4032a31fa1)


#### **Product and Category Performance**

- **Category Performance**:
  - **Grocery & Staples** saw the most significant lift in sales, followed by **Combo1** and **Home Appliances**.
  
- **Products That Responded Poorly to Promotions**:
  - **Atliq Fusion Container Set of 3** and **Atliq Scrub Sponge for Dishwash** did not perform well in terms of revenue generation after promotion.

- **Correlation Between Category and Promo Effectiveness**:
  - A **positive correlation** was found between product categories and promotional type effectiveness, with categories such as **Home Appliances** and **Home Care** responding particularly well to campaigns.

![Which product category saw the most significant lift in sales from the promotion](https://github.com/user-attachments/assets/48b6410a-7331-41c7-b783-4097a622f1d0)

![Are there specific prodcuts that respond well or poorly to promotions](https://github.com/user-attachments/assets/c722e49d-0461-4859-9c31-83834a170ed0)


![Correlation between product category and promo type effectiveness](https://github.com/user-attachments/assets/4a44d8e4-2ce1-4600-99fb-dd23d7c32429)



---


### **Conclusions**

- **High-Value Products**: Products with a base price above ₹500, particularly in the **Home Appliances** category, were highly discounted in **BOGOF** promotions.
- **Revenue Growth**: Both the **Diwali** and **Sankranti** campaigns successfully increased revenue, particularly in high-performing categories such as **Home Appliances**.
- **Promotional Type Performance**: Promotions like **BOGOF** and **500 Cashback** were highly effective, generating significant incremental revenue and sales increases.
- **Store and City Performance**: Performance varied by location, with cities like **Bengaluru** and **Madurai** seeing the highest store counts and sales uplift.

---

### **Recommendations**

1. **Promotional Focus**: Future campaigns should focus more on **BOGOF** and **500 Cashback** promotions, as they demonstrated the highest effectiveness in terms of both revenue and sales.
2. **Product Selection**: High-value products (base price > ₹500) in categories such as **Home Appliances** should be targeted more frequently for **BOGOF** or **Cashback** promotions.
3. **Regional Optimization**: Cities with higher store counts, such as **Bengaluru** and **Chennai**, should be prioritized for future large-scale campaigns due to their higher sales potential.
4. **Monitor Underperforming Products**: Products like **Atliq Fusion Container Set** and **Atliq Scrub Sponge** that did not perform well should be reviewed for better promotion alignment or price adjustments.

This analysis provides a comprehensive overview of the current promotional strategies and offers actionable insights for AtliQ Mart’s future promotions.
