#!/bin/sh

# الانتقال إلى مجلد /tmp
cd /tmp

# تنزيل الملف من الرابط المباشر
wget -O /tmp/files.tar.gz "https://github.com/MARKETTV1/suptv/raw/refs/heads/main/files.tar.gz"

# فك الضغط عن الملف
tar -xzvf /tmp/files.tar.gz

# نقل المحتويات إلى /etc
mv /tmp/files/* /etc/

# تعديل الصلاحيات (اختياري)
chmod -R 644 /etc/*

# تنظيف الملفات المؤقتة (اختياري)
rm -rf /tmp/files.tar.gz /tmp/files

# إعادة التشغيل (اختياري)
reboot
