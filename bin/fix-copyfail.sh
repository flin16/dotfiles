#!/bin/bash
set -e

TARGET="${1:-think}"

echo "=== 卸载 algif_aead 模块 ==="
ssh -t "$TARGET" "sudo rmmod algif_aead 2>/dev/null && echo '✅ 已卸载' || echo '⚠️  未加载或卸载失败'"

echo "=== 禁用开机加载 ==="
ssh -t "$TARGET" "echo 'blacklist algif_aead' | sudo tee /etc/modprobe.d/disable-afalg.conf >/dev/null && echo '✅ 已禁用'"

echo "=== 验证 ==="
ssh "$TARGET" "lsmod | grep algif_aead || echo '✅ 模块已卸载'"
