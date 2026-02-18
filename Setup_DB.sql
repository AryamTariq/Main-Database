-- 1. التأكد من وجود قاعدة البيانات واستخدامها
CREATE DATABASE IF NOT EXISTS DirayaAI_DB;
USE DirayaAI_DB;

-- 2. حذف الجدول إذا كان موجوداً مسبقاً للبدء من

-- 3. إنشاء جدول المستخدمين حسب مواصفات التقرير (صفحة 34 وما بعدها)
DROP TABLE IF EXISTS Users;

-- 3. إنشاء جدول المستخدمين المطور (Users Table)
-- يطابق تماماً مواصفات صفحة 34-35 في التقرير
CREATE TABLE Users (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,          -- معرف داخلي للنظام
    id_number VARCHAR(20) UNIQUE NOT NULL,           -- الرقم الجامعي (المفتاح الأساسي الفعلي للربط)
    first_name VARCHAR(50) NOT NULL,                 -- الاسم الأول
    last_name VARCHAR(50) NOT NULL,                  -- اسم العائلة
    Full_Name VARCHAR(150) GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)) STORED, -- دمج الاسم تلقائياً (احترافي)
    email VARCHAR(100) UNIQUE NOT NULL,              -- البريد الإلكتروني
    Password_Hash VARCHAR(255) NOT NULL,             -- كلمة المرور (مشفرة)
    role ENUM('طالبة', 'مشرفة') NOT NULL,             -- الدور
    Phone_Number VARCHAR(15) NULL,                   -- رقم الجوال
    Is_Active BOOLEAN DEFAULT TRUE,                  -- حالة الحساب
    Last_Login DATETIME NULL,                        -- آخر ظهور
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP    -- تاريخ التسجيل
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 4. إدخال بيانات الـ 9 طالبات (فريق العمل) والمشرفات
-- تم استخدام باسورد افتراضي لكل طالبة (يمكن تغييره لاحقاً)
INSERT INTO Users (id_number, first_name, last_name, email, Password_Hash, role) VALUES 
('44202652', 'أريام', 'طارق جشان', 'S44202652@students.tu.edu.sa', 'hash_44202652', 'طالبة'),
('44206814', 'جود', 'سعد العوفي', 'S44206814@students.tu.edu.sa', 'hash_44206814', 'طالبة'),
('44201827', 'منيرة', 'سعد الغامدي', 'S44201827@students.tu.edu.sa', 'hash_44201827', 'طالبة'),
('44201778', 'فوز', 'عبدالله العتيبي', 'S44201778@students.tu.edu.sa', 'hash_44201778', 'طالبة'),
('44205921', 'أمل', 'حسين المالكي', 'S44205921@students.tu.edu.sa', 'hash_44205921', 'طالبة'),
('44106628', 'شهد', 'سفر العتيبي', 'S44106628@students.tu.edu.sa', 'hash_44106628', 'طالبة'),
('44200573', 'منار', 'محسن السفياني', 'S44200573@students.tu.edu.sa', 'hash_44200573', 'طالبة'),
('44200626', 'وجد', 'محمد السلمي', 'S44200626@students.tu.edu.sa', 'hash_44200626', 'طالبة'),
('44118635', 'نوران', 'شاكر النمري', 'S44118635@students.tu.edu.sa', 'hash_44118635', 'طالبة'),
-- إضافة الدكتورة (المشرفة)
('1001', 'د. أريج', 'محجب', 'areej@tu.edu.sa', 'admin_hash_2026', 'مشرفة');

-- 5. عرض النتائج للتأكد من اكتمال الفريق
SELECT id_number, Full_Name, email, role, Is_Active FROM Users;