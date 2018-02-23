# ExportCSVtoSQL_PowerShell
PowerShell Script to read and export a CSV file to a SQL Server Database

## How to use:

1. Create your SQL database:

```sql
  CREATE TABLE Persons (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(255) NOT NULL,
    Last varchar(255),
    Age varchar(10)
  );
```

2. Configure your database connection string at `ln 7`

3. Run script

License: MIT
