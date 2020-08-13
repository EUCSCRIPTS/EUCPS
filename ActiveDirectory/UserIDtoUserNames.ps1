#OneLiner to convert User ID to User Names

Import-Csv "C:\Temp\UserID.csv" | Select-Object  @{Name="SamAccountName";Expression={$_.UserId}} | Select -ExpandProperty SamAccountName | 
%{Get-ADUser -Filter {SamAccountName -eq $_} -Properties SamAccountName,DisplayName} | 
Select-Object SamAccountName,DisplayName| Export-csv "C:\Temp\UserName.csv" -Append -Notypeinformation 
