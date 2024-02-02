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
	get_id('@', 'fp_country@name@World')
),
(
	'CONTINENT',
	'ASI',
	'Asia',
	get_id('@', 'fp_country@name@World')
),
(
	'CONTINENT',
	'EUR',
	'Europe',
	get_id('@', 'fp_country@name@World')
),
(
	'CONTINENT',
	'NCA',
	'North Center America',
	get_id('@', 'fp_country@name@World')
),
(
	'CONTINENT',
	'OCN',
	'Oceania',
	get_id('@', 'fp_country@name@World')
),
(
	'CONTINENT',
	'STA',
	'South America',
	get_id('@', 'fp_country@name@World')
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
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'AGO',
	'Angola',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'ALB',
	'Albania',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'AND',
	'Andorra',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'ARE',
	'United Arab Emirates',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'ARG',
	'Argentina',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'ARM',
	'Armenia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'ATG',
	'Antigua and Barbuda',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'AUS',
	'Australia',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'AUT',
	'Austria',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'AZE',
	'Azerbaijan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'BDI',
	'Burundi',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'BEL',
	'Belgium',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'BEN',
	'Benin',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'BFA',
	'Burkina Faso',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'BGD',
	'Bangladesh',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'BGR',
	'Bulgaria',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'BHR',
	'Bahrain',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'BHS',
	'Bahamas',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'BIH',
	'Bosnia and Herzegovina',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'BLR',
	'Belarus',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'BLZ',
	'Belize',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'BOL',
	'Bolivia',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'BRA',
	'Brazil',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'BRB',
	'Barbados',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'BRN',
	'Brunei',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'BTN',
	'Bhutan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'BWA',
	'Botswana',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'CAF',
	'Central African Republic',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'CAN',
	'Canada',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'CHE',
	'Switzerland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'CHL',
	'Chile',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'CHN',
	'China',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'CIV',
	'Côte d''Ivoire',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'CMR',
	'Cameroon',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'COD',
	'Democratic Republic of the Congo',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'COG',
	'Congo',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'COL',
	'Colombia',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'COM',
	'Comoros',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'CPV',
	'Cabo Verde',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'CRI',
	'Costa Rica',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'CUB',
	'Cuba',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'CUW',
	'Curaçao',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'CYP',
	'Cyprus',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'CZE',
	'Czech Republic',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'DEU',
	'Germany',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'DJI',
	'Djibouti',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'DMA',
	'Dominica',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'DNK',
	'Denmark',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'DOM',
	'Dominican Republic',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'DZA',
	'Algeria',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'ECU',
	'Ecuador',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'EGY',
	'Egypt',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'ENG',
	'England',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'ERI',
	'Eritrea',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'ESP',
	'Spain',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'EST',
	'Estonia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'ETH',
	'Ethiopia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'FIN',
	'Finland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'FJI',
	'Fiji',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'FRA',
	'France',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'FSM',
	'Micronesia',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'GAB',
	'Gabon',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'GEO',
	'Georgia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'GHA',
	'Ghana',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'GIN',
	'Guinea',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'GMB',
	'Gambia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'GNB',
	'Guinea-Bissau',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'GNQ',
	'Equatorial Guinea',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'GRC',
	'Greece',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'GRD',
	'Grenada',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'GTM',
	'Guatemala',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'GUY',
	'Guyana',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'HND',
	'Honduras',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'HRV',
	'Croatia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'HTI',
	'Haiti',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'HUN',
	'Hungary',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'IDN',
	'Indonesia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'IND',
	'India',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'IRL',
	'Ireland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'IRN',
	'Iran',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'IRQ',
	'Iraq',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'ISL',
	'Iceland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'ISR',
	'Israel',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'ITA',
	'Italy',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'JAM',
	'Jamaica',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'JOR',
	'Jordan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'JPN',
	'Japan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'KAZ',
	'Kazakhstan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'KEN',
	'Kenya',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'KGZ',
	'Kyrgyzstan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'KHM',
	'Cambodia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'KIR',
	'Kiribati',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'KNA',
	'Saint Kitts and Nevis',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'KOR',
	'South Korea',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'KWT',
	'Kuwait',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'LAO',
	'Lao People''s Democratic Republic',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'LBN',
	'Lebanon',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'LBR',
	'Liberia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'LBY',
	'Libya',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'LCA',
	'Saint Lucia',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'LIE',
	'Liechtenstein',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'LKA',
	'Sri Lanka',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'LSO',
	'Lesotho',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'LTU',
	'Lithuania',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'LUX',
	'Luxembourg',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'LVA',
	'Latvia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'MAR',
	'Morocco',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MCO',
	'Monaco',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'MDA',
	'Moldova',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'MDG',
	'Madagascar',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MDV',
	'Maldives',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'MEX',
	'Mexico',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'MHL',
	'Marshall Islands',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'MKD',
	'North Macedonia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'MLI',
	'Mali',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MLT',
	'Malta',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'MMR',
	'Myanmar',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'MNE',
	'Montenegro',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'MNG',
	'Mongolia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'MOZ',
	'Mozambique',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MRT',
	'Mauritania',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MUS',
	'Mauritius',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MWI',
	'Malawi',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'MYS',
	'Malaysia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'NAM',
	'Namibia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'NER',
	'Niger',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'NGA',
	'Nigeria',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'NIC',
	'Nicaragua',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'NIR',
	'Northern Ireland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'NIU',
	'Niue',
	get_id('@', 'fp_country@name@Oceania')
),	
(
	'NATION',
	'NLD',
	'Netherlands',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'NOR',
	'Norway',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'NPL',
	'Nepal',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'NRU',
	'Nauru',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'NZL',
	'New Zealand',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'OMN',
	'Oman',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'PAK',
	'Pakistan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'PAN',
	'Panama',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'PER',
	'Peru',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'PHL',
	'Philippines',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'PLW',
	'Palau',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'PNG',
	'Papua New Guinea',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'POL',
	'Poland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'PRI',
	'Puerto Rico',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'PRK',
	'North Korea',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'PRT',
	'Portugal',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'PRY',
	'Paraguay',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'PSE',
	'Palestine',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'QAT',
	'Qatar',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'ROU',
	'Romania',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'RUS',
	'Russian Federation',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'RWA',
	'Rwanda',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SAU',
	'Saudi Arabia',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'SCT',
	'Scotland',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'SDN',
	'Sudan',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SEN',
	'Senegal',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SGP',
	'Singapore',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'SLB',
	'Solomon Islands',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'SLE',
	'Sierra Leone',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SLV',
	'El Salvador',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'SMR',
	'San Marino',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'SOM',
	'Somalia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SRB',
	'Serbia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'SSD',
	'South Sudan',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'STP',
	'São Tomé and Príncipe',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SUR',
	'Suriname',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'SVK',
	'Slovakia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'SVN',
	'Slovenia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'SWE',
	'Sweden',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'SWZ',
	'Eswatini',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SYC',
	'Seychelles',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'SYR',
	'Syria',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TCD',
	'Chad',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'TGO',
	'Togo',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'THA',
	'Thailand',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TJK',
	'Tajikistan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TKM',
	'Turkmenistan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TLS',
	'Timor-Leste',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TON',
	'Tonga',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'TTO',
	'Trinidad and Tobago',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'TUN',
	'Tunisia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'TUR',
	'Türkiye',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TWN',
	'Taiwan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'TZA',
	'Tanzania',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'UGA',
	'Uganda',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'UKR',
	'Ukraine',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'URY',
	'Uruguay',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'USA',
	'United States',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'UZB',
	'Uzbekistan',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'VCT',
	'Saint Vincent and the Grenadines',
	get_id('@', 'fp_country@name@North Center America')
),
(
	'NATION',
	'VEN',
	'Venezuela',
	get_id('@', 'fp_country@name@South America')
),
(
	'NATION',
	'VNM',
	'Vietnam',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'VUT',
	'Vanuatu',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'WLS',
	'Wales',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'WSM',
	'Samoa',
	get_id('@', 'fp_country@name@Oceania')
),
(
	'NATION',
	'XKX',
	'Kosovo',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'YEM',
	'Yemen',
	get_id('@', 'fp_country@name@Asia')
),
(
	'NATION',
	'YUG',
	'Jugoslavia',
	get_id('@', 'fp_country@name@Europe')
),
(
	'NATION',
	'ZAF',
	'South Africa',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'ZMB',
	'Zambia',
	get_id('@', 'fp_country@name@Africa')
),
(
	'NATION',
	'ZWE',
	'Zimbabwe',
	get_id('@', 'fp_country@name@Africa')
);
--------------------------------------------------------------------------------

