/******************************************************************************* 
 * PROJECT NAME : FOOTBALL PLAYER DATABASE
 *
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY
 * FIELD        : COMPUTER SCIENCE
 * CLASS        : DATA BASES I
 * TEACHER      : SILVIO BARRA
 * YEAR         : 2023-2024
 ******************************************************************************/


/*******************************************************************************
 * DOMAIN 
 ******************************************************************************/


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_date
 * DESC : domain for dates before or equal to the current date
 ******************************************************************************/
CREATE DOMAIN dm_date AS date
CHECK
(
	value <= current_date
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_year
 * DESC : domain for years before or equal to the current date year
 ******************************************************************************/
CREATE DOMAIN dm_year AS smallint
CHECK
(
	value BETWEEN 0 AND extract(year from current_date)
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_code
 * DESC : domain for a code made up of only capital letters
 *        of the alphabet with a length between 1 and 20 characters
 ******************************************************************************/
CREATE DOMAIN dm_code AS varchar(20)
CHECK
(
	value ~ '(?=^[A-Z]{1,20}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_scode
 * DESC : domain for a code made up of only capital letters
 *        of the alphabet with a length between 2 and 3 characters
 ******************************************************************************/
CREATE DOMAIN dm_scode AS varchar(3)
CHECK
(
	value ~ '(?=^[A-Z]{2,3}$)'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_spstr
 * DESC : domain for all text string containing
 *        letters of the alphabet (accented or not),
 *        hyphens [-] and spaces,
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_spstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\-\s]{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]$)'
			'(?!.*[\-\s]{2})'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_enstr
 * DESC : domain for all text string containing
 *        letters of the alphabet (accented or not),
 *        hyphens [-], periods [.], superscripts ['] and spaces,
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_enstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\.\-\s'']{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF\.]$)'
			'(?!.*[\-''\s]{2})((?:(?!\.[^\s])'
			'(?![^a-zA-Z\u00C0-\u00F6\u00F8-\u00FF]\.).)+)'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_anstr
 * DESC : domain for all text string containing
 *        letters of the alphabet (accented or not), digits,
 *        hyphens [-], periods [.], superscripts ['] and spaces,
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_anstr AS varchar(100)
CHECK
(
	value ~ '(?=^[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9]'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9\.\-\s'']{0,98}'
			'[a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9\.]$)'
			'(?!.*[\-''\s]{2})((?:(?!\.[^\s])'
			'(?![^a-zA-Z\u00C0-\u00F6\u00F8-\u00FF0-9]\.).)+)'
);
--------------------------------------------------------------------------------


/******************************************************************************* 
 * TYPE : DOMAIN
 * NAME : dm_usr
 * DESC : domain for all text string containing
 *        letters of the alphabet, digits, underscores [_] and periods [.]
 *        with a minimum length of 2 characters and
 *        with a maximum length of 100 characters
 ******************************************************************************/
CREATE DOMAIN dm_usr AS varchar(20)
CHECK
(
	value ~ '(^(?=[a-zA-Z0-9._]{4,20}$)(?!.*[_.]{2})[^_.].*[^_.]$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_pwd
 * DESC : domain for all text string containing
 *        all ASCII visible characters,
 *        with a minimum length of 8 characters and
 *        with a maximum length of 255 characters
 ******************************************************************************/
CREATE DOMAIN dm_pwd AS varchar(20)
CHECK
(
	value ~ '(^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)'
			'(?=.*[~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<])'
			'[A-Za-z\\d~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:''\"/?.>,<]{8,255}$)'
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * TYPE : DOMAIN
 * NAME : dm_uint
 * DESC : domain for non-negative integers [0 - 32767]
 ******************************************************************************/
CREATE DOMAIN dm_uint AS smallint
CHECK
(
	value >= 0
);
--------------------------------------------------------------------------------
