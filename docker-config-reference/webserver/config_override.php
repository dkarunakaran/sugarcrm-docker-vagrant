/***DEFAULT_SETTINGS_SUGAR***/
$sugar_config['default_date_format'] = 'd/m/Y';
$sugar_config['default_time_format'] = 'H:i';
$sugar_config['default_currency_iso4217'] = 'AUD';
$sugar_config['default_currency_name'] = 'AU Dollars';
$sugar_config['http_referer']['list']['0'] = 'crm.squiz.net';
$sugar_config['http_referer']['list']['1'] = 'mail.google.com';
$sugar_config['http_referer']['list']['2'] = 'insightfulpro.insightfulcrm.com';
$sugar_config['save_query'] = 'populate_only';
$sugar_config['verify_client_ip'] = true;
$sugar_config['disable_count_query'] = true;
$sugar_config['calculate_response_time'] = true;
$sugar_config['log_memory_usage'] = false;
$sugar_config['external_cache_disabled'] = false;
$sugar_config['external_cache_disabled_memcached'] = false;
$sugar_config['external_cache_disabled_memcache'] = true;
$sugar_config['external_cache_disabled_apc'] = true;
$sugar_config['external_cache_disabled_wincache'] = true;
$sugar_config['external_cache_disabled_smash'] = true;
$sugar_config['external_cache_disabled_redis'] = true;
$sugar_config['external_cache_disabled_zend'] = true;
$sugar_config['dump_slow_queries'] = true;
$sugar_config['slow_query_time_msec'] = '3000';
$sugar_config['default_module_favicon'] = false;
$sugar_config['dashlet_auto_refresh_min'] = '-1';
$sugar_config['show_download_tab'] = true;
$sugar_config['stack_trace_errors'] = false;
$sugar_config['developerMode'] = false;
$sugar_config['disabled_languages'] = 'bg_BG,cs_CZ,fi_FI,sq_AL,es_LA,sk_SK,da_DK,ko_KR,de_DE,el_EL,es_ES,fr_FR,he_IL,hu_HU,it_it,lt_LT,ja_JP,lv_LV,nb_NO,nl_NL,pl_PL,pt_PT,ro_RO,ru_RU,sv_SE,tr_TR,zh_CN,pt_BR,ca_ES,sr_RS,et_EE';
$sugar_config['languages']['en_us'] = 'English';
$sugar_config['import_max_records_total_limit'] = '1000';
$sugar_config['vcal_time'] = '0';
$sugar_config['disable_vcr'] = false;
$sugar_config['cron']['enforce_runtime'] = true;
$sugar_config['cron']['max_cron_runtime'] = 1800;
$sugar_config['jobs']['timeout'] = 3600;
$sugar_config['passwordsetting']['onespecial'] = '0';
$sugar_config['passwordsetting']['SystemGeneratedPasswordON'] = '0';
$sugar_config['passwordsetting']['forgotpasswordON'] = '0';
$sugar_config['SAML_loginurl'] = '';
$sugar_config['SAML_SLO'] = '';
$sugar_config['SAML_X509Cert'] = '';

/*** Squiz - Leave these empty ***/
$sugar_config['default_permissions']['user'] = '';
$sugar_config['default_permissions']['group'] = '';

/*** Squiz - Hide the ElasticSearch settings ***/
$sugar_config['hide_full_text_engine_config'] = true;
/*** Squiz - Force SugarCRM to do async indexing - Speeds up saves, etc ***/
/*** NOTE: There may be a delay between the saving and the index being updated ***/
$sugar_config['search_engine']['force_async_index'] = true;