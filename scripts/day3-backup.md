
🗂️ Day 3 – Bash Script for Backup + Cron Scheduling
🎯 الهدف:

إنشاء سكريبت بسيط بلغة Bash يقوم بعمل نسخة احتياطية (Backup) لمجلد، وحفظ النسخة داخل مجلد مخصص. بعد ذلك، يتم جدولة السكريبت ليعمل تلقائيًا باستخدام أداة cron.
🛠️ محتوى السكريبت (day3-backup.sh):

#!/bin/bash

SOURCE_DIR="$HOME/projects"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/projects_backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
echo "✅ Backup created at: $BACKUP_FILE"

🧠 شرح السكريبت:
السطر	الشرح
SOURCE_DIR="$HOME/projects"	تحديد المجلد المطلوب أخذ نسخة احتياطية منه.
BACKUP_DIR="$HOME/backups"	تحديد مكان حفظ النسخة الاحتياطية.
DATE=$(date +%Y-%m-%d_%H-%M-%S)	توليد التاريخ والوقت الحالي لاستخدامه في اسم ملف النسخة.
BACKUP_FILE="$BACKUP_DIR/projects_backup_$DATE.tar.gz"	تحديد اسم النسخة الاحتياطية باستخدام التاريخ.
mkdir -p "$BACKUP_DIR"	إنشاء مجلد النسخ الاحتياطي إذا لم يكن موجودًا.
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"	ضغط مجلد المشروع وإنشاء نسخة .tar.gz.
echo ...	طباعة رسالة توضح مكان النسخة التي تم إنشاؤها.
⏰ جدولة السكريبت باستخدام cron:

لجدولة السكريبت ليعمل تلقائيًا كل يوم في منتصف الليل:

    افتح محرر الـ cron:

crontab -e

أضف السطر التالي في الملف:

    0 0 * * * /home/ahmed/devops-learning-journal/scripts/day3-backup.sh

    ✅ هذا السطر يعني:

        الساعة: 00:00 (منتصف الليل)

        كل يوم، كل شهر، كل سنة

        تشغيل السكريبت من المسار المحدد

    لحفظ الملف والخروج (لو كنت في vim):
    اضغط Esc ثم اكتب :wq ثم اضغط Enter.

✅ ملحوظات:

    تأكد إن السكريبت قابل للتنفيذ:

chmod +x day3-backup.sh

يمكنك عرض المهام المجدولة باستخدام:

    crontab -l

