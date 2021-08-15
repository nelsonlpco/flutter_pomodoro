#!/usr/bin/env pwsh

Write-Host "Running the Flutter analyzer"-ForegroundColor Green 
$result = flutter analyze

if ($result.Length -eq 0) { 
    Write-Host "is valid" -ForegroundColor Green
    exit 1
}
else { 
    Write-Host "in invalid $M" -ForegroundColor Red
    exit 1
}
fi