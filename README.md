# Freelancer Project Tracker

A MySQL database system for freelancers to manage clients, projects, and payments efficiently.

## 🛠 Tech Stack

![MySQL](https://img.shields.io/badge/Database-MySQL-blue?logo=mysql&style=flat-square)
![Git](https://img.shields.io/badge/Version%20Control-Git-orange?logo=git&style=flat-square)
![Platform: GitHub](https://img.shields.io/badge/Platform-GitHub-181717?logo=github&style=flat-square)
![Docs: Markdown](https://img.shields.io/badge/Docs-Markdown-lightgrey?logo=markdown&style=flat-square)

## 📌 Scenario

This project models a real-world scenario where freelancers need to track:

- Client details
- Project assignments, deadlines, and budgets
- Payment records and methods

View [**`scenario_description.txt`**](./scenario_description.txt) for detailed scenario info!

## 🗃️ Schema Overview

- **Clients**: Stores client contact and company info
- **Projects**: Linked to clients, with optional descriptions, deadlines, and budget info
- **Payments**: Tracks amount, date, and payment method per project

## 🚀 Getting Started

- Import [**`freelancer_db.sql`**](./freelancer_db.sql) into your MySQL environment to create and populate the database.
- Run the sample queries to interact with the data.

## 🧪 Sample Queries

### 🔹 List all upcoming projects

```sql
SELECT title, deadline FROM Projects WHERE deadline > CURDATE();
```

### 🔹 Projects per client

```sql
SELECT c.name, COUNT(p.project_id) FROM Clients c LEFT JOIN Projects p ON c.client_id = p.client_id GROUP BY c.client_id;
```

### 🔹 Total payments by method

```sql
SELECT method, SUM(amount) FROM Payments GROUP BY method;
```

---

<div align="center">
    <p>
        <strong style="font-weight: bold;">MIT Licensed • © 2025 Herald Inyang •</strong> 
        <a href="https://github.com/HERALDEXX" target="_blank">
            <img src="https://img.shields.io/badge/GitHub-HERALDEXX-000?style=flat-square&logo=github" alt="GitHub Badge" style="vertical-align: middle;" />
        </a>
    </p>
    <p>
        <a href="./LICENSE">
            <img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square" alt="MIT License" style="vertical-align: middle;" />
        </a>
    </p>
</div>

---
