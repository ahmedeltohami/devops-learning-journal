# 📦 Day 3 – Backup Script + Cron Job

## 🎯 الهدف

إنشاء سكريبت بسيط بلغة Bash يقوم بعمل نسخة احتياطية (Backup) من مجلد معين، وحفظ النسخة داخل مجلد مخصص. بعد كده، بنستخدم أداة `cron` لجدولة السكريبت عشان يشتغل تلقائيًا كل يوم في وقت محدد.

---

## 🛠️ محتوى السكريبت (`day3-backup.sh`)

```bash
#!/bin/bash

SOURCE_DIR="$HOME/projects"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/projects_backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
echo "✅ Backup created at: $BACKUP_FILE"

🧠 شرح السكريبت
السطر	الشرح
SOURCE_DIR="$HOME/projects"	تحديد المجلد اللي عايز أعمل له نسخة احتياطية.
BACKUP_DIR="$HOME/backups"	تحديد مكان حفظ النسخ الاحتياطية.
DATE=$(date +%Y-%m-%d_%H-%M-%S)	توليد التاريخ والوقت الحالي بصيغة مناسبة لأسماء الملفات.
BACKUP_FILE="$BACKUP_DIR/projects_backup_$DATE.tar.gz"	تحديد اسم النسخة مع التاريخ بامتداد .tar.gz.
mkdir -p "$BACKUP_DIR"	إنشاء مجلد النسخ الاحتياطي إذا مش موجود.
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"	ضغط مجلد projects وإنشاء ملف النسخة.
echo "✅ ..."	طباعة مسار النسخة بعد الإنشاء.
⏰ جدولة السكريبت باستخدام Cron
الخطوات:

    فتح محرر الجدولة:

crontab -e

إضافة السطر التالي في الملف:

    0 0 * * * /home/ahmed/devops-learning-journal/scripts/day3-backup.sh

    ✅ هذا السطر يعني:

        الدقيقة 0

        الساعة 0 (منتصف الليل)

        كل يوم

        كل شهر

        كل يوم في الأسبوع

        يعني السكريبت هيشتغل كل يوم الساعة 12 منتصف الليل تلقائيًا.

    للحفظ والخروج من محرر vim:

        اضغط Esc

        اكتب :wq

        اضغط Enter

✅ ملاحظات

    تأكد إن السكريبت قابل للتنفيذ:

chmod +x day3-backup.sh

اعرض المهام المجدولة:

crontab -l

تأكد من وجود المجلد /home/ahmed/projects علشان السكريبت يشتغل.
