# ==============================================================================
# Script thực thi tuần tự các thực nghiệm Benchmark PoS trong PowerShell
# ==============================================================================

$ErrorActionPreference = "Stop"

# Chuyển về thư mục chứa script
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $ScriptDir

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " BẮT ĐẦU CHUỖI THỰC NGHIỆM BENCHMARK POS (PowerShell)" -ForegroundColor Cyan
Write-Host " Thư mục: $ScriptDir"
Write-Host " Bắt đầu: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan

$TotalStartTime = Get-Date

# --- Thực nghiệm 1 ---
Write-Host ""
Write-Host "[1/3] Đang thực thi Thực nghiệm 1 (benchmark_exp_1.py)..." -ForegroundColor Yellow
$Exp1Start = Get-Date
python benchmark_exp_1.py
$Exp1Duration = ((Get-Date) - $Exp1Start).TotalSeconds
Write-Host ">>> [1/3] Hoàn thành Thực nghiệm 1 trong $([math]::Round($Exp1Duration, 1)) giây." -ForegroundColor Green

# --- Thực nghiệm 2 ---
Write-Host ""
Write-Host "[2/3] Đang thực thi Thực nghiệm 2 (benchmark_exp_2.py)..." -ForegroundColor Yellow
$Exp2Start = Get-Date
python benchmark_exp_2.py
$Exp2Duration = ((Get-Date) - $Exp2Start).TotalSeconds
Write-Host ">>> [2/3] Hoàn thành Thực nghiệm 2 trong $([math]::Round($Exp2Duration, 1)) giây." -ForegroundColor Green

# --- Thực nghiệm 3 ---
Write-Host ""
Write-Host "[3/3] Đang thực thi Thực nghiệm 3 (benchmark_exp_3.py)..." -ForegroundColor Yellow
$Exp3Start = Get-Date
python benchmark_exp_3.py
$Exp3Duration = ((Get-Date) - $Exp3Start).TotalSeconds
Write-Host ">>> [3/3] Hoàn thành Thực nghiệm 3 trong $([math]::Round($Exp3Duration, 1)) giây." -ForegroundColor Green

$TotalDuration = ((Get-Date) - $TotalStartTime).TotalSeconds
Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host " TẤT CẢ 3 THỰC NGHIỆM ĐÃ HOÀN TẤT THÀNH CÔNG!" -ForegroundColor Cyan
Write-Host " Kết thúc: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" -ForegroundColor Cyan
Write-Host " Tổng thời gian: $([math]::Round($TotalDuration, 1)) giây" -ForegroundColor Cyan
Write-Host " Kết quả lưu tại: results" -ForegroundColor Cyan
Write-Host "======================================================================" -ForegroundColor Cyan
