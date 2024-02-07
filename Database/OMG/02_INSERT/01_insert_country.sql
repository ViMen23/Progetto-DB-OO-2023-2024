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
 * INSERT COUNTRY
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE COUNTRY
 ******************************************************************************/
INSERT INTO fp_country (type, code, name, super_id)
VALUES
('WORLD', 'WLD', 'World', NULL);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT CONTINENT TYPE COUNTRY
 ******************************************************************************/
INSERT INTO fp_country (type, code, name, super_id)
VALUES
(
	'CONTINENT',
	'AFR',
	'Africa',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'ASI',
	'Asia',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'EUR',
	'Europe',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'NCA',
	'North Center America',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'OCN',
	'Oceania',
	get_column('@', 'fp_country@name@World', 'id')::integer
),
(
	'CONTINENT',
	'STA',
	'South America',
	get_column('@', 'fp_country@name@World', 'id')::integer
);
--------------------------------------------------------------------------------



/*******************************************************************************
 * INSERT NATION TYPE COUNTRY
 ******************************************************************************/
INSERT INTO fp_country (type, code, name, super_id)
VALUES
(
	'NATION',
	'AFG',
	'Afghanistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'AGO',
	'Angola',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ALB',
	'Albania',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'AND',
	'Andorra',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ARE',
	'United Arab Emirates',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ARG',
	'Argentina',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'ARM',
	'Armenia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ATG',
	'Antigua and Barbuda',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'AUS',
	'Australia',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'AUT',
	'Austria',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'AZE',
	'Azerbaijan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BDI',
	'Burundi',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'BEL',
	'Belgium',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BEN',
	'Benin',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'BFA',
	'Burkina Faso',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'BGD',
	'Bangladesh',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BGR',
	'Bulgaria',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BHR',
	'Bahrain',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BHS',
	'Bahamas',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'BIH',
	'Bosnia and Herzegovina',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BLR',
	'Belarus',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'BLZ',
	'Belize',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'BOL',
	'Bolivia',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'BRA',
	'Brazil',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'BRB',
	'Barbados',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'BRN',
	'Brunei',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BTN',
	'Bhutan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'BWA',
	'Botswana',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CAF',
	'Central African Republic',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CAN',
	'Canada',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'CHE',
	'Switzerland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'CHL',
	'Chile',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'CHN',
	'China',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'CIV',
	'Côte d''Ivoire',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CMR',
	'Cameroon',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'COD',
	'Democratic Republic of the Congo',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'COG',
	'Congo',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'COL',
	'Colombia',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'COM',
	'Comoros',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CPV',
	'Cabo Verde',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'CRI',
	'Costa Rica',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'CUB',
	'Cuba',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'CUW',
	'Curaçao',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'CYP',
	'Cyprus',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'CZE',
	'Czech Republic',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'DEU',
	'Germany',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'DJI',
	'Djibouti',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'DMA',
	'Dominica',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'DNK',
	'Denmark',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'DOM',
	'Dominican Republic',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'DZA',
	'Algeria',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ECU',
	'Ecuador',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'EGY',
	'Egypt',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ENG',
	'England',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ERI',
	'Eritrea',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ESP',
	'Spain',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'EST',
	'Estonia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ETH',
	'Ethiopia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'FIN',
	'Finland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'FJI',
	'Fiji',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'FRA',
	'France',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'FSM',
	'Micronesia',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'GAB',
	'Gabon',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GEO',
	'Georgia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'GHA',
	'Ghana',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GIN',
	'Guinea',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GMB',
	'Gambia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GNB',
	'Guinea-Bissau',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GNQ',
	'Equatorial Guinea',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'GRC',
	'Greece',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'GRD',
	'Grenada',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'GTM',
	'Guatemala',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'GUY',
	'Guyana',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'HND',
	'Honduras',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'HRV',
	'Croatia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'HTI',
	'Haiti',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'HUN',
	'Hungary',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'IDN',
	'Indonesia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'IND',
	'India',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'IRL',
	'Ireland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'IRN',
	'Iran',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'IRQ',
	'Iraq',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ISL',
	'Iceland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ISR',
	'Israel',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ITA',
	'Italy',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'JAM',
	'Jamaica',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'JOR',
	'Jordan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'JPN',
	'Japan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KAZ',
	'Kazakhstan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KEN',
	'Kenya',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'KGZ',
	'Kyrgyzstan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KHM',
	'Cambodia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KIR',
	'Kiribati',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'KNA',
	'Saint Kitts and Nevis',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'KOR',
	'South Korea',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'KWT',
	'Kuwait',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LAO',
	'Lao People''s Democratic Republic',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LBN',
	'Lebanon',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LBR',
	'Liberia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'LBY',
	'Libya',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'LCA',
	'Saint Lucia',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'LIE',
	'Liechtenstein',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'LKA',
	'Sri Lanka',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'LSO',
	'Lesotho',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'LTU',
	'Lithuania',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'LUX',
	'Luxembourg',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'LVA',
	'Latvia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MAR',
	'Morocco',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MCO',
	'Monaco',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MDA',
	'Moldova',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MDG',
	'Madagascar',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MDV',
	'Maldives',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'MEX',
	'Mexico',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'MHL',
	'Marshall Islands',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'MKD',
	'North Macedonia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MLI',
	'Mali',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MLT',
	'Malta',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MMR',
	'Myanmar',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'MNE',
	'Montenegro',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'MNG',
	'Mongolia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'MOZ',
	'Mozambique',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MRT',
	'Mauritania',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MUS',
	'Mauritius',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MWI',
	'Malawi',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'MYS',
	'Malaysia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'NAM',
	'Namibia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'NER',
	'Niger',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'NGA',
	'Nigeria',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'NIC',
	'Nicaragua',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'NIR',
	'Northern Ireland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'NIU',
	'Niue',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),	
