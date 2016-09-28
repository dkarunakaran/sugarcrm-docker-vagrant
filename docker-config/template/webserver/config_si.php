<?php
#DO NOT CHANGE THIS FILE
$sugar_config_si = array(
    // SugarCRM URL
    'setup_site_url' => '/',
    'setup_db_host_name' => 'localhost_db',
    'setup_db_database_name' => 'sugarcrm_db',
    'setup_db_type' => 'mysql',
    'setup_db_admin_user_name' => 'root',
    'setup_db_admin_password' => '',
    'setup_db_username_is_privileged' => true,

    'setup_db_create_database' => true,
    'setup_db_drop_tables' => true,

    // Do we want demo data?
    'demoData' => 'no',

    'setup_db_options' => array(
        'collation' => 'utf8_general_ci',
    ),

    # do we create a new user?  Options are 'create', 'provide' or 'same' (as admin user)
    'dbUSRData' => 'same',
    #'setup_db_provide_own_user' => true,

    // Create a new DB user
    #'setup_db_create_sugarsales_user' => true,
    #'setup_db_sugarsales_user' => 'sales',
    #'setup_db_sugarsales_password' => 'salesPassword',

    'setup_site_admin_user_name'=>'admin',
    'setup_site_admin_password' => 'admin',
    'setup_license_key' => '6ghg6454aff619gfgfgd2c400ddssdsda856289',

    # see install_util.php:1282 and check the database after validing the license
    # TODO still need to revalidate the license
    'setup_license_key_users' => 20,
    'setup_license_key_expire_date' => '2016-01-01',
    #'setup_num_lic_oc' => ,

    'setup_site_sugarbeet_automatic_checks' => false,
    'setup_site_sugarbeet_anonymous_stats' => false,

    'default_currency_iso4217' => 'AUD',
    'default_currency_name' => 'Australian Dollars',
    'default_currency_significant_digits' => '2',
    'default_currency_symbol' => '$',
    'default_date_format' => 'Y-m-d',
    'default_time_format' => 'H:i',
    'default_decimal_seperator' => '.',
    'default_export_charset' => 'ISO-8859-1',
    'default_language' => 'en_us',
    'default_locale_name_format' => 's f l',
    'default_number_grouping_seperator' => ',',
    'export_delimiter' => ',',

    'setup_system_name' => 'SugarCRM',

    'setup_fts_type' => 'Elastic',
    'setup_fts_host' => 'localhost_elastic',
    'setup_fts_port' => 9200,
);