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
 * INSERT CONFEDERATION
 ******************************************************************************/


/*******************************************************************************
 * INSERT WORLD TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'FIFA',
	'Fédération Internationale de Football Association',
	get_column('@', 'fp_country@name@World', 'id')::integer,
	NULL
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT CONTINENT TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'CAF',
	'Confederation of African Football',
	get_column('@', 'fp_country@name@Africa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
	
),
(
	'AFC',
	'Asian Football Confederation',
	get_column('@', 'fp_country@name@Asia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'CONCACAF',
	'Confederation of North and Central America and Caribbean Association Football',
	get_column('@', 'fp_country@name@North Center America', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'CONMEBOL',
	'Confederación Sudamericana de Fútbol',
	get_column('@', 'fp_country@name@South America', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'OFC',
	'Oceania Football Confederation',
	get_column('@', 'fp_country@name@Oceania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
),
(
	'UEFA',
	'Union of European Football Associations',
	get_column('@', 'fp_country@name@Europe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Fédération Internationale de Football Association', 'id')::integer
);
--------------------------------------------------------------------------------

/*******************************************************************************
 * INSERT NATION TYPE CONFEDERATION
 ******************************************************************************/
INSERT INTO fp_confederation (short_name, long_name, country_id, super_id)
VALUES
(
	'AFF',
	'Afghanistan Football Federation',
	get_column('@', 'fp_country@name@Afghanistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer	
),
(
	'FAF',
	'Angolan Football Federation',
	get_column('@', 'fp_country@name@Angola', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSHF',
	'Federata Shqiptare e Futbollit',
	get_column('@', 'fp_country@name@Albania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FAF',
	'Federació Andorrana de Futbol',
	get_column('@', 'fp_country@name@Andorra', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'UAEFA',
	'UAE Football Association',
	get_column('@', 'fp_country@name@United Arab Emirates', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'AFA',
	'Asociación del Fútbol Argentino',
	get_column('@', 'fp_country@name@Argentina', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'FFA',
	'Football Federation of Armenia',
	get_column('@', 'fp_country@name@Armenia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ABFA',
	'Antigua and Barbuda Football Association',
	get_column('@', 'fp_country@name@Antigua and Barbuda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FFA',
	'Football Federation Australia',
	get_column('@', 'fp_country@name@Australia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'ÖFB',
	'Österreichischer Fußball-Bund',
	get_column('@', 'fp_country@name@Austria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'AFFA',
	'Association of Football Federations of Azerbaijan',
	get_column('@', 'fp_country@name@Azerbaijan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFB',
	'Fédération de Football du Burundi',
	get_column('@', 'fp_country@name@Burundi', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'KBVB',
	'Royal Belgian Football Association',
	get_column('@', 'fp_country@name@Belgium', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FBF',
	'Fédération Béninoise de Football',
	get_column('@', 'fp_country@name@Benin', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FBF',
	'Fédération Burkinabé de Football',
	get_column('@', 'fp_country@name@Burkina Faso', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'BFF',
	'Bangladesh Football Federation',
	get_column('@', 'fp_country@name@Bangladesh', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFU',
	'Bulgarian Football Union',
	get_column('@', 'fp_country@name@Bulgaria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'BFA',
	'Bahrain Football Association',
	get_column('@', 'fp_country@name@Bahrain', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFA',
	'Bahamas Football Association',
	get_column('@', 'fp_country@name@Bahamas', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'N/FSBiH',
	'Nogometni/Fudbalski Savez Bosne i Hercegovine',
	get_column('@', 'fp_country@name@Bosnia and Herzegovina', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'BFF',
	'Football Federation of Belarus',
	get_column('@', 'fp_country@name@Belarus', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFB',
	'Football Federation of Belize',
	get_column('@', 'fp_country@name@Belize', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FBF',
	'Federación Boliviana de Fútbol',
	get_column('@', 'fp_country@name@Bolivia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'CBF',
	'Confederação Brasileira de Futebol',
	get_column('@', 'fp_country@name@Brazil', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'BFA',
	'Barbados Football Association',
	get_column('@', 'fp_country@name@Barbados', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'NFABD',
	'National Football Association of Brunei Darussalam',
	get_column('@', 'fp_country@name@Brunei', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFF',
	'Bhutan Football Federation',
	get_column('@', 'fp_country@name@Bhutan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'BFA',
	'Botswana Football Association',
	get_column('@', 'fp_country@name@Botswana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),

(
	'FCF',
	'Fédération Centrafricaine de Football',
	get_column('@', 'fp_country@name@Central African Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'CSA',
	'Canada Soccer',
	get_column('@', 'fp_country@name@Canada', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'SFV',
	'Swiss Football Association',
	get_column('@', 'fp_country@name@Switzerland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFCh',
	'Federación de Fútbol de Chile',
	get_column('@', 'fp_country@name@Chile', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'CFA',
	'Chinese Football Association',
	get_column('@', 'fp_country@name@China', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FIF',
	'Fédération Ivoirienne de Football',
	get_column('@', 'fp_country@name@Côte d''Ivoire', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECAFOOT',
	'Fédération Camerounaise de Football',
	get_column('@', 'fp_country@name@Cameroon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECOFA',
	'Fédération Congolaise de Football-Association',
	get_column('@', 'fp_country@name@Democratic Republic of the Congo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FECOFOOT',
	'Fédération Congolaise de Football',
	get_column('@', 'fp_country@name@Congo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FCF',
	'Federación Colombiana de Fútbol',
	get_column('@', 'fp_country@name@Colombia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'FFC',
	'Fédération Comorienne de Football',
	get_column('@', 'fp_country@name@Comoros', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FCF',
	'Federação Caboverdiana de Futebol',
	get_column('@', 'fp_country@name@Cabo Verde', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEDEFUTBOL',
	'Federación Costarricense de Fútbol',
	get_column('@', 'fp_country@name@Costa Rica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'AFC',
	'Asociación de Fútbol de Cuba',
	get_column('@', 'fp_country@name@Cuba', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FFK',
	'Federashon Futbòl Kòrsou',
	get_column('@', 'fp_country@name@Curaçao', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'CFA',
	'Cyprus Football Association',
	get_column('@', 'fp_country@name@Cyprus', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FAČR',
	'Fotbalová asociace České republiky',
	get_column('@', 'fp_country@name@Czech Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'DFB',
	'Deutscher Fußball-Bund',
	get_column('@', 'fp_country@name@Germany', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FDF',
	'Fédération Djiboutienne de Football',
	get_column('@', 'fp_country@name@Djibouti', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'DFA',
	'Dominica Football Association',
	get_column('@', 'fp_country@name@Dominica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'DBU',
	'Dansk Boldspil-Union',
	get_column('@', 'fp_country@name@Denmark', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FEDOFUTBOL',
	'Federación Dominicana de Fútbol',
	get_column('@', 'fp_country@name@Dominican Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FAF',
	'Fédération Algérienne de Football',
	get_column('@', 'fp_country@name@Algeria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEF',
	'Federación Ecuatoriana de Fútbol',
	get_column('@', 'fp_country@name@Ecuador', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'EFA',
	'Egyptian Football Association',
	get_column('@', 'fp_country@name@Egypt', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FA',
	'The Football Association',
	get_column('@', 'fp_country@name@England', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ENFF',
	'Eritrean National Football Federation',
	get_column('@', 'fp_country@name@Eritrea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'RFEF',
	'Real Federación Española de Fútbol',
	get_column('@', 'fp_country@name@Spain', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EJL',
	'Eesti Jalgpalli Liit',
	get_column('@', 'fp_country@name@Estonia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EFF',
	'Ethiopian Football Federation',
	get_column('@', 'fp_country@name@Ethiopia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SPL',
	'Suomen Palloliitto',
	get_column('@', 'fp_country@name@Finland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFA',
	'Fiji Football Association',
	get_column('@', 'fp_country@name@Fiji', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFF',
	'Fédération Française de Football',
	get_column('@', 'fp_country@name@France', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FSMFA',
	'Federated States of Micronesia Football Association',
	get_column('@', 'fp_country@name@Micronesia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FEGAFOOT',
	'Fédération Gabonaise de Football',
	get_column('@', 'fp_country@name@Gabon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'GFF',
	'Georgian Football Federation',
	get_column('@', 'fp_country@name@Georgia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'GFA',
	'Ghana Football Association',
	get_column('@', 'fp_country@name@Ghana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FGF',
	'Fédération Guinéenne de Football',
	get_column('@', 'fp_country@name@Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'GFF',
	'Gambia Football Federation',
	get_column('@', 'fp_country@name@Gambia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFGB',
	'Federação de Futebol da Guiné-Bissau',
	get_column('@', 'fp_country@name@Guinea-Bissau', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FEGUIFUT',
	'Federación Ecuatoguineana de Fútbol',
	get_column('@', 'fp_country@name@Equatorial Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'EPO',
	'Hellenic Football Federation',
	get_column('@', 'fp_country@name@Greece', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'GFA',
	'Grenada Football Association',
	get_column('@', 'fp_country@name@Grenada', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FENAFUTH',
	'Federación Nacional de Fútbol de Guatemala',
	get_column('@', 'fp_country@name@Guatemala', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'GFF',
	'Guyana Football Federation',
	get_column('@', 'fp_country@name@Guyana', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FENAFUTH',
	'Federación Nacional Autónoma de Fútbol de Honduras',
	get_column('@', 'fp_country@name@Honduras', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'HNS',
	'Hrvatski nogometni savez',
	get_column('@', 'fp_country@name@Croatia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FHF',
	'Fédération Haïtienne de Football',
	get_column('@', 'fp_country@name@Haiti', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'MLSZ',
	'Magyar Labdarúgó Szövetség',
	get_column('@', 'fp_country@name@Hungary', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'PSSI',
	'Indonesian Football Association',
	get_column('@', 'fp_country@name@Indonesia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'AIFF',
	'All India Football Federation',
	get_column('@', 'fp_country@name@India', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FAI',
	'Football Association of Ireland',
	get_column('@', 'fp_country@name@Ireland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFIRI',
	'Football Federation Islamic Republic of Iran',
	get_column('@', 'fp_country@name@Iran', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'IFA',
	'Iraq Football Association',
	get_column('@', 'fp_country@name@Iraq', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'KSÍ',
	'Knattspyrnusamband Íslands',
	get_column('@', 'fp_country@name@Iceland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'IFA',
	'Israel Football Association',
	get_column('@', 'fp_country@name@Israel', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FIGC',
	'Federazione Italiana Giuoco Calcio',
	get_column('@', 'fp_country@name@Italy', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'JFF',
	'Jamaica Football Federation',
	get_column('@', 'fp_country@name@Jamaica', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'JFA',
	'Jordan Football Association',
	get_column('@', 'fp_country@name@Jordan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'JFA',
	'Japan Football Association',
	get_column('@', 'fp_country@name@Japan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFK',
	'Football Federation of Kazakhstan',
	get_column('@', 'fp_country@name@Kazakhstan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FKF',
	'Football Kenya Federation',
	get_column('@', 'fp_country@name@Kenya', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFKR',
	'Football Federation of the Kyrgyz Republic',
	get_column('@', 'fp_country@name@Kyrgyzstan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFC',
	'Football Federation of Cambodia',
	get_column('@', 'fp_country@name@Cambodia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'KIFA',
	'Kiribati Islands Football Association',
	get_column('@', 'fp_country@name@Kiribati', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'SKNFA',
	'Saint Kitts and Nevis Football Association',
	get_column('@', 'fp_country@name@Saint Kitts and Nevis', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'KFA',
	'Korea Football Association',
	get_column('@', 'fp_country@name@South Korea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'KFA',
	'Kuwait Football Association',
	get_column('@', 'fp_country@name@Kuwait', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFF',
	'Lao Football Federation',
	get_column('@', 'fp_country@name@Lao People''s Democratic Republic', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Lebanese Football Association',
	get_column('@', 'fp_country@name@Lebanon', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Liberia Football Association',
	get_column('@', 'fp_country@name@Liberia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'LFF',
	'Libyan Football Federation',
	get_column('@', 'fp_country@name@Libya', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SLFA',
	'Saint Lucia Football Association',
	get_column('@', 'fp_country@name@Saint Lucia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'LFV',
	'Liechtensteiner Fussballverband',
	get_column('@', 'fp_country@name@Liechtenstein', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFSL',
	'Football Federation of Sri Lanka',
	get_column('@', 'fp_country@name@Sri Lanka', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'LFA',
	'Lesotho Football Association',
	get_column('@', 'fp_country@name@Lesotho', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'LFF',
	'Lithuanian Football Federation',
	get_column('@', 'fp_country@name@Lithuania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FLF',
	'Luxembourg Football Federation',
	get_column('@', 'fp_country@name@Luxembourg', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'LFF',
	'Latvijas Futbola federācija',
	get_column('@', 'fp_country@name@Latvia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FRMF',
	'Royal Moroccan Football Federation',
	get_column('@', 'fp_country@name@Morocco', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FMF',
	'Fédération Monegasque de Football',
	get_column('@', 'fp_country@name@Monaco', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FMF',
	'Federația Moldovenească de Fotbal',
	get_column('@', 'fp_country@name@Moldova', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FMF',
	'Fédération Malagasy de Football',
	get_column('@', 'fp_country@name@Madagascar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Maldives',
	get_column('@', 'fp_country@name@Maldives', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FMF',
	'Federación Mexicana de Fútbol Asociación',
	get_column('@', 'fp_country@name@Mexico', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'MISA',
	'Marshall Islands Soccer Association',
	get_column('@', 'fp_country@name@Marshall Islands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFM',
	'Football Federation of North Macedonia',
	get_column('@', 'fp_country@name@North Macedonia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FEMAFOOT',
	'Fédération Malienne de Football',
	get_column('@', 'fp_country@name@Mali', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'MFA',
	'Malta Football Association',
	get_column('@', 'fp_country@name@Malta', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'MFF',
	'Myanmar Football Federation',
	get_column('@', 'fp_country@name@Myanmar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FSCG',
	'Fudbalski Savez Crne Gore',
	get_column('@', 'fp_country@name@Montenegro', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'MFF',
	'Mongolian Football Federation',
	get_column('@', 'fp_country@name@Mongolia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FMF',
	'Federação Moçambicana de Futebol',
	get_column('@', 'fp_country@name@Mozambique', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FFRIM',
	'Fédération de Football de la République Islamique de Mauritanie',
	get_column('@', 'fp_country@name@Mauritania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'MFA',
	'Mauritius Football Association',
	get_column('@', 'fp_country@name@Mauritius', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Malawi',
	get_column('@', 'fp_country@name@Malawi', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAM',
	'Football Association of Malaysia',
	get_column('@', 'fp_country@name@Malaysia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'NFA',
	'Namibia Football Association',
	get_column('@', 'fp_country@name@Namibia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FENIFOOT',
	'Fédération Nigerienne de Football',
	get_column('@', 'fp_country@name@Niger', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'NFF',
	'Nigeria Football Federation',
	get_column('@', 'fp_country@name@Nigeria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FENIFUT',
	'Federación Nicaragüense de Fútbol',
	get_column('@', 'fp_country@name@Nicaragua', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'IFA',
	'Irish Football Association',
	get_column('@', 'fp_country@name@Northern Ireland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NISA',
	'Niue Island Soccer Association',
	get_column('@', 'fp_country@name@Niue', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'KNVB',
	'Koninklijke Nederlandse Voetbalbond',
	get_column('@', 'fp_country@name@Netherlands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NFF',
	'Norges Fotballforbund',
	get_column('@', 'fp_country@name@Norway', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'ANFA',
	'All Nepal Football Association',
	get_column('@', 'fp_country@name@Nepal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer	
),
(
	'NZF',
	'New Zealand Football',
	get_column('@', 'fp_country@name@New Zealand', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'OFA',
	'Oman Football Association',
	get_column('@', 'fp_country@name@Oman', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'PFF',
	'Pakistan Football Federation',
	get_column('@', 'fp_country@name@Pakistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FEPAFUT',
	'Federación Panameña de Fútbol',
	get_column('@', 'fp_country@name@Panama', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FPF',
	'Federación Peruana de Futbol',
	get_column('@', 'fp_country@name@Peru', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'PFF',
	'Philippine Football Federation',
	get_column('@', 'fp_country@name@Philippines', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'PFA',
	'Palau Football Association',
	get_column('@', 'fp_country@name@Palau', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'PNGFA',
	'Papua New Guinea Football Association',
	get_column('@', 'fp_country@name@Papua New Guinea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'PZPN',
	'Polski Związek Piłki Nożnej',
	get_column('@', 'fp_country@name@Poland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FPF',
	'Federación Puertorriqueña de Fútbol',
	get_column('@', 'fp_country@name@Puerto Rico', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'DPRK FA',
	'DPR Korea Football Association',
	get_column('@', 'fp_country@name@North Korea', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FPF',
	'Federação Portuguesa de Futebol',
	get_column('@', 'fp_country@name@Portugal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'APF',
	'Asociación Paraguaya de Fútbol',
	get_column('@', 'fp_country@name@Paraguay', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'PFA',
	'Palestine Football Association',
	get_column('@', 'fp_country@name@Palestine', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'QFA',
	'Qatar Football Association',
	get_column('@', 'fp_country@name@Qatar', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FRF',
	'Federația Română de Fotbal',
	get_column('@', 'fp_country@name@Romania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'RFU',
	'Russian Football Union',
	get_column('@', 'fp_country@name@Russian Federation', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FERWAFA',
	'Fédération Rwandaise de Football Association',
	get_column('@', 'fp_country@name@Rwanda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SAFF',
	'Saudi Arabian Football Federation',
	get_column('@', 'fp_country@name@Saudi Arabia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SFA',
	'Scottish Football Association',
	get_column('@', 'fp_country@name@Scotland', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SFA',
	'Sudan Football Association',
	get_column('@', 'fp_country@name@Sudan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSF',
	'Fédération Sénégalaise de Football',
	get_column('@', 'fp_country@name@Senegal', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAS',
	'Football Association of Singapore',
	get_column('@', 'fp_country@name@Singapore', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SIFF',
	'Solomon Islands Football Federation',
	get_column('@', 'fp_country@name@Solomon Islands', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'SLFA',
	'Sierra Leone Football Association',
	get_column('@', 'fp_country@name@Sierra Leone', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FESFUT',
	'Federación Salvadoreña de Fútbol',
	get_column('@', 'fp_country@name@El Salvador', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FSGC',
	'Federazione Sammarinese Giuoco Calcio',
	get_column('@', 'fp_country@name@San Marino', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SFF',
	'Somali Football Federation',
	get_column('@', 'fp_country@name@Somalia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSS',
	'Football Association of Serbia',
	get_column('@', 'fp_country@name@Serbia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SSFA',
	'South Sudan Football Association',
	get_column('@', 'fp_country@name@South Sudan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FSF',
	'Federação Santomense de Futebol',
	get_column('@', 'fp_country@name@São Tomé and Príncipe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SVB',
	'Surinaamse Voetbal Bond',
	get_column('@', 'fp_country@name@Suriname', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'SFZ',
	'Slovenský futbalový zväz',
	get_column('@', 'fp_country@name@Slovakia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'NZS',
	'Nogometna zveza Slovenije',
	get_column('@', 'fp_country@name@Slovenia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'SvFF',
	'Svenska Fotbollförbundet',
	get_column('@', 'fp_country@name@Sweden', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'EFA',
	'Eswatini Football Association',
	get_column('@', 'fp_country@name@Eswatini', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SFF',
	'Seychelles Football Federation',
	get_column('@', 'fp_country@name@Seychelles', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'SAFA',
	'Syrian Arab Football Association',
	get_column('@', 'fp_country@name@Syria', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FTFA',
	'Fédération Tchadienne de Football',
	get_column('@', 'fp_country@name@Chad', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FTF',
	'Fédération Togolaise de Football',
	get_column('@', 'fp_country@name@Togo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAT',
	'Football Association of Thailand',
	get_column('@', 'fp_country@name@Thailand', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFF',
	'Tajikistan Football Federation',
	get_column('@', 'fp_country@name@Tajikistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFT',
	'Football Federation of Turkmenistan',
	get_column('@', 'fp_country@name@Turkmenistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'FFTL',
	'Federação de Futebol de Timor-Leste',
	get_column('@', 'fp_country@name@Timor-Leste', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFA',
	'Tonga Football Association',
	get_column('@', 'fp_country@name@Tonga', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'TTFA',
	'Trinidad and Tobago Football Association',
	get_column('@', 'fp_country@name@Trinidad and Tobago', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FTF',
	'Fédération Tunisienne de Football',
	get_column('@', 'fp_country@name@Tunisia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'TFF',
	'Türkiye Futbol Federasyonu',
	get_column('@', 'fp_country@name@Türkiye', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'CTFA',
	'Chinese Taipei Football Association',
	get_column('@', 'fp_country@name@Taiwan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'TFF',
	'Tanzania Football Federation',
	get_column('@', 'fp_country@name@Tanzania', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FUFA',
	'Federation of Uganda Football Associations',
	get_column('@', 'fp_country@name@Uganda', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'UAF',
	'Ukrainian Association of Football',
	get_column('@', 'fp_country@name@Ukraine', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'AUF',
	'Asociación Uruguaya de Fútbol',
	get_column('@', 'fp_country@name@Uruguay', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'USSF',
	'United States Soccer Federation',
	get_column('@', 'fp_country@name@United States', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'UFA',
	'Uzbekistan Football Association',
	get_column('@', 'fp_country@name@Uzbekistan', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SVGFF',
	'Saint Vincent and the Grenadines Football Federation',
	get_column('@', 'fp_country@name@Saint Vincent and the Grenadines', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football', 'id')::integer
),
(
	'FVF',
	'Federación Venezolana de Fútbol',
	get_column('@', 'fp_country@name@Venezuela', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol', 'id')::integer
),
(
	'VFF',
	'Vietnam Football Federation',
	get_column('@', 'fp_country@name@Vietnam', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'VFF',
	'Vanuatu Football Federation',
	get_column('@', 'fp_country@name@Vanuatu', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FAW',
	'Football Association of Wales',
	get_column('@', 'fp_country@name@Wales', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'FFS',
	'Football Federation Samoa',
	get_column('@', 'fp_country@name@Samoa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Oceania Football Confederation', 'id')::integer
),
(
	'FFK',
	'Football Federation of Kosovo',
	get_column('@', 'fp_country@name@Kosovo', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Union of European Football Associations', 'id')::integer
),
(
	'YFA',
	'Yemen Football Association',
	get_column('@', 'fp_country@name@Yemen', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Asian Football Confederation', 'id')::integer
),
(
	'SAFA',
	'South African Football Association',
	get_column('@', 'fp_country@name@South Africa', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'FAZ',
	'Football Association of Zambia',
	get_column('@', 'fp_country@name@Zambia', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
),
(
	'ZIFA',
	'Zimbabwe Football Association',
	get_column('@', 'fp_country@name@Zimbabwe', 'id')::integer,
	get_column('@', 'fp_confederation@long_name@Confederation of African Football', 'id')::integer
);
--------------------------------------------------------------------------------


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
 * INSERT INTERNATIONAL COMPETITION
 ******************************************************************************/
INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'CUP',
	'NATIONAL',
	'FIFA World Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Internationale de Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'AFC Asian Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AFC Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AFC Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asian Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'Africa Cup of Nations',
	2,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'CAF Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'CAF Confederation Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'CAF Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of African Football',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'CONCACAF Gold Cup',
	2,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football',
		'id'
	)::integer	
),
(
	'CUP',
	'CLUB',
	'CONCACAF Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'CONMEBOL Copa América',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Libertadores de América',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Sudamericana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'CONMEBOL Recopa Sudamericana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederación Sudamericana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'OFC Nations Cup',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'OFC Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oceania Football Confederation',
		'id'
	)::integer
),
(
	'CUP',
	'NATIONAL',
	'UEFA European Championship',
	4,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Champions League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Europa League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UEFA Conference League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Union of European Football Associations',
		'id'
	)::integer
);
--------------------------------------------------------------------------------


/*******************************************************************************
 * INSERT NATIONAL COMPETITION
 ******************************************************************************/
INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'LEAGUE',
	'CLUB',
	'Afghan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Afghanistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria Superiore',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Parë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Dytë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Superkupa e Shqipërisë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kupa e Shqipërisë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Girabola',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segundona',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Angolan SuperCup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Angolan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Divisió',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segona Divisió',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Andorran Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Constitució',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE First Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'UAE Second Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'UAE President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'UAE Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@UAE Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Profesional de Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Nacional',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Argentina',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Argentina',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Centenario de la AFA',
	100,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Armenian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Armenian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Armenian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Armenian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Antigua and Barbuda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Antigua and Barbuda FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'A-League Men',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Australia Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Österreichische Fußball-Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Admiral 2. Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Austrian Regionalliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'ÖFB-Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'ÖFB-Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Premyer Liqası',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Birinci Divizionu',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Azərbaycan Kuboku',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Azərbaycan Superkuboku',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Burundi Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Burundi',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jupiler Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Challenger Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belgian National Division 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Beker van België',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Belgische Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Bénin',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Bénin',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Faso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Burkina Faso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bangladesh Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bangladesh Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Third Amateur Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Bulgarian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Bulgarian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bahraini Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Bahraini King''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Bahraini Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'BFA Senior League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bahamas Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premijer Liga Bosne i Hercegovine',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga FBiH',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Republike Srpske',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup Bosne i Hercegovine',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Belarusian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Belarusian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Belize',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belize',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'División de Fútbol Profesional',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Boliviana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série D',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa do Brasil',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa do Brasil',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Barbados Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Barbados FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Brunei Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Brunei FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Brunei Super Cup',
	0,
	get_column
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bhutan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Bhutan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botswana Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FA Challenge Cup Botswana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Central African Republic League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Centrafricaine de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Canadian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Canada Soccer',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Canadian Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Canada Soccer',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Challenge League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Promotion League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Schweizer Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional Scotiabank',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Chile',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de Chile',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Chinese Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'China League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'China League Two',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Chinese FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	 'CLUB',
	'Chinese FA Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'MTN Ligue 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe de Côte d''Ivoire',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'MTN Elite One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cameroon Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Linafoot',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du DR Congo',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National MTN',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Congo',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Torneo BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa BetPlay Dimayor',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Superliga BetPlay DIMAYOR',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Comoros Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Comorienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cape Verdean Football Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de Cabo Verde',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Promerica',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División de Costa Rica',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Costa Rican Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional de Fútbol de Cuba',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación de Fútbol de Cuba',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Curaçao Promé Divishon',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federashon Futbòl Kòrsou',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Third Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cypriot Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. česká fotbalová liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fotbalová národní liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Czech Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Czech Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. Bundesliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'3. Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Regionalliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'DFB-Pokal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'DFL-Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Djibouti Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Djibouti FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Dominica Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dominica Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'3F Superliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'NordicBet Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Danish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Danish SuperCup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Dominicana de Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Dominicana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Professional League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Algerian Ligue 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe d''Algérie de football',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coupe d''Algérie de football',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Pro Ecuador Serie A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Categoría Serie B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Ecuador',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Egyptian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Egypt Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Egyptian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'EFL League Two',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'FA Community Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@The Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eritrean Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eritrean National Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'LaLiga EA Sports',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'LALIGA HYPERMOTION',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa del Rey',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de España',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Federación',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Meistriliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Esiliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Estonian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Estonian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ethiopian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ethiopian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Veikkausliiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ykkönen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kakkonen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Finnish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fiji Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Fiji Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe de France',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Trophée des Champions',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pohnpei Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federated States of Micronesia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gabon Championnat National D1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe du Gabon Interclubs',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Georgian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Georgian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ghana Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ghana FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFA League First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Gambian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional da Guiné-Bissau',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional da Guiné Bissau',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Equatoguinean Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Equatoguinean Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gamma Ethniki',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Greek Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Cup of Friendship and Solidarity',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFA Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Grenada Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol de Guatemala',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División de Ascenso',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa de Guatemala',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'GFF National Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Guyana Mayors Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol Profesional de Honduras',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Honduran Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperSport Hrvatska nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Druga nogometna liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hrvatski nogometni kup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Hrvatski nogometni superkup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue Haïtienne',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coupe d''Haïti',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság I',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság II',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Magyar Kupa',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'BRI Liga 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Piala Indonesia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Indian Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I-League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I-League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'AIFF Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All India Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sports Direct FAI Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Persian Gulf Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Azadegan League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hazfi Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Iran Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Iraq Stars League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Iraqi Premier Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Iraq FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Iraqi Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Besta deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. deild karla',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Icelandic Men''s Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Icelandic Men''s Football Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligat Ha`Al',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Leumit',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Alef',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Israel State Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Israel Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Israel Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie B',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Serie D',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Italia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa Italiana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Italia Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa di Serie C',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jamaica Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'JFF Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Jordanian Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Jordan FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Jordan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J1 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J2 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'J3 League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Japan Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Emperor''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Japanese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Japan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kazakhstan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kazakhstan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kenyan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'FKF President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kenyan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Pervaja Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kyrgyzstan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kyrgyzstan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cambodian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Cambodia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kiribati National Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kiribati Islands Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SKNFA Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Saint Kitts and Nevis National Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'K League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'K League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Korean FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Kuwait Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kuwait Emir Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kuwait Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lao League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lao Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lebanese FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Lebanese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liberian First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Liberian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Libyan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Libyan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Libyan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SLFA First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Saint Lucia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Liechtenstein Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Liechtensteiner Fussballverband',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sri Lanka Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sri Lanka FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Lesotho Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lesotho Independence Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'A Lyga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pirma lyga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lithuanian Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Lithuanian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg National Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg Division of Honour',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Luxembourg Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Virsliga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Latvijas Pirmā līga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Latvijas kauss',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Latvian Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Moroccan Throne Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Challenge Prince Rainier III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Monegasque de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Divizia Națională',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Divizia A',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Moldovan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Moldovan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malagasy Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malagasy de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Dhivehi Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Maldives FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga de Expansión MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Premier de México',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Campeón de Campeones MX',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva makedonska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Vtora makedonska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup na Makedonija',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Macedonian Supercup',
	0,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malian Première Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Malian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Malta Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Challenge League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Malta Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Myanmar National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'General Aung San Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva crnogorska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Druga crnogorska fudbalska liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Crnogorski fudbalski kup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Mongolian National Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'MFF Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Moçambola',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça de Moçambique',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1 Mauritania',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Mauritanian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Mauritian League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Mauritian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malawi Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malawi',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Malaysia Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Malaysia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Namibia Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Namibia FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Niger Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Niger Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nigerian Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Nigerian FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Nicaraguan Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol',
		'id'
	)::integer
),

(
	'CUP',
	'CLUB',
	'Copa de Nicaragua',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Irish Premiership',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'NIFL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Irish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'NIFL Charity Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Irish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Niue Soccer Tournament',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Niue Island Soccer Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eredivisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eerste Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tweede Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'KNVB Beker',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Johan Cruijff Schaal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eliteserien',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Norwegian First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Norwegian Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Mesterfinalen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial A-Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial B-Division League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ncell Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'New Zealand National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@New Zealand Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Chatham Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@New Zealand Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Oman Professional League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oman Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sultan Qaboos Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Oman Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Pakistan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Pakistan National Football Challenge Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Asociación Nacional Pro Fútbol',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Panamá',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Betsson',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Peruvian Segunda División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Bicentenario',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Peruana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Philippines Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Paulino Alcantara',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Palau Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palau Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Papua New Guinea National Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Papua New Guinea FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ekstraklasa',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'I liga polska',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'II liga polska',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Polish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Polish Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Puerto Rico',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Puertorriqueña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'DPR Korea Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hwaebul Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal Betclic',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Terceira Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça de Portugal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supertaça Cândido de Oliveira',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Paraguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'División Intermedia',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Paraguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Paraguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Gaza Strip Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Palestine Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Qatar Stars League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Qatari Stars Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Sheikh Jassim Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga II',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga III',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cupa României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercupa României',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Russian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Russian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Russian Football Union',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Rwanda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Rwandan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Saudi Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Saudi League First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'The Custodian of The Two Holy Mosques Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Saudi Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Premiership',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Scottish League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Scottish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sudan Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Sudan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Senegal Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Senegal FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Singapore Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Singapore Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Singapore Community Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Solomon Islands S-League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Solomon Islands Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Sierra Leone National Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Sierra Leone Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Salvadoran Primera División',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Salvadoreña de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Campionato Sammarinese di Calcio',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Coppa Titano',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coppa Sammarinese',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federazione Sammarinese Giuoco Calcio',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Somali First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Somali Second Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Somalia Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Somalia Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Somali Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Srbije',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Srpska Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kup Srbije',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Serbia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'South Sudan Football Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'South Sudan National Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South Sudan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'São Tomé and Príncipe Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de São Tomé e Principe',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'São Tomé and Príncipe Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação Santomense de Futebol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'SVB Eerste Divisie',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Beker van Suriname',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Suriname President''s Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Surinaamse Voetbal Bond',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Fortuna Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Slovak Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Slovak Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Slovenský futbalový zväz',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'1. SNL',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'2. SNL',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Hervis Pokal',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Nogometna zveza Slovenije',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Allsvenskan',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Superettan',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Division 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Division 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Svenska Cupen',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Svenska Fotbollförbundet',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Eswatini',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Swazi Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Swazi Charity Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Eswatini Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Seychelles First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Seychelles FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Seychelles Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Syrian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Syrian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Syrian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Syrian Arab Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Chad Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tchadienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National de Premiere Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Togolaise de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Thai League 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Thai FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Thailand Champions Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Thailand',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Vysšaja Liga',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tajikistan First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tajikistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Tajikistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tajikistan Football Federation',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Turkmenistan Higher League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Turkmenistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Turkmenistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Turkmenistan',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Futebol Amadora Primeira Divisão',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Taça 12 de Novembro',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'LFA Super Taça',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol de Timor-Leste',
		'id'
	)::integer

),
(
	'LEAGUE',
	'CLUB',
	'Tonga Major League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tonga Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'TT Premier Football League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Trinidad and Tobago FA Trophy',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Trinidad and Tobago Charity Shield',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Trinidad and Tobago Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tunisian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Tunisian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Fédération Tunisienne de Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Süper Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 1. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 2. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Türkiye Futbol Federasyonu 3. Lig',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Turkish Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Turkish Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Türkiye Futbol Federasyonu',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Taiwan Football Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Chinese Taipei Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Tanzanian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Tanzania FA Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Tanzania Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uganda Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ugandan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federation of Uganda Football Associations',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Premier League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian First League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Ukrainian Second League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Ukrainian Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Ukrainian Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Ukrainian Association of Football',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Profesional de Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División Profesional de Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Uruguay',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Uruguaya',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Asociación Uruguaya de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Major League Soccer',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'USL Championship',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'USL League One',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Lamar Hunt U.S. Open Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@United States Soccer Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Uzbekistan Pro League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Uzbekistan Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Uzbekistan Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Uzbekistan Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga Venezolana',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga FUTVE 2',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Copa Venezuela',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Federación Venezolana de Fútbol',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Eximbank V League 1',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Vietnamese National Football Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Vietnamese Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Vietnam Football Federation',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Cymru Premier',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Welsh Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Wales',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Samoa National League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Samoa Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation Samoa',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Superliga e Futbollit të Kosovës',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Liga e Parë',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Kosovar Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Kosovar Supercup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kosovo',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Yemeni League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Yemeni President Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'SUPER CUP',
	'CLUB',
	'Yemeni Super Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Yemen Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'South African Premier Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'National First Division',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Nedbank Cup',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@South African Football Association',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Zambia Super League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Football Association of Zambia',
		'id'
	)::integer
),
(
	'LEAGUE',
	'CLUB',
	'Zimbabwe Premier Soccer League',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association',
		'id'
	)::integer
),
(
	'CUP',
	'CLUB',
	'Cup of Zimbabwe',
	1,
	get_column
	(
		'@',
		'fp_confederation@long_name@Zimbabwe Football Association',
		'id'
	)::integer
);
--------------------------------------------------------------------------------


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
 * INSERT POSITION
 ******************************************************************************/
INSERT INTO fp_position (role, code, name)
VALUES
('GK', 'GK', 'Goalkeeper'),
('DF', 'CB', 'Centre-Back'),
('DF', 'LB', 'Left-Back'),
('DF', 'LD', 'Left Defender'),
('DF', 'RB', 'Right-Back'),
('DF', 'RD', 'Right Defender'),
('DF', 'SW', 'Sweeper'),
('MF', 'AM', 'Attacking Midfield'),
('MF', 'CM', 'Central Midfield'),
('MF', 'DM', 'Defensive Midfield'),
('MF', 'LM', 'Left Midfield'),
('MF', 'MW', 'Mid-Wing'),
('MF', 'RM', 'Right Midfield'),
('FW', 'CF', 'Centre Forward'),
('FW', 'FN', 'False Nine'),
('FW', 'LF', 'Left Forward'),
('FW', 'LW', 'Left Winger'),
('FW', 'RW', 'Right Winger'),
('FW', 'RF', 'Right Forward'),
('FW', 'SS', 'Second Striker');
--------------------------------------------------------------------------------


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
 * INSERT TROPHY
 ******************************************************************************/
INSERT INTO fp_trophy (type, name, role)
VALUES
('TEAM', 'First place', NULL),
('TEAM', 'Second place', NULL),
('TEAM', 'Third place', NULL),
('PLAYER', 'Most Valuable Player', NULL),
('PLAYER', 'Best Striker', 'FW'),
('PLAYER', 'Best Midfielder', 'MF'),
('PLAYER', 'Best Defender', 'DF'),
('PLAYER', 'Best Goalkeeper', 'GK'),
('PLAYER', 'Goal of the Season', NULL);
--------------------------------------------------------------------------------



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
 * INSERT PRIZE
 ******************************************************************************/
INSERT INTO fp_prize (type, name, given, role)
VALUES
('PLAYER', 'Ballon d''Or', 'France Football', NULL),
('PLAYER', 'European Golden Shoe', 'European Sports Media', NULL),
('PLAYER', 'FIFA Fair Play Award', 'FIFA', NULL),
('PLAYER', 'FIFA Puskás Award', 'FIFA', NULL),
('TEAM', 'Targa UEFA', 'UEFA', NULL),
('PLAYER', 'Best goalkeeper of the year IFFHS', 'IFFHS', 'GK');
--------------------------------------------------------------------------------


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
 * INSERT TAG
 ******************************************************************************/
INSERT INTO fp_tag (goalkeeper, positive, name)
VALUES
(
	'FALSE',
	'TRUE',
	'Get Forward Whenever Possible'
),
(
	'FALSE',
	'TRUE',
	'Stays Back At All Times'
),
(
	'FALSE',
	'TRUE',
	'Comes Deep to Get Ball'
),
(
	'FALSE',
	'TRUE',
	'Dribble Down The Left or Right Flank'
),
(
	'FALSE',
	'TRUE',
	'Dribble Through The Center of The Park'
),
(
	'FALSE',
	'TRUE',
	'Runs With The Ball More Often'
),
(
	'FALSE',
	'TRUE',
	'Runs With The Ball Occasionally'
),
(
	'FALSE',
	'TRUE',
	'Hugs The Touchline'
),
(
	'FALSE',
	'TRUE',
	'Cuts Inside From Right or Left or Both Wings'
),
(
	'FALSE',
	'TRUE',
	'Gets Into The Opposition Area Whenever Possible'
),
(
	'FALSE',
	'TRUE',
	'Arrives Late In The Opposition Area'
),
(
	'FALSE',
	'TRUE',
	'Try To Beat The Offside Trap'
),
(
	'FALSE',
	'TRUE',
	'Plays With Back To Goal'
),
(
	'FALSE',
	'TRUE',
	'Mainly Stays Inside The Penalty Area Whenever Possible'
),
(
	'FALSE',
	'TRUE',
	'Moves Into Channels'
),
(
	'FALSE',
	'TRUE',
	'Plays One-Twos'
),
(
	'FALSE',
	'TRUE',
	'Knock The Ball Past His Opponent When Taking Him On'
),
(
	'FALSE',
	'TRUE',
	'Tries Killer Balls Often'
),
(
	'FALSE',
	'TRUE',
	'Plays No Through Balls'
),
(
	'FALSE',
	'TRUE',
	'Tries Long Range Passes'
),
(
	'FALSE',
	'TRUE',
	'Plays Short Simple Passes'
),
(
	'FALSE',
	'TRUE',
	'Slow Down Play Now And Then'
),
(
	'FALSE',
	'TRUE',
	'Dwells on Ball'
),
(
	'FALSE',
	'TRUE',
	'Look For the Pass Rather Than Attempting to Score'
),
(
	'FALSE',
	'TRUE',
	'Dictates Tempo'
),
(
	'FALSE',
	'TRUE',
	'Likes To Switch Ball To The Other Flank'
),
(
	'FALSE',
	'TRUE',
	'Likes Ball Played Into Feet'
),
(
	'FALSE',
	'TRUE',
	'Shoots From Distance'
),
(
	'FALSE',
	'TRUE',
	'Refrains From Taking Long Shots'
),
(
	'FALSE',
	'TRUE',
	'Try to Lob the Keeper in One-on-Ones'
),
(
	'FALSE',
	'TRUE',
	'Likes to Round Keeper'
),
(
	'FALSE',
	'TRUE',
	'Shoots With Power'
),
(
	'FALSE',
	'TRUE',
	'Places Shots'
),
(
	'FALSE',
	'TRUE',
	'Attempts First Time Shots'
),
(
	'FALSE',
	'TRUE',
	'Attempts Overhead Kicks'
),
(
	'FALSE',
	'TRUE',
	'Hits Free Kicks With Power'
),
(
	'FALSE',
	'TRUE',
	'Tries Long Range Free Kicks'
),
(
	'FALSE',
	'TRUE',
	'Throw Himself Into Tackles'
),
(
	'FALSE',
	'TRUE',
	'Does Not Dives Into Tackles'
),
(
	'FALSE',
	'TRUE',
	'Marks Opponents Tightly'
),
(
	'FALSE',
	'TRUE',
	'Brings Ball Out of Defence'
),
(
	'FALSE',
	'TRUE',
	'Tries To Play Way Out of Trouble'
),
(
	'FALSE',
	'TRUE',
	'Tries Tricks'
),
(
	'FALSE',
	'TRUE',
	'Curls Balls'
),
(
	'FALSE',
	'TRUE',
	'Uses Outside of Foot'
),
(
	'FALSE',
	'TRUE',
	'Likes To Beat Man Repeatedly'
),
(
	'FALSE',
	'TRUE',
	'Moves The Ball to Right or Left Foot Before Dribble Attempt'
),
(
	'FALSE',
	'TRUE',
	'Attempts to Develop Weaker Footer'
),
(
	'FALSE',
	'TRUE',
	'Avoids Using Weaker Foot'
),
(
	'FALSE',
	'TRUE',
	'Possess Long Flat Throw'
),
(
	'TRUE',
	'TRUE',
	'Uses Long Throws to Start Counter Attacks'
),
(
	'TRUE',
	'TRUE',
	'Tries Long Range Free Kicks GK'
),
(
	'TRUE',
	'TRUE',
	'Attempts to Develop Weaker Footer GK'
),
(
	'TRUE',
	'TRUE',
	'Avoids Using Weaker Foot GK'
),
(
	'FALSE',
	'TRUE',
	'Gets Crowd Going'
),
(
	'FALSE',
	'FALSE',
	'Argues With Officials'
),
(
	'FALSE',
	'TRUE',
	'Winds Up Opponents'
);
--------------------------------------------------------------------------------

