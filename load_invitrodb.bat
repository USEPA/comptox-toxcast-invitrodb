@echo off

set current_working_dir=%CD%
set mysql_dir=%current_working_dir%\invitrodb-loader\mysql\mysql-shell-8.0.17-windows-x86-64bit
set mysql_executable=%mysql_dir%\bin\mysqlsh.exe 

echo Enter your MySQL login credentials
set /p mysql_user="Username: "
set /p mysql_host="Hostname: "
set /p mysql_port="Port Number: "

set /p invitrodb_schema_name="What do you want to name the database schema? "
if exist %current_working_dir%\prod_internal_invitrodb_v3_2.bare.sql (
	set invitrodb_ddl_file=%current_working_dir%\prod_internal_invitrodb_v3_2.bare.sql
) else (
	echo ERROR: Move prod_internal_invitrodb_v3_2.bare.sql to this directory before running bat file
    pause
	exit
)

if exist %current_working_dir%\prod_internal_invitrodb_v3_2\prod_internal_invitrodb_v3_2-assay.sql (
	set invitrodb_sql_file_dir=%current_working_dir%\prod_internal_invitrodb_v3_2
) else (
	echo ERROR: data files not found. Unzip prod_internal_invitrodb_v3_2.all.zip to this directory before running the bat file
	pause
	exit
)



echo ################################################################################################
echo ###################################### InvitroDB v3.2 ##########################################
echo ################################################################################################
echo LOADING...

echo CREATING DATABASE AND SCHEMA...
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port% --password -e "drop database if exists %invitrodb_schema_name%; create database %invitrodb_schema_name%;"
echo CREATING TABLES...
echo LOADING DATA (this will take some time)...
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_ddl_file%
echo.
echo ############ Loading Table: mc0 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc0.sql
echo.
echo ############ Loading Table: mc4 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc4.sql
echo.
echo ############ Loading Table: mc4_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc4_aeid.sql
echo.
echo ############ Loading Table: mc4_agg ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc4_agg.sql
echo.
echo ############ Loading Table: mc4_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc4_methods.sql
echo.
echo ############ Loading Table: mc5 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc5.sql
echo.
echo ############ Loading Table: mc5_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc5_aeid.sql
echo.
echo ############ Loading Table: mc5_chid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc5_chid.sql
echo.
echo ############ Loading Table: mc5_fit_categories ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc5_fit_categories.sql
echo.
echo ############ Loading Table: mc5_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc5_methods.sql
echo.
echo ############ Loading Table: sc0 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc0.sql
echo.
echo ############ Loading Table: sc1 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc1.sql
echo.
echo ############ Loading Table: sc1_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc1_aeid.sql
echo.
echo ############ Loading Table: sc1_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc1_methods.sql
echo.
echo ############ Loading Table: sc2 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc2.sql
echo.
echo ############ Loading Table: sc2_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc2_aeid.sql
echo.
echo ############ Loading Table: sc2_agg ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc2_agg.sql
echo.
echo ############ Loading Table: sc2_chid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc2_chid.sql
echo.
echo ############ Loading Table: sc2_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sc2_methods.sql
echo.
echo ############ Loading Table: mc1 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc1.sql
echo.
echo ############ Loading Table: mc2 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc2.sql
echo.
echo ############ Loading Table: mc2_acid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc2_acid.sql
echo.
echo ############ Loading Table: mc2_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc2_methods.sql
echo.
echo ############ Loading Table: mc3 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc3.sql
echo.
echo ############ Loading Table: mc3_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc3_aeid.sql
echo.
echo ############ Loading Table: mc3_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc3_methods.sql
echo.
echo ############ Loading Table: mc6 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc6.sql
echo.
echo ############ Loading Table: mc6_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc6_aeid.sql
echo.
echo ############ Loading Table: mc6_methods ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc6_methods.sql
echo.
echo ############ Loading Table: mc7 ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-mc7.sql
echo.
echo ############ Loading Table: assay ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay.sql
echo.
echo ############ Loading Table: assay_component ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_component.sql
echo.
echo ############ Loading Table: assay_component_descriptions ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_component_descriptions.sql
echo.
echo ############ Loading Table: assay_component_endpoint ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_component_endpoint.sql
echo.
echo ############ Loading Table: assay_component_endpoint_descriptions ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_component_endpoint_descriptions.sql
echo.
echo ############ Loading Table: assay_component_map ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_component_map.sql
echo.
echo ############ Loading Table: assay_descriptions ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_descriptions.sql
echo.
echo ############ Loading Table: assay_list ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_list.sql
echo.
echo ############ Loading Table: assay_list_aeid ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_list_aeid.sql
echo.
echo ############ Loading Table: assay_reagent ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_reagent.sql
echo.
echo ############ Loading Table: assay_reference ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_reference.sql
echo.
echo ############ Loading Table: assay_source ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-assay_source.sql
echo.
echo ############ Loading Table: chemical ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-chemical.sql
echo.
echo ############ Loading Table: chemical_library ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-chemical_library.sql
echo.
echo ############ Loading Table: citations ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-citations.sql
echo.
echo ############ Loading Table: cytotox ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-cytotox.sql
echo.
echo ############ Loading Table: gene ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-gene.sql
echo.
echo ############ Loading Table: intended_target ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-intended_target.sql
echo.
echo ############ Loading Table: model_generic_chemical_ar_scores ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-model_generic_chemical_ar_scores.sql
echo.
echo ############ Loading Table: model_generic_chemical_cerapp_score ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-model_generic_chemical_cerapp_score.sql
echo.
echo ############ Loading Table: model_generic_chemical_compara_scores ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-model_generic_chemical_compara_scores.sql
echo.
echo ############ Loading Table: model_generic_chemical_er_scores ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-model_generic_chemical_er_scores.sql
echo.
echo ############ Loading Table: model_generic_chemical_hth295r_scores ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-model_generic_chemical_hth295r_scores.sql
echo.
echo ############ Loading Table: ontology ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-ontology.sql
echo.
echo ############ Loading Table: ontology_invitrodb ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-ontology_invitrodb.sql
echo.
echo ############ Loading Table: organism ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-organism.sql
echo.
echo ############ Loading Table: sample ############
%mysql_executable% --sql %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-sample.sql
echo.
echo ############ Loading Table: technological_target ############
%mysql_executable% --sql --quiet-start=1 %mysql_user%@%mysql_host%:%mysql_port%/%invitrodb_schema_name% --password < %invitrodb_sql_file_dir%\prod_internal_invitrodb_v3_2-technological_target.sql

echo.
echo.
echo INVITRODB UPLOAD COMPLETED

pause
