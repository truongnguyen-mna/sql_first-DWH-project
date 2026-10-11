/*
===================================================================================

DDL - Create Tables

===================================================================================
Script Purpose:
	This script creates new tables from CRM and ERP source datatsets after checking if it already exists.
	If the tables exist, it is dropped and re-created.

WARNING:
	Running this script will drop the entire CRM and ERP tables if it exists.
	All data in the table will be permanently deleted. Proceed with caution and
	ensure you have proper backups before running this script.
*/
-- Choose 'DataWarehouse' database
USE DataWarehouse;
GO

-- Create CRM cust_info table
IF OBJECT_ID ('bronze.crm_cust_info' , 'U') IS NOT NULL -- Check the exists of table
DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info -- Create the table if do not exists
(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_material_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);
GO

-- Create CRM prd_info table
IF OBJECT_ID ('bronze.crm_prd_info' , 'U') IS NOT NULL -- Check the exists of table
DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info -- Create the table if do not exists
(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATE,
prd_end_dt DATE
);
GO

-- Create CRM sales_details table
IF OBJECT_ID ('bronze.crm_sales_details' , 'U') IS NOT NULL -- Check the exists of table
DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details -- Create the table if do not exists
(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt DATE,
sls_ship_dt DATE,
sls_due_dt DATE,
sls_sales INT,
sls_quantity INT,
sls_price INT
);
GO

-- Create ERP cust_az12 table
IF OBJECT_ID ('bronze.erp_cust_az12' , 'U') IS NOT NULL -- Check the exists of table
DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 -- Create the table if do not exists
(
cid NVARCHAR(50),
birth_date DATE,
gen NVARCHAR(50),
);
GO

-- Create ERP loc_a101 table
IF OBJECT_ID ('bronze.erp_loc_a101' , 'U') IS NOT NULL -- Check the exists of table
DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 -- Create the table if do not exists
(
cid NVARCHAR(50),
country NVARCHAR(50),
);
GO

-- Create ERP px_cat_g1v2 table
IF OBJECT_ID ('bronze.erp_px_cat_g1v2' , 'U') IS NOT NULL -- Check the exists of table
DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 -- Create the table if do not exists
(
id NVARCHAR(50),
category NVARCHAR(50),
sub_category NVARCHAR(50),
maintenance NVARCHAR(50),
);
GO
