#Importing CSV 
$csv = Import-Csv test.csv
$items = @()

#SQL DB Config
$dbconn = New-Object System.Data.SqlClient.SqlConnection
$dbconn.ConnectionString = "Server='servername'; Database='databasename'; Integrated Security=TRUE"

#Building Query
$cmd = $dbconn.CreateCommand()
$query = "INSERT INTO Persons (Name, Last, Age) VALUES (@name, @last, @age)"
$cmd.CommandText = $query
$cmd.Parameters.Add("@name", $Name) | Out-Null
$cmd.Parameters.Add("@last", $Last) | Out-Null
$cmd.Parameters.Add("@age", $Age) | Out-Null

#Reading CSV  
$csv | ForEach-Object {
    #Allocating CSV items into custom object
    $items += New-Object -Type PSCustomObject -Property `
    @{   
        'Name' = $_.Name
        'Last' = $_.Last
        'Age'  = $_.Age
    }
}

#Exporting CSV data to SQL DB
$dbconn.Open()

foreach($item in $items) {
    $Name = $item.Name
    $Last = $item.Last
    $Age = $item.Age
    #Exec Query
    $cmd.ExecuteNonQuery()
}
 
$dbconn.Close()