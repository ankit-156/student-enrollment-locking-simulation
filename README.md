# 📘 Student Enrollment Locking Demo

This repository contains SQL scripts to demonstrate **concurrency control and locking mechanisms** in relational databases using a simple `StudentEnrollments` table.  
Each part highlights how **unique constraints, row-level locks, and transactions** ensure data integrity under concurrent access.

---

## 📂 Files
- `student_enrollment_locking.sql` – Complete SQL script containing:
  - Table creation with constraints  
  - Transactions to prevent duplicate enrollments  
  - `SELECT FOR UPDATE` row-level locking examples  
  - Consistency checks under concurrent transactions  
  - Final verification query  

---

## 📝 Problem Breakdown

### ✅ Part A – Prevent Duplicate Enrollments  
- Inserts student enrollments inside a transaction.  
- Uses **UNIQUE(student_name, course_id)** to ensure a student cannot enroll in the same course twice.  
- If two users try to insert the same `(student_name, course_id)`, only the first succeeds.  

---

### ✅ Part B – Row Locking with `SELECT FOR UPDATE`  
- Uses **`SELECT … FOR UPDATE`** to lock a row during verification.  
- While **User A** holds the lock, **User B** attempting to update the same row is **blocked until commit/rollback**.  
- Demonstrates **Isolation** and prevents dirty writes.  

---

### ✅ Part C – Demonstrating Consistency with Locking  
- Two concurrent transactions attempt to update the same record.  
- Row-level locking ensures updates are serialized.  
- Final state reflects only the **last committed transaction**, preventing race conditions.  

---

