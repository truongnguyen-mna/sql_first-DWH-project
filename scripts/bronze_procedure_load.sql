/*
====================================================================================

Create Stored Procedure for Bronze Table Loading

====================================================================================
Script Purpose:
	This script creates Stored Procedures to LOAD data form Bronze Tables from CRM and ERP source datasets for Bronze Layer after checking if it already exists.
	If the Stored Procedure exists, it is dropped and re-created.
	This script use TRY ... CATCH function to catch the error, issue for easier debugging.
  This script also track duration of loading, it helps to identify bottlenecks, optimze performance.

WARNING:
	Running this script will drop the entire Bronze Tables if it exists.
	All data in the tables will be permanently deleted. Proceed with caution and
	ensure you have proper backups before running this script.
*/

-- Use 'DataWarehouse' Database
USE DataWarehouse;
GO

-- Create STORED PROCEDURE for Bronze Layer Loading
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	-- Track ETL Duration | Helps to identify bottlenecks, optimize performance
	DECLARE
		@start_time DATETIME,
		@end_time   DATETIME,
		@entire_batch_start_time DATETIME,
		@entire_batch_end_time   DATETIME;

	-- Run the TRY clause to catch the ERROR, ISSUE for easier debugging
	BEGIN TRY 
		SET @entire_batch_start_time = GETDATE();
		-- PRINT the content of CRM table loading
		PRINT '=====================================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=====================================================================';

		PRINT '---------------------------------------------------------------------';
		PRINT 'Loading CRM tables';
		PRINT '---------------------------------------------------------------------';
	
			-- 1. Load bronze.crm_cust_info table
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_cust_info';
			TRUNCATE TABLE bronze.crm_cust_info; -- Empty the existing table before BULK INSERT

			PRINT '>> Inserting Data Into: bronze.crm_cust_info';
			BULK INSERT bronze.crm_cust_info -- INSERT entire data from source dataset file
			FROM 'C:\Users\letru\OneDrive\Course\04. Udemy\SQL_Baraa\SQL_Project_DataWarehouse\datasets\source_crm\cust_info.csv'
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK -- This clause will lock entire table during loading
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '.....................................................................'

			-- 2. Load bronze.crm_prd_info table
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_prd_info';
			TRUNCATE TABLE bronze.crm_prd_info; -- Empty the existing table before BULK INSERT

			PRINT '>> Inserting Data Into: bronze.crm_prd_info';
			BULK INSERT bronze.crm_prd_info -- INSERT entire data from source dataset file
			FROM 'C:\Users\letru\OneDrive\Course\04. Udemy\SQL_Baraa\SQL_Project_DataWarehouse\datasets\source_crm\prd_info.csv'
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK -- This clause will lock entire table during loading
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '.....................................................................'

			-- 3. Load bronze.crm_sales_details table
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.crm_sales_details';
			TRUNCATE TABLE bronze.crm_sales_details; -- Empty the existing table before BULK INSERT

			PRINT '>> Inserting Data Into: bronze.crm_sales_details';
			BULK INSERT bronze.crm_sales_details -- INSERT entire data from source dataset file
			FROM 'C:\Users\letru\OneDrive\Course\04. Udemy\SQL_Baraa\SQL_Project_DataWarehouse\datasets\source_crm\sales_details.csv'
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK -- This clause will lock entire table during loading
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '.....................................................................'

			-- 4. Load bronze.erp_cust_az12 table
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_cust_az12';
			TRUNCATE TABLE bronze.erp_cust_az12; -- Empty the existing table before BULK INSERT

			PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
			BULK INSERT bronze.erp_cust_az12 -- INSERT entire data from source dataset file
			FROM 'C:\Users\letru\OneDrive\Course\04. Udemy\SQL_Baraa\SQL_Project_DataWarehouse\datasets\source_erp\CUST_AZ12.csv'
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK -- This clause will lock entire table during loading
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '.....................................................................'

			-- 5. Load bronze.erp_loc_a101 table
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_loc_a101';
			TRUNCATE TABLE bronze.erp_loc_a101; -- Empty the existing table before BULK INSERT

			PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
			BULK INSERT bronze.erp_loc_a101 -- INSERT entire data from source dataset file
			FROM 'C:\Users\letru\OneDrive\Course\04. Udemy\SQL_Baraa\SQL_Project_DataWarehouse\datasets\source_erp\LOC_A101.csv'
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK -- This clause will lock entire table during loading
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '.....................................................................'

			-- 6. Load bronze.erp_px_cat_g1v2 table
			SET @start_time = GETDATE();
			PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
			TRUNCATE TABLE bronze.erp_px_cat_g1v2; -- Empty the existing table before BULK INSERT

			PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
			BULK INSERT bronze.erp_px_cat_g1v2 -- INSERT entire data from source dataset file
			FROM 'C:\Users\letru\OneDrive\Course\04. Udemy\SQL_Baraa\SQL_Project_DataWarehouse\datasets\source_erp\PX_CAT_G1V2.csv'
			WITH
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK -- This clause will lock entire table during loading
			);
			SET @end_time = GETDATE();
			PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR) + ' seconds';
			PRINT '.....................................................................'


		-- PRINT the content of RP table loading
		PRINT '---------------------------------------------------------------------';
		PRINT 'Loading ERP tables';
		PRINT '---------------------------------------------------------------------';

		-- Calculation the entire batch loading time
		SET @entire_batch_end_time = GETDATE();
		PRINT '=====================================================================';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT 'Total Duration: ' + CAST(DATEDIFF(SECOND,@entire_batch_start_time,@entire_batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '=====================================================================';
	END TRY
	
	-- SQL runs the TRY block first, if it fails, it runs the CATCH block to handle the ERROR, ISSUE
	BEGIN CATCH 
		PRINT '=====================================================================';
		PRINT 'ERROR OCCURED DURING LOAD BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE ();
		PRINT 'Error Message' + CAST(ERROR_NUMBER () AS NVARCHAR);
		PRINT 'Error Message' + CAST(ERROR_STATE  () AS NVARCHAR);
		PRINT '=====================================================================';
	END CATCH
END; -- END of STORED PROCEDURE

