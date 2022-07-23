-- CreateEnum
CREATE TYPE "EnterpriseType" AS ENUM ('CLINIC', 'HOSPITAL', 'PHARMACY', 'OTHER');

-- CreateEnum
CREATE TYPE "EnterpriseStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "EmployeeStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "PatientStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "MedicStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('SUPERADMIN', 'ADMIN', 'ADMINSERVICES', 'WAREHOUSEMAN', 'CASHIER', 'COUNTER', 'APPOINTMENTMANAGER');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'INACTIVE');

-- CreateTable
CREATE TABLE "type_document" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "type_document_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "proffesion" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "proffesion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "especiality" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "proffesion_id" TEXT NOT NULL,

    CONSTRAINT "especiality_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "country" (
    "id" TEXT NOT NULL,
    "name_country" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "departament" (
    "id" TEXT NOT NULL,
    "name_departament" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "country_id" TEXT NOT NULL,

    CONSTRAINT "departament_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "district" (
    "id" TEXT NOT NULL,
    "name_district" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "departament_id" TEXT NOT NULL,

    CONSTRAINT "district_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "province" (
    "id" TEXT NOT NULL,
    "name_province" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "district_id" TEXT NOT NULL,

    CONSTRAINT "province_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "headquarter" (
    "id" TEXT NOT NULL,
    "name_headquarter" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "country_id" TEXT NOT NULL,
    "departament_id" TEXT NOT NULL,

    CONSTRAINT "headquarter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "enterprise" (
    "id" TEXT NOT NULL,
    "name_enterprise" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "document_type_id" TEXT NOT NULL,
    "document_number" TEXT NOT NULL,
    "number_employee" INTEGER NOT NULL,
    "status_employee" "EnterpriseStatus" DEFAULT 'ACTIVE',
    "headquarter_id" TEXT NOT NULL,
    "district_id" TEXT NOT NULL,
    "province_id" TEXT NOT NULL,
    "type_enterprise" "EnterpriseType" DEFAULT 'CLINIC',
    "user_id" TEXT NOT NULL,

    CONSTRAINT "enterprise_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "category_office" (
    "id" TEXT NOT NULL,
    "name_category_office" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "category_office_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "office" (
    "id" TEXT NOT NULL,
    "name_consultorio" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enterprise_id" TEXT NOT NULL,
    "category_office_id" TEXT NOT NULL,

    CONSTRAINT "office_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "person" (
    "id" TEXT NOT NULL,
    "firstname" TEXT NOT NULL,
    "secondName" TEXT NOT NULL,
    "firstLastName" TEXT NOT NULL,
    "secondLastName" TEXT NOT NULL,
    "birth_date" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type_document_id" TEXT NOT NULL,
    "document_number" TEXT NOT NULL,
    "country_id" TEXT NOT NULL,
    "departament_id" TEXT NOT NULL,
    "district_id" TEXT NOT NULL,
    "province_id" TEXT NOT NULL,
    "proffesion_id" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,

    CONSTRAINT "person_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employee" (
    "id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enterprise_id" TEXT NOT NULL,
    "status" "EmployeeStatus" DEFAULT 'ACTIVE',

    CONSTRAINT "employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "patient" (
    "id" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enterprise_id" TEXT NOT NULL,
    "status" "PatientStatus" DEFAULT 'ACTIVE',

    CONSTRAINT "patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medic" (
    "id" TEXT NOT NULL,
    "cmp" TEXT NOT NULL,
    "person_id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" "MedicStatus" DEFAULT 'ACTIVE',

    CONSTRAINT "medic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "speciality_medic" (
    "id" TEXT NOT NULL,
    "name_speciality" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "medical_speciality_id" TEXT NOT NULL,

    CONSTRAINT "speciality_medic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "cid" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "photo" TEXT,
    "email" TEXT NOT NULL,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "verification_code" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_role" "UserRole" DEFAULT 'ADMIN',
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "user_status" "UserStatus" DEFAULT 'ACTIVE',

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "medic_cmp_key" ON "medic"("cmp");

-- CreateIndex
CREATE UNIQUE INDEX "user_cid_key" ON "user"("cid");

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- CreateIndex
CREATE UNIQUE INDEX "user_email_key" ON "user"("email");

-- AddForeignKey
ALTER TABLE "especiality" ADD CONSTRAINT "especiality_proffesion_id_fkey" FOREIGN KEY ("proffesion_id") REFERENCES "proffesion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "departament" ADD CONSTRAINT "departament_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "district" ADD CONSTRAINT "district_departament_id_fkey" FOREIGN KEY ("departament_id") REFERENCES "departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "province" ADD CONSTRAINT "province_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "headquarter" ADD CONSTRAINT "headquarter_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "headquarter" ADD CONSTRAINT "headquarter_departament_id_fkey" FOREIGN KEY ("departament_id") REFERENCES "departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enterprise" ADD CONSTRAINT "enterprise_document_type_id_fkey" FOREIGN KEY ("document_type_id") REFERENCES "type_document"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enterprise" ADD CONSTRAINT "enterprise_headquarter_id_fkey" FOREIGN KEY ("headquarter_id") REFERENCES "headquarter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enterprise" ADD CONSTRAINT "enterprise_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enterprise" ADD CONSTRAINT "enterprise_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enterprise" ADD CONSTRAINT "enterprise_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "office" ADD CONSTRAINT "office_enterprise_id_fkey" FOREIGN KEY ("enterprise_id") REFERENCES "enterprise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "office" ADD CONSTRAINT "office_category_office_id_fkey" FOREIGN KEY ("category_office_id") REFERENCES "category_office"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_type_document_id_fkey" FOREIGN KEY ("type_document_id") REFERENCES "type_document"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_departament_id_fkey" FOREIGN KEY ("departament_id") REFERENCES "departament"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "district"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "person" ADD CONSTRAINT "person_proffesion_id_fkey" FOREIGN KEY ("proffesion_id") REFERENCES "proffesion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_enterprise_id_fkey" FOREIGN KEY ("enterprise_id") REFERENCES "enterprise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "patient" ADD CONSTRAINT "patient_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "patient" ADD CONSTRAINT "patient_enterprise_id_fkey" FOREIGN KEY ("enterprise_id") REFERENCES "enterprise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medic" ADD CONSTRAINT "medic_person_id_fkey" FOREIGN KEY ("person_id") REFERENCES "person"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "speciality_medic" ADD CONSTRAINT "speciality_medic_medical_speciality_id_fkey" FOREIGN KEY ("medical_speciality_id") REFERENCES "medic"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
