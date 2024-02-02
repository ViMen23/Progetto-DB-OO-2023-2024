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
	get_id('@', 'fp_country@name@World'),
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
	get_id('@', 'fp_country@name@Africa'),
	get_id('@', 'fp_confederation@long_name@Fédération Internationale de Football Association')
	
),
(
	'AFC',
	'Asian Football Confederation',
	get_id('@', 'fp_country@name@Asia'),
	get_id('@', 'fp_confederation@long_name@Fédération Internationale de Football Association')
),
(
	'CONCACAF',
	'Confederation of North and Central America and Caribbean Association Football',
	get_id('@', 'fp_country@name@North Center America'),
	get_id('@', 'fp_confederation@long_name@Fédération Internationale de Football Association')
),
(
	'CONMEBOL',
	'Confederación Sudamericana de Fútbol',
	get_id('@', 'fp_country@name@South America'),
	get_id('@', 'fp_confederation@long_name@Fédération Internationale de Football Association')
),
(
	'OFC',
	'Oceania Football Confederation',
	get_id('@', 'fp_country@name@Oceania'),
	get_id('@', 'fp_confederation@long_name@Fédération Internationale de Football Association')
),
(
	'UEFA',
	'Union of European Football Associations',
	get_id('@', 'fp_country@name@Europe'),
	get_id('@', 'fp_confederation@long_name@Fédération Internationale de Football Association')
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
	get_id('@', 'fp_country@name@Afghanistan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')	
),
(
	'FAF',
	'Angolan Football Federation',
	get_id('@', 'fp_country@name@Angola'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FSHF',
	'Federata Shqiptare e Futbollit',
	get_id('@', 'fp_country@name@Albania'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FAF',
	'Federació Andorrana de Futbol',
	get_id('@', 'fp_country@name@Andorra'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'UAEFA',
	'UAE Football Association',
	get_id('@', 'fp_country@name@United Arab Emirates'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'AFA',
	'Asociación del Fútbol Argentino',
	get_id('@', 'fp_country@name@Argentina'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'FFA',
	'Football Federation of Armenia',
	get_id('@', 'fp_country@name@Armenia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'ABFA',
	'Antigua and Barbuda Football Association',
	get_id('@', 'fp_country@name@Antigua and Barbuda'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FFA',
	'Football Federation Australia',
	get_id('@', 'fp_country@name@Australia'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'ÖFB',
	'Österreichischer Fußball-Bund',
	get_id('@', 'fp_country@name@Austria'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'AFFA',
	'Association of Football Federations of Azerbaijan',
	get_id('@', 'fp_country@name@Azerbaijan'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFB',
	'Fédération de Football du Burundi',
	get_id('@', 'fp_country@name@Burundi'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'KBVB',
	'Royal Belgian Football Association',
	get_id('@', 'fp_country@name@Belgium'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FBF',
	'Fédération Béninoise de Football',
	get_id('@', 'fp_country@name@Benin'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FBF',
	'Fédération Burkinabé de Football',
	get_id('@', 'fp_country@name@Burkina Faso'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'BFF',
	'Bangladesh Football Federation',
	get_id('@', 'fp_country@name@Bangladesh'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'BFU',
	'Bulgarian Football Union',
	get_id('@', 'fp_country@name@Bulgaria'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'BFA',
	'Bahrain Football Association',
	get_id('@', 'fp_country@name@Bahrain'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'BFA',
	'Bahamas Football Association',
	get_id('@', 'fp_country@name@Bahamas'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'N/FSBiH',
	'Nogometni/Fudbalski Savez Bosne i Hercegovine',
	get_id('@', 'fp_country@name@Bosnia and Herzegovina'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'BFF',
	'Football Federation of Belarus',
	get_id('@', 'fp_country@name@Belarus'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFB',
	'Football Federation of Belize',
	get_id('@', 'fp_country@name@Belize'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FBF',
	'Federación Boliviana de Fútbol',
	get_id('@', 'fp_country@name@Bolivia'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'CBF',
	'Confederação Brasileira de Futebol',
	get_id('@', 'fp_country@name@Brazil'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'BFA',
	'Barbados Football Association',
	get_id('@', 'fp_country@name@Barbados'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'NFABD',
	'National Football Association of Brunei Darussalam',
	get_id('@', 'fp_country@name@Brunei'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'BFF',
	'Bhutan Football Federation',
	get_id('@', 'fp_country@name@Bhutan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'BFA',
	'Botswana Football Association',
	get_id('@', 'fp_country@name@Botswana'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),

(
	'FCF',
	'Fédération Centrafricaine de Football',
	get_id('@', 'fp_country@name@Central African Republic'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'CSA',
	'Canada Soccer',
	get_id('@', 'fp_country@name@Canada'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'SFV',
	'Swiss Football Association',
	get_id('@', 'fp_country@name@Switzerland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFCh',
	'Federación de Fútbol de Chile',
	get_id('@', 'fp_country@name@Chile'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'CFA',
	'Chinese Football Association',
	get_id('@', 'fp_country@name@China'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FIF',
	'Fédération Ivoirienne de Football',
	get_id('@', 'fp_country@name@Côte d''Ivoire'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FECAFOOT',
	'Fédération Camerounaise de Football',
	get_id('@', 'fp_country@name@Cameroon'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FECOFA',
	'Fédération Congolaise de Football-Association',
	get_id('@', 'fp_country@name@Democratic Republic of the Congo'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FECOFOOT',
	'Fédération Congolaise de Football',
	get_id('@', 'fp_country@name@Congo'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FCF',
	'Federación Colombiana de Fútbol',
	get_id('@', 'fp_country@name@Colombia'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'FFC',
	'Fédération Comorienne de Football',
	get_id('@', 'fp_country@name@Comoros'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FCF',
	'Federação Caboverdiana de Futebol',
	get_id('@', 'fp_country@name@Cabo Verde'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FEDEFUTBOL',
	'Federación Costarricense de Fútbol',
	get_id('@', 'fp_country@name@Costa Rica'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'AFC',
	'Asociación de Fútbol de Cuba',
	get_id('@', 'fp_country@name@Cuba'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FFK',
	'Federashon Futbòl Kòrsou',
	get_id('@', 'fp_country@name@Curaçao'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'CFA',
	'Cyprus Football Association',
	get_id('@', 'fp_country@name@Cyprus'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FAČR',
	'Fotbalová asociace České republiky',
	get_id('@', 'fp_country@name@Czech Republic'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'DFB',
	'Deutscher Fußball-Bund',
	get_id('@', 'fp_country@name@Germany'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FDF',
	'Fédération Djiboutienne de Football',
	get_id('@', 'fp_country@name@Djibouti'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'DFA',
	'Dominica Football Association',
	get_id('@', 'fp_country@name@Dominica'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'DBU',
	'Dansk Boldspil-Union',
	get_id('@', 'fp_country@name@Denmark'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FEDOFUTBOL',
	'Federación Dominicana de Fútbol',
	get_id('@', 'fp_country@name@Dominican Republic'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FAF',
	'Fédération Algérienne de Football',
	get_id('@', 'fp_country@name@Algeria'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FEF',
	'Federación Ecuatoriana de Fútbol',
	get_id('@', 'fp_country@name@Ecuador'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'EFA',
	'Egyptian Football Association',
	get_id('@', 'fp_country@name@Egypt'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FA',
	'The Football Association',
	get_id('@', 'fp_country@name@England'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'ENFF',
	'Eritrean National Football Federation',
	get_id('@', 'fp_country@name@Eritrea'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'RFEF',
	'Real Federación Española de Fútbol',
	get_id('@', 'fp_country@name@Spain'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'EJL',
	'Eesti Jalgpalli Liit',
	get_id('@', 'fp_country@name@Estonia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'EFF',
	'Ethiopian Football Federation',
	get_id('@', 'fp_country@name@Ethiopia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'SPL',
	'Suomen Palloliitto',
	get_id('@', 'fp_country@name@Finland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFA',
	'Fiji Football Association',
	get_id('@', 'fp_country@name@Fiji'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'FFF',
	'Fédération Française de Football',
	get_id('@', 'fp_country@name@France'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FSMFA',
	'Federated States of Micronesia Football Association',
	get_id('@', 'fp_country@name@Micronesia'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'FEGAFOOT',
	'Fédération Gabonaise de Football',
	get_id('@', 'fp_country@name@Gabon'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'GFF',
	'Georgian Football Federation',
	get_id('@', 'fp_country@name@Georgia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'GFA',
	'Ghana Football Association',
	get_id('@', 'fp_country@name@Ghana'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FGF',
	'Fédération Guinéenne de Football',
	get_id('@', 'fp_country@name@Guinea'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'GFF',
	'Gambia Football Federation',
	get_id('@', 'fp_country@name@Gambia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FFGB',
	'Federação de Futebol da Guiné-Bissau',
	get_id('@', 'fp_country@name@Guinea-Bissau'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FEGUIFUT',
	'Federación Ecuatoguineana de Fútbol',
	get_id('@', 'fp_country@name@Equatorial Guinea'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'EPO',
	'Hellenic Football Federation',
	get_id('@', 'fp_country@name@Greece'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'GFA',
	'Grenada Football Association',
	get_id('@', 'fp_country@name@Grenada'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FENAFUTH',
	'Federación Nacional de Fútbol de Guatemala',
	get_id('@', 'fp_country@name@Guatemala'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'GFF',
	'Guyana Football Federation',
	get_id('@', 'fp_country@name@Guyana'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FENAFUTH',
	'Federación Nacional Autónoma de Fútbol de Honduras',
	get_id('@', 'fp_country@name@Honduras'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'HNS',
	'Hrvatski nogometni savez',
	get_id('@', 'fp_country@name@Croatia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FHF',
	'Fédération Haïtienne de Football',
	get_id('@', 'fp_country@name@Haiti'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'MLSZ',
	'Magyar Labdarúgó Szövetség',
	get_id('@', 'fp_country@name@Hungary'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'PSSI',
	'Indonesian Football Association',
	get_id('@', 'fp_country@name@Indonesia'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'AIFF',
	'All India Football Federation',
	get_id('@', 'fp_country@name@India'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FAI',
	'Football Association of Ireland',
	get_id('@', 'fp_country@name@Ireland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFIRI',
	'Football Federation Islamic Republic of Iran',
	get_id('@', 'fp_country@name@Iran'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'IFA',
	'Iraq Football Association',
	get_id('@', 'fp_country@name@Iraq'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'KSÍ',
	'Knattspyrnusamband Íslands',
	get_id('@', 'fp_country@name@Iceland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'IFA',
	'Israel Football Association',
	get_id('@', 'fp_country@name@Israel'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FIGC',
	'Federazione Italiana Giuoco Calcio',
	get_id('@', 'fp_country@name@Italy'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'JFF',
	'Jamaica Football Federation',
	get_id('@', 'fp_country@name@Jamaica'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'JFA',
	'Jordan Football Association',
	get_id('@', 'fp_country@name@Jordan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'JFA',
	'Japan Football Association',
	get_id('@', 'fp_country@name@Japan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FFK',
	'Football Federation of Kazakhstan',
	get_id('@', 'fp_country@name@Kazakhstan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FKF',
	'Football Kenya Federation',
	get_id('@', 'fp_country@name@Kenya'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FFKR',
	'Football Federation of the Kyrgyz Republic',
	get_id('@', 'fp_country@name@Kyrgyzstan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FFC',
	'Football Federation of Cambodia',
	get_id('@', 'fp_country@name@Cambodia'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'KIFA',
	'Kiribati Islands Football Association',
	get_id('@', 'fp_country@name@Kiribati'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'SKNFA',
	'Saint Kitts and Nevis Football Association',
	get_id('@', 'fp_country@name@Saint Kitts and Nevis'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'KFA',
	'Korea Football Association',
	get_id('@', 'fp_country@name@South Korea'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'KFA',
	'Kuwait Football Association',
	get_id('@', 'fp_country@name@Kuwait'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'LFF',
	'Lao Football Federation',
	get_id('@', 'fp_country@name@Lao People''s Democratic Republic'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Lebanese Football Association',
	get_id('@', 'fp_country@name@Lebanon'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Liberia Football Association',
	get_id('@', 'fp_country@name@Liberia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'LFF',
	'Libyan Football Federation',
	get_id('@', 'fp_country@name@Libya'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'SLFA',
	'Saint Lucia Football Association',
	get_id('@', 'fp_country@name@Saint Lucia'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'LFV',
	'Liechtensteiner Fussballverband',
	get_id('@', 'fp_country@name@Liechtenstein'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFSL',
	'Football Federation of Sri Lanka',
	get_id('@', 'fp_country@name@Sri Lanka'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'LFA',
	'Lesotho Football Association',
	get_id('@', 'fp_country@name@Lesotho'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'LFF',
	'Lithuanian Football Federation',
	get_id('@', 'fp_country@name@Lithuania'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FLF',
	'Luxembourg Football Federation',
	get_id('@', 'fp_country@name@Luxembourg'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'LFF',
	'Latvijas Futbola federācija',
	get_id('@', 'fp_country@name@Latvia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FRMF',
	'Royal Moroccan Football Federation',
	get_id('@', 'fp_country@name@Morocco'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FMF',
	'Fédération Monegasque de Football',
	get_id('@', 'fp_country@name@Monaco'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FMF',
	'Federația Moldovenească de Fotbal',
	get_id('@', 'fp_country@name@Moldova'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FMF',
	'Fédération Malagasy de Football',
	get_id('@', 'fp_country@name@Madagascar'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Maldives',
	get_id('@', 'fp_country@name@Maldives'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FMF',
	'Federación Mexicana de Fútbol Asociación',
	get_id('@', 'fp_country@name@Mexico'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'MISA',
	'Marshall Islands Soccer Association',
	get_id('@', 'fp_country@name@Marshall Islands'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'FFM',
	'Football Federation of North Macedonia',
	get_id('@', 'fp_country@name@North Macedonia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FEMAFOOT',
	'Fédération Malienne de Football',
	get_id('@', 'fp_country@name@Mali'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'MFA',
	'Malta Football Association',
	get_id('@', 'fp_country@name@Malta'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'MFF',
	'Myanmar Football Federation',
	get_id('@', 'fp_country@name@Myanmar'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FSCG',
	'Fudbalski Savez Crne Gore',
	get_id('@', 'fp_country@name@Montenegro'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'MFF',
	'Mongolian Football Federation',
	get_id('@', 'fp_country@name@Mongolia'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FMF',
	'Federação Moçambicana de Futebol',
	get_id('@', 'fp_country@name@Mozambique'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FFRIM',
	'Fédération de Football de la République Islamique de Mauritanie',
	get_id('@', 'fp_country@name@Mauritania'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'MFA',
	'Mauritius Football Association',
	get_id('@', 'fp_country@name@Mauritius'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Malawi',
	get_id('@', 'fp_country@name@Malawi'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FAM',
	'Football Association of Malaysia',
	get_id('@', 'fp_country@name@Malaysia'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'NFA',
	'Namibia Football Association',
	get_id('@', 'fp_country@name@Namibia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FENIFOOT',
	'Fédération Nigerienne de Football',
	get_id('@', 'fp_country@name@Niger'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'NFF',
	'Nigeria Football Federation',
	get_id('@', 'fp_country@name@Nigeria'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FENIFUT',
	'Federación Nicaragüense de Fútbol',
	get_id('@', 'fp_country@name@Nicaragua'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'IFA',
	'Irish Football Association',
	get_id('@', 'fp_country@name@Northern Ireland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'NISA',
	'Niue Island Soccer Association',
	get_id('@', 'fp_country@name@Niue'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'KNVB',
	'Koninklijke Nederlandse Voetbalbond',
	get_id('@', 'fp_country@name@Netherlands'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'NFF',
	'Norges Fotballforbund',
	get_id('@', 'fp_country@name@Norway'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'ANFA',
	'All Nepal Football Association',
	get_id('@', 'fp_country@name@Nepal'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')	
),
(
	'NZF',
	'New Zealand Football',
	get_id('@', 'fp_country@name@New Zealand'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'OFA',
	'Oman Football Association',
	get_id('@', 'fp_country@name@Oman'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'PFF',
	'Pakistan Football Federation',
	get_id('@', 'fp_country@name@Pakistan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FEPAFUT',
	'Federación Panameña de Fútbol',
	get_id('@', 'fp_country@name@Panama'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FPF',
	'Federación Peruana de Futbol',
	get_id('@', 'fp_country@name@Peru'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'PFF',
	'Philippine Football Federation',
	get_id('@', 'fp_country@name@Philippines'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'PFA',
	'Palau Football Association',
	get_id('@', 'fp_country@name@Palau'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'PNGFA',
	'Papua New Guinea Football Association',
	get_id('@', 'fp_country@name@Papua New Guinea'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'PZPN',
	'Polski Związek Piłki Nożnej',
	get_id('@', 'fp_country@name@Poland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FPF',
	'Federación Puertorriqueña de Fútbol',
	get_id('@', 'fp_country@name@Puerto Rico'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'DPRK FA',
	'DPR Korea Football Association',
	get_id('@', 'fp_country@name@North Korea'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FPF',
	'Federação Portuguesa de Futebol',
	get_id('@', 'fp_country@name@Portugal'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'APF',
	'Asociación Paraguaya de Fútbol',
	get_id('@', 'fp_country@name@Paraguay'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'PFA',
	'Palestine Football Association',
	get_id('@', 'fp_country@name@Palestine'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'QFA',
	'Qatar Football Association',
	get_id('@', 'fp_country@name@Qatar'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FRF',
	'Federația Română de Fotbal',
	get_id('@', 'fp_country@name@Romania'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'RFU',
	'Russian Football Union',
	get_id('@', 'fp_country@name@Russian Federation'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FERWAFA',
	'Fédération Rwandaise de Football Association',
	get_id('@', 'fp_country@name@Rwanda'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'SAFF',
	'Saudi Arabian Football Federation',
	get_id('@', 'fp_country@name@Saudi Arabia'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'SFA',
	'Scottish Football Association',
	get_id('@', 'fp_country@name@Scotland'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'SFA',
	'Sudan Football Association',
	get_id('@', 'fp_country@name@Sudan'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FSF',
	'Fédération Sénégalaise de Football',
	get_id('@', 'fp_country@name@Senegal'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FAS',
	'Football Association of Singapore',
	get_id('@', 'fp_country@name@Singapore'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'SIFF',
	'Solomon Islands Football Federation',
	get_id('@', 'fp_country@name@Solomon Islands'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'SLFA',
	'Sierra Leone Football Association',
	get_id('@', 'fp_country@name@Sierra Leone'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FESFUT',
	'Federación Salvadoreña de Fútbol',
	get_id('@', 'fp_country@name@El Salvador'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FSGC',
	'Federazione Sammarinese Giuoco Calcio',
	get_id('@', 'fp_country@name@San Marino'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'SFF',
	'Somali Football Federation',
	get_id('@', 'fp_country@name@Somalia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FSS',
	'Football Association of Serbia',
	get_id('@', 'fp_country@name@Serbia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'SSFA',
	'South Sudan Football Association',
	get_id('@', 'fp_country@name@South Sudan'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FSF',
	'Federação Santomense de Futebol',
	get_id('@', 'fp_country@name@São Tomé and Príncipe'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'SVB',
	'Surinaamse Voetbal Bond',
	get_id('@', 'fp_country@name@Suriname'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'SFZ',
	'Slovenský futbalový zväz',
	get_id('@', 'fp_country@name@Slovakia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'NZS',
	'Nogometna zveza Slovenije',
	get_id('@', 'fp_country@name@Slovenia'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'SvFF',
	'Svenska Fotbollförbundet',
	get_id('@', 'fp_country@name@Sweden'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'EFA',
	'Eswatini Football Association',
	get_id('@', 'fp_country@name@Eswatini'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'SFF',
	'Seychelles Football Federation',
	get_id('@', 'fp_country@name@Seychelles'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'SAFA',
	'Syrian Arab Football Association',
	get_id('@', 'fp_country@name@Syria'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FTFA',
	'Fédération Tchadienne de Football',
	get_id('@', 'fp_country@name@Chad'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FTF',
	'Fédération Togolaise de Football',
	get_id('@', 'fp_country@name@Togo'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FAT',
	'Football Association of Thailand',
	get_id('@', 'fp_country@name@Thailand'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'TFF',
	'Tajikistan Football Federation',
	get_id('@', 'fp_country@name@Tajikistan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FFT',
	'Football Federation of Turkmenistan',
	get_id('@', 'fp_country@name@Turkmenistan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'FFTL',
	'Federação de Futebol de Timor-Leste',
	get_id('@', 'fp_country@name@Timor-Leste'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'TFA',
	'Tonga Football Association',
	get_id('@', 'fp_country@name@Tonga'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'TTFA',
	'Trinidad and Tobago Football Association',
	get_id('@', 'fp_country@name@Trinidad and Tobago'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FTF',
	'Fédération Tunisienne de Football',
	get_id('@', 'fp_country@name@Tunisia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'TFF',
	'Türkiye Futbol Federasyonu',
	get_id('@', 'fp_country@name@Türkiye'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'CTFA',
	'Chinese Taipei Football Association',
	get_id('@', 'fp_country@name@Taiwan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'TFF',
	'Tanzania Football Federation',
	get_id('@', 'fp_country@name@Tanzania'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FUFA',
	'Federation of Uganda Football Associations',
	get_id('@', 'fp_country@name@Uganda'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'UAF',
	'Ukrainian Association of Football',
	get_id('@', 'fp_country@name@Ukraine'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'AUF',
	'Asociación Uruguaya de Fútbol',
	get_id('@', 'fp_country@name@Uruguay'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'USSF',
	'United States Soccer Federation',
	get_id('@', 'fp_country@name@United States'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'UFA',
	'Uzbekistan Football Association',
	get_id('@', 'fp_country@name@Uzbekistan'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'SVGFF',
	'Saint Vincent and the Grenadines Football Federation',
	get_id('@', 'fp_country@name@Saint Vincent and the Grenadines'),
	get_id('@', 'fp_confederation@long_name@Confederation of North and Central America and Caribbean Association Football')
),
(
	'FVF',
	'Federación Venezolana de Fútbol',
	get_id('@', 'fp_country@name@Venezuela'),
	get_id('@', 'fp_confederation@long_name@Confederación Sudamericana de Fútbol')
),
(
	'VFF',
	'Vietnam Football Federation',
	get_id('@', 'fp_country@name@Vietnam'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'VFF',
	'Vanuatu Football Federation',
	get_id('@', 'fp_country@name@Vanuatu'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'FAW',
	'Football Association of Wales',
	get_id('@', 'fp_country@name@Wales'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'FFS',
	'Football Federation Samoa',
	get_id('@', 'fp_country@name@Samoa'),
	get_id('@', 'fp_confederation@long_name@Oceania Football Confederation')
),
(
	'FFK',
	'Football Federation of Kosovo',
	get_id('@', 'fp_country@name@Kosovo'),
	get_id('@', 'fp_confederation@long_name@Union of European Football Associations')
),
(
	'YFA',
	'Yemen Football Association',
	get_id('@', 'fp_country@name@Yemen'),
	get_id('@', 'fp_confederation@long_name@Asian Football Confederation')
),
(
	'SAFA',
	'South African Football Association',
	get_id('@', 'fp_country@name@South Africa'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'FAZ',
	'Football Association of Zambia',
	get_id('@', 'fp_country@name@Zambia'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
),
(
	'ZIFA',
	'Zimbabwe Football Association',
	get_id('@', 'fp_country@name@Zimbabwe'),
	get_id('@', 'fp_confederation@long_name@Confederation of African Football')
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
 * INSERT COMPETITION
 ******************************************************************************/

INSERT INTO fp_competition (type, team_type, name, frequency, confederation_id)
VALUES
(
	'LEAGUE',
	'CLUB',
	'Afghan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Afghanistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria Superiore',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Parë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kategoria e Dytë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Superkupa e Shqipërisë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'CUP',
	'CLUB',
	'Kupa e Shqipërisë',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federata Shqiptare e Futbollit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Girabola',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segundona',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Angolan SuperCup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Angolan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Angolan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Divisió',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segona Divisió',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Andorran Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Constitució',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federació Andorrana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE First Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'UAE Second Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'UAE President''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'UAE Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@UAE Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Profesional de Fútbol',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Nacional',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Argentina',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Argentina',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Centenario de la AFA',
	100,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación del Fútbol Argentino'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Armenian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Armenian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Armenian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'CUP',
	'CLUB',
	'Armenian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Armenia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Antigua and Barbuda Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Antigua and Barbuda FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Antigua and Barbuda Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'A-League Men',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia'
	)
),
(
	'CUP',
	'CLUB',
	'Australia Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Australia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Österreichische Fußball-Bundesliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Admiral 2. Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Austrian Regionalliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'CUP',
	'CLUB',
	'ÖFB-Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'ÖFB-Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Österreichischer Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Premyer Liqası',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azərbaycan Birinci Divizionu',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'CUP',
	'CLUB',
	'Azərbaycan Kuboku',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Azərbaycan Superkuboku',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Association of Football Federations of Azerbaijan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Burundi Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Burundi',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football du Burundi'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jupiler Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Challenger Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belgian National Division 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Beker van België',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Belgische Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Belgian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Bénin',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Bénin',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Béninoise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National du Faso',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Burkina Faso',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Burkinabé de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bangladesh Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bangladesh Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bulgarian Second League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Third Amateur Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'CUP',
	'CLUB',
	'Bulgarian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Bulgarian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bulgarian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bahraini Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Bahraini King''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Bahraini Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahrain Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'BFA Senior League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bahamas Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premijer Liga Bosne i Hercegovine',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga FBiH',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva Liga Republike Srpske',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'CUP',
	'CLUB',
	'Kup Bosne i Hercegovine',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nogometni/Fudbalski Savez Bosne i Hercegovine'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian First League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Belarusian Second League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'CUP',
	'CLUB',
	'Belarusian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Belarusian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belarus'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League of Belize',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Belize'
	)
),
(
	'LEAGUE',
	'CLUB',
	'División de Fútbol Profesional',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Boliviana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Brasileiro Série D',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa do Brasil',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa do Brasil',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Confederação Brasileira de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Barbados Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Barbados FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Barbados Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Brunei Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'CUP',
	'CLUB',
	'Brunei FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Brunei Super Cup',
	0,
	get_id
	(
		'@',
		'fp_confederation@long_name@National Football Association of Brunei Darussalam'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bhutan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Bhutan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botswana Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'FA Challenge Cup Botswana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Botswana Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Central African Republic League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Centrafricaine de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Canadian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Canada Soccer'
	)
),
(
	'CUP',
	'CLUB',
	'Canadian Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Canada Soccer'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Challenge League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Swiss Promotion League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Schweizer Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Swiss Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional Scotiabank',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Chile',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de Chile',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación de Fútbol de Chile'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Chinese Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'China League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'China League Two',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Chinese FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'SUPER CUP',
	 'CLUB',
	'Chinese FA Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Chinese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'MTN Ligue 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe de Côte d''Ivoire',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Ivoirienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'MTN Elite One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Cameroon Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Camerounaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Linafoot',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du DR Congo',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football-Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National MTN',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Congo',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Congolaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Torneo BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa BetPlay Dimayor',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Superliga BetPlay DIMAYOR',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Colombiana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Comoros Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Comorienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cape Verdean Football Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional de Cabo Verde',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Caboverdiana de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Promerica',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda División de Costa Rica',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Costa Rican Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Costarricense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional de Fútbol de Cuba',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación de Fútbol de Cuba'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Curaçao Promé Divishon',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federashon Futbòl Kòrsou'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Second Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cypriot Third Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Cypriot Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Cyprus Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. česká fotbalová liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fotbalová národní liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'CUP',
	'CLUB',
	'Czech Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Czech Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fotbalová asociace České republiky'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Bundesliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. Bundesliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'3. Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Regionalliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'CUP',
	'CLUB',
	'DFB-Pokal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'DFL-Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Deutscher Fußball-Bund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Djibouti Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Djibouti FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Djiboutienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Dominica Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dominica Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'3F Superliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'NordicBet Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'CUP',
	'CLUB',
	'Danish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Danish SuperCup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Dansk Boldspil-Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Dominicana de Fútbol',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Dominicana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Professional League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tunisian Ligue Professionnelle 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe d''Algérie de football',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Super Coupe d''Algérie de football',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Algérienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Pro Ecuador Serie A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Categoría Serie B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Ecuador',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoriana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Egyptian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Egypt Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Egyptian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Egyptian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'EFL League Two',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'FA Community Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@The Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eritrean Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eritrean National Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'LaLiga EA Sports',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'LALIGA HYPERMOTION',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera Federación',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Segunda Federación',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa del Rey',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa de España',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Federación',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Real Federación Española de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Meistriliiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Esiliiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'CUP',
	'CLUB',
	'Estonian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Estonian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Eesti Jalgpalli Liit'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ethiopian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Ethiopian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ethiopian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Veikkausliiga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ykkönen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kakkonen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Finnish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Suomen Palloliitto'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Fiji Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Fiji Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fiji Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Championnat National 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe de France',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Trophée des Champions',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Française de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pohnpei Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federated States of Micronesia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gabon Championnat National D1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe du Gabon Interclubs',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Gabonaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Erovnuli Liga 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Georgian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Georgian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Georgian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ghana Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Ghana FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Ghana Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFA League First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Gambian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Gambia Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Campeonato Nacional da Guiné-Bissau',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau'
	)
),
(
	'CUP',
	'CLUB',
	'Taça Nacional da Guiné Bissau',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação de Futebol da Guiné-Bissau'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Equatoguinean Primera División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Equatoguinean Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Ecuatoguineana de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Super League Greece 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gamma Ethniki',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Greek Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Cup of Friendship and Solidarity',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hellenic Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFA Premier Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Grenada Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol de Guatemala',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División de Ascenso',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'CUP',
	'CLUB',
	'Copa de Guatemala',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional de Fútbol de Guatemala'
	)
),
(
	'LEAGUE',
	'CLUB',
	'GFF National Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Guyana Mayors Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Guyana Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Nacional de Fútbol Profesional de Honduras',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras'
	)
),
(
	'CUP',
	'CLUB',
	'Honduran Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nacional Autónoma de Fútbol de Honduras'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperSport Hrvatska nogometna liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva nogometna liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Druga nogometna liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'CUP',
	'CLUB',
	'Hrvatski nogometni kup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Hrvatski nogometni superkup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Hrvatski nogometni savez'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue Haïtienne',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Coupe d''Haïti',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Haïtienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság I',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság II',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nemzeti Bajnokság III',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'CUP',
	'CLUB',
	'Magyar Kupa',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Magyar Labdarúgó Szövetség'
	)
),
(
	'LEAGUE',
	'CLUB',
	'BRI Liga 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Piala Indonesia',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Indonesian Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Indian Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I-League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I-League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'AIFF Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All India Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland Premier Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland'
	)
),
(
	'LEAGUE',
	'CLUB',
	'League of Ireland First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland'
	)
),
(
	'CUP',
	'CLUB',
	'Sports Direct FAI Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Ireland'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Persian Gulf Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Azadegan League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'CUP',
	'CLUB',
	'Hazfi Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Iran Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation Islamic Republic of Iran'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Iraq Stars League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Iraqi Premier Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Iraq FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Iraqi Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Iraq Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Besta deild karla',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'1. deild karla',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'2. deild karla',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'CUP',
	'CLUB',
	'Icelandic Men''s Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Icelandic Men''s Football Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Knattspyrnusamband Íslands'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligat Ha`Al',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Leumit',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Alef',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Israel State Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Israel Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Israel Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie B',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Serie D',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Italia',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa Italiana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'CUP',
	'CLUB',
	'Coppa Italia Serie C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercoppa di Serie C',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federazione Italiana Giuoco Calcio'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jamaica Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'JFF Champions Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jamaica Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Jordanian Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Jordan FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Jordan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Jordan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J1 League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J2 League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'J3 League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Japan Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Emperor''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Japanese Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Japan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kazakhstan First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'CUP',
	'CLUB',
	'Kazakhstan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kazakhstan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Kazakhstan'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kenyan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation'
	)
),
(
	'CUP',
	'CLUB',
	'FKF President''s Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kenyan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Kenya Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kyrgyz Pervaja Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'CUP',
	'CLUB',
	'Kyrgyzstan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kyrgyzstan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of the Kyrgyz Republic'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Cambodian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Cambodia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kiribati National Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kiribati Islands Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SKNFA Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Saint Kitts and Nevis National Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Kitts and Nevis Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'K League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'K League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Korea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Korean FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Kuwait Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Kuwait Emir Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Kuwait Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Kuwait Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lao League 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lao Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lebanese Second Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Lebanese FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Lebanese Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lebanese Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liberian First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Liberian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Liberia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Libyan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Libyan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Libyan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Libyan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SLFA First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Saint Lucia FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saint Lucia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Liechtenstein Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Liechtensteiner Fussballverband'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sri Lanka Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka'
	)
),
(
	'CUP',
	'CLUB',
	'Sri Lanka FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of Sri Lanka'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Lesotho Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Lesotho Independence Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lesotho Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'A Lyga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pirma lyga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Lithuanian Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Lithuanian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Lithuanian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg National Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Luxembourg Division of Honour',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Luxembourg Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Luxembourg Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Virsliga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Latvijas Pirmā līga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'CUP',
	'CLUB',
	'Latvijas kauss',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Latvian Supercup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Latvijas Futbola federācija'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 1',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Botola Pro 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Moroccan Throne Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Royal Moroccan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Challenge Prince Rainier III',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Monegasque de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Divizia Națională',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Divizia A',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'CUP',
	'CLUB',
	'Moldovan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Moldovan Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Moldovenească de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malagasy Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Malagasy de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Dhivehi Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives'
	)
),
(
	'CUP',
	'CLUB',
	'Maldives FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Maldives'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga de Expansión MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Premier de México',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'CUP',
	'CLUB',
	'Copa MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Campeón de Campeones MX',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Mexicana de Fútbol Asociación'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva makedonska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Vtora makedonska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'CUP',
	'CLUB',
	'Kup na Makedonija',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Macedonian Supercup',
	0,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Federation of North Macedonia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malian Première Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Malian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Malienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Malta Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Maltese Challenge League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Malta Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Myanmar National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'General Aung San Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Myanmar Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Prva crnogorska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Druga crnogorska fudbalska liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'CUP',
	'CLUB',
	'Crnogorski fudbalski kup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fudbalski Savez Crne Gore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Mongolian National Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'MFF Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mongolian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Moçambola',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça de Moçambique',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Moçambicana de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ligue 1 Mauritania',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie'
	)
),
(
	'CUP',
	'CLUB',
	'Mauritanian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération de Football de la République Islamique de Mauritanie'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Mauritian League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Mauritian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Mauritius Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malawi Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Malawi'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Malaysia Super League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia'
	)
),
(
	'CUP',
	'CLUB',
	'Malaysia FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Malaysia'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Namibia Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Namibia FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Namibia Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Niger Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Niger Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Nigerienne de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nigerian Premier Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Nigerian FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Nigeria Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Nicaraguan Primera División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol'
	)
),

(
	'CUP',
	'CLUB',
	'Copa de Nicaragua',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Nicaragüense de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Irish Premiership',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'NIFL Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Irish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'NIFL Charity Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Irish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Niue Soccer Tournament',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Niue Island Soccer Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eredivisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eerste Divisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Tweede Divisie',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'CUP',
	'CLUB',
	'KNVB Beker',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Johan Cruijff Schaal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Koninklijke Nederlandse Voetbalbond'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Eliteserien',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Norwegian First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'CUP',
	'CLUB',
	'Norwegian Football Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Mesterfinalen',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Norges Fotballforbund'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial A-Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Martyr''s Memorial B-Division League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Ncell Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@All Nepal Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'New Zealand National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@New Zealand Football'
	)
),
(
	'CUP',
	'CLUB',
	'Chatham Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@New Zealand Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Oman Professional League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Oman Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Sultan Qaboos Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Oman Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Pakistan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Pakistan National Football Challenge Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Pakistan Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Asociación Nacional Pro Fútbol',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Panamá',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Panameña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Betsson',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Peruvian Segunda División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Bicentenario',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Peruana',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Peruana de Futbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Philippines Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Paulino Alcantara',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Philippine Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Palau Soccer League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Palau Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Papua New Guinea National Soccer League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Papua New Guinea FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Papua New Guinea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Ekstraklasa',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'I liga polska',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'II liga polska',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'CUP',
	'CLUB',
	'Polish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Polish Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Polski Związek Piłki Nożnej'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Puerto Rico',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Puertorriqueña de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'DPR Korea Premier Football League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Hwaebul Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@DPR Korea Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal Betclic',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga Portugal 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Terceira Liga',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'CUP',
	'CLUB',
	'Taça de Portugal',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supertaça Cândido de Oliveira',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federação Portuguesa de Futebol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Primera División Paraguaya',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'División Intermedia',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'CUP',
	'CLUB',
	'Copa Paraguay',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercopa Paraguaya',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Asociación Paraguaya de Fútbol'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Gaza Strip Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Palestine Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Palestine Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Qatar Stars League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Qatari Stars Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Sheikh Jassim Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Qatar Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'SuperLiga României',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga II',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Liga III',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'CUP',
	'CLUB',
	'Cupa României',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Supercupa României',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federația Română de Fotbal'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Russian Football National League 2',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'CUP',
	'CLUB',
	'Russian Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Russian Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Russian Football Union'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Rwanda Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Rwandan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Rwandaise de Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Saudi Pro League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Saudi League First Division',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'CUP',
	'CLUB',
	'The Custodian of The Two Holy Mosques Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Saudi Super Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Saudi Arabian Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Premiership',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish Championship',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Scottish League One',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Scottish Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Scottish Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sudan Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association'
	)
),
(
	'CUP',
	'CLUB',
	'Sudan Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Sudan Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Senegal Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football'
	)
),
(
	'CUP',
	'CLUB',
	'Senegal FA Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Fédération Sénégalaise de Football'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Singapore Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore'
	)
),
(
	'CUP',
	'CLUB',
	'Singapore Cup',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore'
	)
),
(
	'SUPER CUP',
	'CLUB',
	'Singapore Community Shield',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Football Association of Singapore'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Solomon Islands S-League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Solomon Islands Football Federation'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Sierra Leone National Premier League',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Sierra Leone Football Association'
	)
),
(
	'LEAGUE',
	'CLUB',
	'Salvadoran Primera División',
	1,
	get_id
	(
		'@',
		'fp_confederation@long_name@Federación Salvadoreña de Fútbol'
	)
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
('PLAYER', 'Miglior portiere dell''anno IFFHS', 'IFFHS', 'GK');
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
