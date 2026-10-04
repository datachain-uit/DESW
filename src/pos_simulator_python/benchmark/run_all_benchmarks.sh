#!/bin/bash

# ==============================================================================
# Script thực thi tuần tự các thực nghiệm Benchmark PoS (Exp 1 -> Exp 2 -> Exp 3)
# ==============================================================================

set -e

# Tự động chuyển về thư mục chứa script (benchmark/)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Xác định lệnh python thích hợp trong môi trường
if command -v python.exe &>/dev/null && python.exe -V &>/dev/null; then
    PYTHON_CMD="python.exe"
elif command -v python3 &>/dev/null && python3 -V &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null && python -V &>/dev/null; then
    PYTHON_CMD="python"
else
    echo "❌ Lỗi: Không tìm thấy Python trong môi trường hiện tại!"
    exit 1
fi

echo "======================================================================"
echo " BẮT ĐẦU CHUỖI THỰC NGHIỆM BENCHMARK POS"
echo " Thư mục: $SCRIPT_DIR"
echo " Python:  $($PYTHON_CMD --version)"
echo " Bắt đầu: $(date '+%Y-%m-%d %H:%M:%S')"
echo "======================================================================"

TOTAL_START_TIME=$(date +%s)

# ------------------------------------------------------------------------------
# 1. Thực nghiệm 1
# ------------------------------------------------------------------------------
echo ""
echo "======================================================================"
echo " [1/3] Đang thực thi Thực nghiệm 1 (benchmark_exp_1.py)..."
echo " Cấu hình: Gini=0.8, Peers=2,000, Epochs=30,000"
echo " Bắt đầu lúc: $(date '+%Y-%m-%d %H:%M:%S')"
echo "======================================================================"
EXP1_START=$(date +%s)

$PYTHON_CMD benchmark_exp_1.py

EXP1_END=$(date +%s)
EXP1_DURATION=$((EXP1_END - EXP1_START))
echo ">>> [1/3] Hoàn thành Thực nghiệm 1 trong ${EXP1_DURATION} giây."

# ------------------------------------------------------------------------------
# 2. Thực nghiệm 2
# ------------------------------------------------------------------------------
echo ""
echo "======================================================================"
echo " [2/3] Đang thực thi Thực nghiệm 2 (benchmark_exp_2.py)..."
echo " Cấu hình: Random Distribution, Peers=10,000, Epochs=40,000"
echo " Bắt đầu lúc: $(date '+%Y-%m-%d %H:%M:%S')"
echo "======================================================================"
EXP2_START=$(date +%s)

$PYTHON_CMD benchmark_exp_2.py

EXP2_END=$(date +%s)
EXP2_DURATION=$((EXP2_END - EXP2_START))
echo ">>> [2/3] Hoàn thành Thực nghiệm 2 trong ${EXP2_DURATION} giây."

# ------------------------------------------------------------------------------
# 3. Thực nghiệm 3
# ------------------------------------------------------------------------------
echo ""
echo "======================================================================"
echo " [3/3] Đang thực thi Thực nghiệm 3 (benchmark_exp_3.py)..."
echo " Cấu hình: Random Distribution, Peers=5,000, Epochs=40,000, Scheduled Joins"
echo " Bắt đầu lúc: $(date '+%Y-%m-%d %H:%M:%S')"
echo "======================================================================"
EXP3_START=$(date +%s)

$PYTHON_CMD benchmark_exp_3.py

EXP3_END=$(date +%s)
EXP3_DURATION=$((EXP3_END - EXP3_START))
echo ">>> [3/3] Hoàn thành Thực nghiệm 3 trong ${EXP3_DURATION} giây."

# ------------------------------------------------------------------------------
# Tổng kết
# ------------------------------------------------------------------------------
TOTAL_END_TIME=$(date +%s)
TOTAL_DURATION=$((TOTAL_END_TIME - TOTAL_START_TIME))

echo ""
echo "======================================================================"
echo " TẤT CẢ 3 THỰC NGHIỆM ĐÃ HOÀN TẤT THÀNH CÔNG!"
echo " Kết thúc lúc: $(date '+%Y-%m-%d %H:%M:%S')"
echo " Tổng thời gian thực thi: ${TOTAL_DURATION} giây"
echo " Các file kết quả JSON đã được lưu tại: $SCRIPT_DIR/results/"
echo "======================================================================"
