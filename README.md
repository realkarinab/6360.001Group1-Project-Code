# 6360.001Group1-Project-Code
The source code and dataset for our Implementation-Flavor project in CS6360.001

In this project, we utilized Neo4j as a graph database and MySQL as a relational database and compared the two. In this repository, we have included the queries used for both Neo4j and MySQL. We have also included the dataset we used to create the database in MySQL and Neo4j. 

Riya Gandhi, Karina Batra, Shamitha Thumma, Jeremiah De Luna

## Installation Instructions
### 1. MySQL Installation
**Step 1 Download MySQL:** 
Visit the official MySQL website to download the MySQL Community Server installer suitable for your operating system: [MySQL Downloads](https://dev.mysql.com/downloads/mysql/). For this project, we utilized MySQL version 8.0.36

**Step 2 Install MySQL:** 
Follow the installation instructions provided with the installer. 

**Step 3 Start MySQL Server:** 
After installation, start the MySQL server. On Unix-based systems, you can start MySQL using the command line. On Windows, you can do this from the Services panel. 

**Step 4: Download MySQL Workbench** 
Visit the official MySQL website to download MySQL Workbench: [MySQL Workbench Downloads](https://dev.mysql.com/downloads/workbench/). 

**Step 5: Install MySQL Workbench:** 
Follow the installation instructions provided with the installer. MySQL Workbench is a GUI tool for managing MySQL databases. It will allow you to easily setup the database and run SQL queries. 

**Step 6: Connect MySQL Workbench to MySQL Server**
After installation, launch MySQL Workbench. Use the connection details for your MySQL server to establish a connection from MySQL Workbench.


### 2. Neo4j Installation (AuraDB)

**Step 1: Sign Up for Neo4j Aura**
Visit the Neo4j Aura website and sign up for an account: Neo4j Aura

**Step 2: Create a New Aura Instance**
After signing up, log in to your Neo4j Aura account and create a new Aura instance by following the provided instructions. 

**Step 3: Access Aura Dashboard**
Once your Aura instance is created, access the Aura dashboard.

**Step 4: Connect to Aura Instance**
Use the connection details obtained in the previous step to connect to your Neo4j Aura instance from your application code or Neo4j Browser.

## Script Files
For our experiments involving MySQL and Neo4j, we conducted queries directly within the database management systems without the need for separate script files. The experiments were performed by running queries and directly through the MySQL Workbench interface and the Neo4j Browser interface. These queries can be found in this GitHub repository. 

We also discussed this with the professor. The professor confirmed that providing these query files is an acceptable approach to showcase our study. It should be noted that MySQL and Neo4j were the tools employed for our research.

In order to replicate this experiment, there are 3 general steps: 

 - Import the data from dataset folder found in this GitHub into Neo4j and MySQL 
 - Create the database schema according to the MySQL EER diagram and Neo4j Graph diagram found in the final report for each respective interface
 - Run each query found in MySQLQueries.sql and Neo4jQueries.cypher and record the timings for fetch and duration times