(
	'NATION',
	'NLD',
	'Netherlands',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'NOR',
	'Norway',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'NPL',
	'Nepal',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'NRU',
	'Nauru',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'NZL',
	'New Zealand',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'OMN',
	'Oman',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PAK',
	'Pakistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PAN',
	'Panama',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'PER',
	'Peru',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'PHL',
	'Philippines',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PLW',
	'Palau',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'PNG',
	'Papua New Guinea',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'POL',
	'Poland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'PRI',
	'Puerto Rico',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'PRK',
	'North Korea',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'PRT',
	'Portugal',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'PRY',
	'Paraguay',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'PSE',
	'Palestine',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'QAT',
	'Qatar',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'ROU',
	'Romania',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'RUS',
	'Russian Federation',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'RWA',
	'Rwanda',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SAU',
	'Saudi Arabia',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'SCT',
	'Scotland',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SDN',
	'Sudan',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SEN',
	'Senegal',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SGP',
	'Singapore',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'SLB',
	'Solomon Islands',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'SLE',
	'Sierra Leone',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SLV',
	'El Salvador',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'SMR',
	'San Marino',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SOM',
	'Somalia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SRB',
	'Serbia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SSD',
	'South Sudan',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'STP',
	'São Tomé and Príncipe',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SUR',
	'Suriname',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'SVK',
	'Slovakia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SVN',
	'Slovenia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SWE',
	'Sweden',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'SWZ',
	'Eswatini',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SYC',
	'Seychelles',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'SYR',
	'Syria',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TCD',
	'Chad',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'TGO',
	'Togo',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'THA',
	'Thailand',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TJK',
	'Tajikistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TKM',
	'Turkmenistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TLS',
	'Timor-Leste',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TON',
	'Tonga',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'TTO',
	'Trinidad and Tobago',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'TUN',
	'Tunisia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'TUR',
	'Türkiye',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TWN',
	'Taiwan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'TZA',
	'Tanzania',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'UGA',
	'Uganda',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'UKR',
	'Ukraine',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'URY',
	'Uruguay',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'USA',
	'United States',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'UZB',
	'Uzbekistan',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'VCT',
	'Saint Vincent and the Grenadines',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer
),
(
	'NATION',
	'VEN',
	'Venezuela',
	get_column('@', 'fp_country@name@South America', 'id')::integer
),
(
	'NATION',
	'VNM',
	'Vietnam',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'VUT',
	'Vanuatu',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'WLS',
	'Wales',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'WSM',
	'Samoa',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer
),
(
	'NATION',
	'XKX',
	'Kosovo',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'YEM',
	'Yemen',
	get_column('@', 'fp_country@name@Asia', 'id')::integer
),
(
	'NATION',
	'YUG',
	'Jugoslavia',
	get_column('@', 'fp_country@name@Europe', 'id')::integer
),
(
	'NATION',
	'ZAF',
	'South Africa',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ZMB',
	'Zambia',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
),
(
	'NATION',
	'ZWE',
	'Zimbabwe',
	get_column('@', 'fp_country@name@Africa', 'id')::integer
);
--------------------------------------------------------------------------------

