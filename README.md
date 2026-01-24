# Project title: User management
# Project version: 0.0.1-SNAPSHOT

---

## Software Versions

- **Java JDK**: 17
- **Spring Boot**: 3.5.9
- **PostgreSQL**: 17.4 (64-bit, Windows, compiled by msvc-19.42.34436)
- **Maven**: Included in IntelliJ project (no wrapper used)
- **Bootstrap**: 5.3.8
- **Thymeleaf**: Included via Spring Boot starter

---

## Installation and Running Instructions

### P1) Install Java JDK 17

### P2) Install PostgreSQL 17.4
- **Default username:** `postgres`
- **Default password:** `1q2w3e` (can change if desired)
- **Default port:** `5432`

### P3) Create Database
- **Connect to PostgreSQL using pgAdmin/DBeaver or psql**
- **Create database:**
  ```sql
  CREATE DATABASE user_management;
  ```

### P4) Configure Spring Boot Project
- **Edit `application.yaml`** - if you change database name, username, or password, update them here accordingly
- **Run the application from `StudentManagementApplication.java`** - automatically starts the app on port 4000 (modified by me) and automatically creates the tables

### P5) Persistence Layer
- **Entities** are annotated with JPA annotations (`@Entity`, `@Id`, `@GeneratedValue`, etc.)
- **Repositories** extend `JpaRepository` for CRUD operations
- **Service layer** handles business logic

### P6) Controllers
- **Controllers** map HTTP requests to services and return Thymeleaf views
- **Templates** are in `src/main/resources/templates/`

### PX) Compile and Run

#### Using IntelliJ IDEA:
- Right-click `StudentManagementApplication.java` → **Run**
- Open browser at: **http://localhost:4000/user-management**

#### Using Maven:
```bash
mvn clean install
mvn spring-boot:run
```

---

## Notes

- Default username/password and database name are already configured, but you can change them as needed
- Tables are auto-created on application startup
- Default server port is **4000** and context path is **/user-management**

## Optional: Database Initialization Scripts

- **The database schema (tables) is automatically created on application startup** using Hibernate (`ddl-auto: update`)
- **Optional SQL scripts** can be executed to populate the database with initial/test data
- These scripts are **not mandatory** for running the application
- These SQL scripts are located in /resources/db
- A database backup (SQL format) is also provided in the same directory in case a restore is needed