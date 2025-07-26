#!/bin/bash

echo "🔧 Bắt đầu cài đặt GVM và Go..."

# 1. Cài GVM (Go Version Manager)
bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# 2. Nạp gvm
source ~/.gvm/scripts/gvm

# 3. Cài Go 1.17.13 (bắt buộc để build các bản Go >1.17)
cd /usr/local || exit
sudo wget https://go.dev/dl/go1.17.13.linux-amd64.tar.gz
sudo tar -xzf go1.17.13.linux-amd64.tar.gz
sudo rm go1.17.13.linux-amd64.tar.gz

# 4. Set env tạm thời
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH

# 5. GVM sử dụng Go để build Go 1.20
gvm install go1.20 -B

# 6. Dùng Go 1.20 làm mặc định
gvm use go1.20 --default

# 7. In version để xác nhận
go version

# 8. Cleanup: gỡ Go 1.17.13 khỏi /usr/local
sudo rm -rf /usr/local/go

echo "✅ Đã cài xong GVM + Go 1.20 (dùng GVM). Ready!"
