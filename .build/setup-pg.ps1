
Write-Host Enabling PostgreSQL prepared transactions...
Add-Content 'C:\Program Files\PostgreSQL\9.5\data\postgresql.conf' "`nmax_prepared_transactions = 10"

Write-Host Enabling PostgreSQL SSL...
Add-Content 'C:\Program Files\PostgreSQL\9.5\data\postgresql.conf' "`nssl = true"

If (!(Test-Path $env:POSTGIS_EXE)) {
  Write-Host Downloading PostGIS...
  (New-Object Net.WebClient).DownloadFile("http://download.osgeo.org/postgis/windows/pg95/$env:POSTGIS_EXE", "$env:POSTGIS_EXE")
}

iex ".\$env:POSTGIS_EXE /S /D='C:\Program Files\PostgreSQL\9.5'"
