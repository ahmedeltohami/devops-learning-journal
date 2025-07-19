#!/bin/bash

# متغيرات
SOURCE_DIR="$HOME/projects"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/projects_backup_$DATE.tar.gz"

# تأكد إن مجلد الباك أب موجود، لو مش موجود اعمله
mkdir -p "$BACKUP_DIR"

# اعمل نسخة باك أب
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# اطبع رسالة تأكيد
echo "✅ Backup created at: $BACKUP_FILE"
