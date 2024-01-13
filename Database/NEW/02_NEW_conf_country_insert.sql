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
 * INSERT CONFEDERTION COUNTRY
 ******************************************************************************/
INSERT INTO conf_country (conf, country, year)
VALUES
(
	get_id('@', 'conf@name@Fédération Internationale de Football Association'),
	get_id('@', 'country@name@World'),
	1904
),
(
	get_id('@', 'conf@name@Confederation of African Football'),
	get_id('@', 'country@name@Africa'),
	1957
),
(
	get_id('@', 'conf@name@Asian Football Confederation'),
	get_id('@', 'country@name@Asia'),
	1954
),
(
	get_id('@', 'conf@name@Confederation of North and Central America and Caribbean Association Football'),
	get_id('@', 'country@name@North Center America'),
	1961
),
(
	get_id('@', 'conf@name@Oceania Football Confederation'),
	get_id('@', 'country@name@Oceania'),
	1966
),
(
	get_id('@', 'conf@name@Union of European Football Associations'),
	get_id('@', 'country@name@Europe'),
	1954
),
(
	get_id('@', 'conf@name@Confederación Sudamericana de Fútbol'),
	get_id('@', 'country@name@South America'),
	1916
),
(
	get_id('@', 'conf@name@Afghanistan Football Federation'),
	get_id('@', 'country@name@Afghanistan'),
	1922
),
(
	get_id('@', 'conf@name@Angolan Football Federation'),
	get_id('@', 'country@name@Angola'),
	1979
),
(
	get_id('@', 'conf@name@Federata Shqiptare e Futbollit'),
	get_id('@', 'country@name@Albania'),
	1930
),
(
	get_id('@', 'conf@name@Federació Andorrana de Futbol'),
	get_id('@', 'country@name@Andorra'),
	1994
),
(
	get_id('@', 'conf@name@UAE Football Association'),
	get_id('@', 'country@name@United Arab Emirates'),
	1971
),
(
	get_id('@', 'conf@name@Asociación del Fútbol Argentino'),
	get_id('@', 'country@name@Argentina'),
	1893
),
(
	get_id('@', 'conf@name@Football Federation of Armenia'),
	get_id('@', 'country@name@Armenia'),
	1992
),
(
	get_id('@', 'conf@name@Antigua and Barbuda Football Association'),
	get_id('@', 'country@name@Antigua and Barbuda'),
	1928
),
(
	get_id('@', 'conf@name@Football Federation Australia'),
	get_id('@', 'country@name@Australia'),
	1961
),
(
	get_id('@', 'conf@name@Österreichischer Fußball-Bund'),
	get_id('@', 'country@name@Austria'),
	1904
),
(
	get_id('@', 'conf@name@Association of Football Federations of Azerbaijan'),
	get_id('@', 'country@name@Azerbaijan'),
	1992
),
(
	get_id('@', 'conf@name@Fédération de Football du Burundi'),
	get_id('@', 'country@name@Burundi'),
	1948
),
(
	get_id('@', 'conf@name@Royal Belgian Football Association'),
	get_id('@', 'country@name@Belgium'),
	1895
),
(
	get_id('@', 'conf@name@Fédération Béninoise de Football'),
	get_id('@', 'country@name@Benin'),
	1962
),
(
	get_id('@', 'conf@name@Fédération Burkinabé de Football'),
	get_id('@', 'country@name@Burkina Faso'),
	1960
),
(
	get_id('@', 'conf@name@Bangladesh Football Federation'),
	get_id('@', 'country@name@Bangladesh'),
	1972
),
(
	get_id('@', 'conf@name@Bulgarian Football Union'),
	get_id('@', 'country@name@Bulgaria'),
	1923
),
(
	get_id('@', 'conf@name@Bahrain Football Association'),
	get_id('@', 'country@name@Bahrain'),
	1957
),
(
	get_id('@', 'conf@name@Bahamas Football Association'),
	get_id('@', 'country@name@Bahamas'),
	1967
),
(
	get_id('@', 'conf@name@Nogometni/Fudbalski Savez Bosne i Hercegovine'),
	get_id('@', 'country@name@Bosnia and Herzegovina'),
	1992
),
(
	get_id('@', 'conf@name@Football Federation of Belarus'),
	get_id('@', 'country@name@Belarus'),
	1989
),
(
	get_id('@', 'conf@name@Football Federation of Belize'),
	get_id('@', 'country@name@Belize'),
	1980
),
(
	get_id('@', 'conf@name@Federación Boliviana de Fútbol'),
	get_id('@', 'country@name@Bolivia'),
	1925
),
(
	get_id('@', 'conf@name@Confederação Brasileira de Futebol'),
	get_id('@', 'country@name@Brazil'),
	1914
),
(
	get_id('@', 'conf@name@Barbados Football Association'),
	get_id('@', 'country@name@Barbados'),
	1910
),
(
	get_id('@', 'conf@name@National Football Association of Brunei Darussalam'),
	get_id('@', 'country@name@Brunei'),
	1959
),
(
	get_id('@', 'conf@name@Bhutan Football Federation'),
	get_id('@', 'country@name@Bhutan'),
	1983
),
(
	get_id('@', 'conf@name@Botswana Football Association'),
	get_id('@', 'country@name@Botswana'),
	1970
),
(
	get_id('@', 'conf@name@Fédération Centrafricaine de Football'),
	get_id('@', 'country@name@Central African Republic'),
	1961
),
(
	get_id('@', 'conf@name@Canada Soccer'),
	get_id('@', 'country@name@Canada'),
	1912
),
(
	get_id('@', 'conf@name@Swiss Football Association'),
	get_id('@', 'country@name@Switzerland'),
	1895
),
(
	get_id('@', 'conf@name@Federación de Fútbol de Chile'),
	get_id('@', 'country@name@Chile'),
	1895
),
(
	get_id('@', 'conf@name@Chinese Football Association'),
	get_id('@', 'country@name@China'),
	1924
),
(
	get_id('@', 'conf@name@Fédération Ivoirienne de Football'),
	get_id('@', 'country@name@Côte d''Ivoire'),
	1960
),
(
	get_id('@', 'conf@name@Fédération Camerounaise de Football'),
	get_id('@', 'country@name@Cameroon'),
	1959
),
(
	get_id('@', 'conf@name@Fédération Congolaise de Football-Association'),
	get_id('@', 'country@name@Democratic Republic of the Congo'),
	1919
),
(
	get_id('@', 'conf@name@Fédération Congolaise de Football'),
	get_id('@', 'country@name@Congo'),
	1962
),
(
	get_id('@', 'conf@name@Federación Colombiana de Fútbol'),
	get_id('@', 'country@name@Colombia'),
	1924
),
(
	get_id('@', 'conf@name@Fédération Comorienne de Football'),
	get_id('@', 'country@name@Comoros'),
	1979
),
(
	get_id('@', 'conf@name@Federação Caboverdiana de Futebol'),
	get_id('@', 'country@name@Cabo Verde'),
	1982
),
(
	get_id('@', 'conf@name@Federación Costarricense de Fútbol'),
	get_id('@', 'country@name@Costa Rica'),
	1921
),
(
	get_id('@', 'conf@name@Asociación de Fútbol de Cuba'),
	get_id('@', 'country@name@Cuba'),
	1924
),
(
	get_id('@', 'conf@name@Federashon Futbòl Kòrsou'),
	get_id('@', 'country@name@Curaçao'),
	2010
),
(
	get_id('@', 'conf@name@Cyprus Football Association'),
	get_id('@', 'country@name@Cyprus'),
	1934
),
(
	get_id('@', 'conf@name@Fotbalová asociace České republiky'),
	get_id('@', 'country@name@Czech Republic'),
	1901
),
(
	get_id('@', 'conf@name@Deutscher Fußball-Bund'),
	get_id('@', 'country@name@Germany'),
	1900
),
(
	get_id('@', 'conf@name@Fédération Djiboutienne de Football'),
	get_id('@', 'country@name@Djibouti'),
	1979
),
(
	get_id('@', 'conf@name@Dominica Football Association'),
	get_id('@', 'country@name@Dominica'),
	1970
),
(
	get_id('@', 'conf@name@Dansk Boldspil-Union'),
	get_id('@', 'country@name@Denmark'),
	1889
),
(
	get_id('@', 'conf@name@Federación Dominicana de Fútbol'),
	get_id('@', 'country@name@Dominican Republic'),
	1953
),
(
	get_id('@', 'conf@name@Fédération Algérienne de Football'),
	get_id('@', 'country@name@Algeria'),
	1962
),
(
	get_id('@', 'conf@name@Federación Ecuatoriana de Fútbol'),
	get_id('@', 'country@name@Ecuador'),
	1925
),
(
	get_id('@', 'conf@name@Egyptian Football Association'),
	get_id('@', 'country@name@Egypt'),
	1921
),
(
	get_id('@', 'conf@name@The Football Association'),
	get_id('@', 'country@name@England'),
	1863
),
(
	get_id('@', 'conf@name@Eritrean National Football Federation'),
	get_id('@', 'country@name@Eritrea'),
	1996
),
(
	get_id('@', 'conf@name@Real Federación Española de Fútbol'),
	get_id('@', 'country@name@Spain'),
	1909
),
(
	get_id('@', 'conf@name@Eesti Jalgpalli Liit'),
	get_id('@', 'country@name@Estonia'),
	1921
),
(
	get_id('@', 'conf@name@Ethiopian Football Federation'),
	get_id('@', 'country@name@Ethiopia'),
	1943
),
(
	get_id('@', 'conf@name@Suomen Palloliitto'),
	get_id('@', 'country@name@Finland'),
	1907
),
(
	get_id('@', 'conf@name@Fiji Football Association'),
	get_id('@', 'country@name@Fiji'),
	1961
),
(
	get_id('@', 'conf@name@Fédération Française de Football'),
	get_id('@', 'country@name@France'),
	1919
),
(
	get_id('@', 'conf@name@Federated States of Micronesia Football Association'),
	get_id('@', 'country@name@Micronesia'),
	1996
),
(
	get_id('@', 'conf@name@Fédération Gabonaise de Football'),
	get_id('@', 'country@name@Gabon'),
	1962
),
(
	get_id('@', 'conf@name@Georgian Football Federation'),
	get_id('@', 'country@name@Georgia'),
	1990
),
(
	get_id('@', 'conf@name@Ghana Football Association'),
	get_id('@', 'country@name@Ghana'),
	1957
),
(
	get_id('@', 'conf@name@Fédération Guinéenne de Football'),
	get_id('@', 'country@name@Guinea'),
	1960
),
(
	get_id('@', 'conf@name@Gambia Football Federation'),
	get_id('@', 'country@name@Gambia'),
	1952
),
(
	get_id('@', 'conf@name@Federação de Futebol da Guiné-Bissau'),
	get_id('@', 'country@name@Guinea-Bissau'),
	1974
),
(
	get_id('@', 'conf@name@Federación Ecuatoguineana de Fútbol'),
	get_id('@', 'country@name@Equatorial Guinea'),
	1960
),
(
	get_id('@', 'conf@name@Hellenic Football Federation'),
	get_id('@', 'country@name@Greece'),
	1926
),
(
	get_id('@', 'conf@name@Grenada Football Association'),
	get_id('@', 'country@name@Grenada'),
	1924
),
(
	get_id('@', 'conf@name@Federación Nacional de Fútbol de Guatemala'),
	get_id('@', 'country@name@Guatemala'),
	1919
),
(
	get_id('@', 'conf@name@Guyana Football Federation'),
	get_id('@', 'country@name@Guyana'),
	1902
),
(
	get_id('@', 'conf@name@Federación Nacional Autónoma de Fútbol de Honduras'),
	get_id('@', 'country@name@Honduras'),
	1951
),
(
	get_id('@', 'conf@name@Hrvatski nogometni savez'),
	get_id('@', 'country@name@Croatia'),
	1912
),
(
	get_id('@', 'conf@name@Fédération Haïtienne de Football'),
	get_id('@', 'country@name@Haiti'),
	1904
),
(
	get_id('@', 'conf@name@Magyar Labdarúgó Szövetség'),
	get_id('@', 'country@name@Hungary'),
	1901
),
(
	get_id('@', 'conf@name@Indonesian Football Association'),
	get_id('@', 'country@name@Indonesia'),
	1930
),
(
	get_id('@', 'conf@name@All India Football Federation'),
	get_id('@', 'country@name@India'),
	1937
),
(
	get_id('@', 'conf@name@Football Association of Ireland'),
	get_id('@', 'country@name@Ireland'),
	1921
),
(
	get_id('@', 'conf@name@Football Federation Islamic Republic of Iran'),
	get_id('@', 'country@name@Iran'),
	1920
),
(
	get_id('@', 'conf@name@Iraq Football Association'),
	get_id('@', 'country@name@Iraq'),
	1948
),
(
	get_id('@', 'conf@name@Knattspyrnusamband Íslands'),
	get_id('@', 'country@name@Iceland'),
	1947
),
(
	get_id('@', 'conf@name@Israel Football Association'),
	get_id('@', 'country@name@Israel'),
	1928
),
(
	get_id('@', 'conf@name@Federazione Italiana Giuoco Calcio'),
	get_id('@', 'country@name@Italy'),
	1898
),
(
	get_id('@', 'conf@name@Jamaica Football Federation'),
	get_id('@', 'country@name@Jamaica'),
	1910
),
(
	get_id('@', 'conf@name@Jordan Football Association'),
	get_id('@', 'country@name@Jordan'),
	1949
),
(
	get_id('@', 'conf@name@Japan Football Association'),
	get_id('@', 'country@name@Japan'),
	1921
),
(
	get_id('@', 'conf@name@Football Federation of Kazakhstan'),
	get_id('@', 'country@name@Kazakhstan'),
	1914
),
(
	get_id('@', 'conf@name@Football Kenya Federation'),
	get_id('@', 'country@name@Kenya'),
	1960
),
(
	get_id('@', 'conf@name@Football Federation of the Kyrgyz Republic'),
	get_id('@', 'country@name@Kyrgyzstan'),
	1992
),
(
	get_id('@', 'conf@name@Football Federation of Cambodia'),
	get_id('@', 'country@name@Cambodia'),
	1933
),
(
	get_id('@', 'conf@name@Kiribati Islands Football Association'),
	get_id('@', 'country@name@Kiribati'),
	2005
),
(
	get_id('@', 'conf@name@Saint Kitts and Nevis Football Association'),
	get_id('@', 'country@name@Saint Kitts and Nevis'),
	1932
),
(
	get_id('@', 'conf@name@Korea Football Association'),
	get_id('@', 'country@name@South Korea'),
	1933
),
(
	get_id('@', 'conf@name@Kuwait Football Association'),
	get_id('@', 'country@name@Kuwait'),
	1952
),
(
	get_id('@', 'conf@name@Lao Football Federation'),
	get_id('@', 'country@name@Lao People''s Democratic Republic'),
	1951
),
(
	get_id('@', 'conf@name@Lebanese Football Association'),
	get_id('@', 'country@name@Lebanon'),
	1933
),
(
	get_id('@', 'conf@name@Liberia Football Association'),
	get_id('@', 'country@name@Liberia'),
	1936
),
(
	get_id('@', 'conf@name@Libyan Football Federation'),
	get_id('@', 'country@name@Libya'),
	1962
),
(
	get_id('@', 'conf@name@Saint Lucia Football Association'),
	get_id('@', 'country@name@Saint Lucia'),
	1979
),
(
	get_id('@', 'conf@name@Liechtensteiner Fussballverband'),
	get_id('@', 'country@name@Liechtenstein'),
	1934
),
(
	get_id('@', 'conf@name@Football Federation of Sri Lanka'),
	get_id('@', 'country@name@Sri Lanka'),
	1939
),
(
	get_id('@', 'conf@name@Lesotho Football Association'),
	get_id('@', 'country@name@Lesotho'),
	1932
),
(
	get_id('@', 'conf@name@Lithuanian Football Federation'),
	get_id('@', 'country@name@Lithuania'),
	1922
),
(
	get_id('@', 'conf@name@Luxembourg Football Federation'),
	get_id('@', 'country@name@Luxembourg'),
	1908
),
(
	get_id('@', 'conf@name@Latvijas Futbola federācija'),
	get_id('@', 'country@name@Latvia'),
	1921
),
(
	get_id('@', 'conf@name@Royal Moroccan Football Federation'),
	get_id('@', 'country@name@Morocco'),
	1956
),
(
	get_id('@', 'conf@name@Fédération Monegasque de Football'),
	get_id('@', 'country@name@Monaco'),
	1928
),
(
	get_id('@', 'conf@name@Federația Moldovenească de Fotbal'),
	get_id('@', 'country@name@Moldova'),
	1990
),
(
	get_id('@', 'conf@name@Fédération Malagasy de Football'),
	get_id('@', 'country@name@Madagascar'),
	1961
),
(
	get_id('@', 'conf@name@Football Association of Maldives'),
	get_id('@', 'country@name@Maldives'),
	1982
),
(
	get_id('@', 'conf@name@Federación Mexicana de Fútbol Asociación'),
	get_id('@', 'country@name@Mexico'),
	1927
),
(
	get_id('@', 'conf@name@Marshall Islands Soccer Association'),
	get_id('@', 'country@name@Marshall Islands'),
	1989
),
(
	get_id('@', 'conf@name@Football Federation of North Macedonia'),
	get_id('@', 'country@name@North Macedonia'),
	1922
),
(
	get_id('@', 'conf@name@Fédération Malienne de Football'),
	get_id('@', 'country@name@Mali'),
	1960
),
(
	get_id('@', 'conf@name@Malta Football Association'),
	get_id('@', 'country@name@Malta'),
	1900
),
(
	get_id('@', 'conf@name@Myanmar Football Federation'),
	get_id('@', 'country@name@Myanmar'),
	1947
),
(
	get_id('@', 'conf@name@Fudbalski Savez Crne Gore'),
	get_id('@', 'country@name@Montenegro'),
	2006
),
(
	get_id('@', 'conf@name@Mongolian Football Federation'),
	get_id('@', 'country@name@Mongolia'),
	1959
),
(
	get_id('@', 'conf@name@Federação Moçambicana de Futebol'),
	get_id('@', 'country@name@Mozambique'),
	1976
),
(
	get_id('@', 'conf@name@Fédération de Football de la République Islamique de Mauritanie'),
	get_id('@', 'country@name@Mauritania'),
	1961
),
(
	get_id('@', 'conf@name@Mauritius Football Association'),
	get_id('@', 'country@name@Mauritius'),
	1952
),
(
	get_id('@', 'conf@name@Football Association of Malawi'),
	get_id('@', 'country@name@Malawi'),
	1966
),
(
	get_id('@', 'conf@name@Football Association of Malaysia'),
	get_id('@', 'country@name@Malaysia'),
	1933
),
(
	get_id('@', 'conf@name@Namibia Football Association'),
	get_id('@', 'country@name@Namibia'),
	1990
),
(
	get_id('@', 'conf@name@Fédération Nigerienne de Football'),
	get_id('@', 'country@name@Niger'),
	1960
),
(
	get_id('@', 'conf@name@Nigeria Football Federation'),
	get_id('@', 'country@name@Nigeria'),
	1945
),
(
	get_id('@', 'conf@name@Federación Nicaragüense de Fútbol'),
	get_id('@', 'country@name@Nicaragua'),
	1931
),
(
	get_id('@', 'conf@name@Irish Football Association'),
	get_id('@', 'country@name@Northern Ireland'),
	1880
),
(
	get_id('@', 'conf@name@Niue Island Soccer Association'),
	get_id('@', 'country@name@Niue'),
	2012
),
(
	get_id('@', 'conf@name@Koninklijke Nederlandse Voetbalbond'),
	get_id('@', 'country@name@Netherlands'),
	1889
),
(
	get_id('@', 'conf@name@Norges Fotballforbund'),
	get_id('@', 'country@name@Norway'),
	1902
),
(
	get_id('@', 'conf@name@All Nepal Football Association'),
	get_id('@', 'country@name@Nepal'),
	1951
),
(
	get_id('@', 'conf@name@Nauru Football Association'),
	get_id('@', 'country@name@Nauru'),
	1974
),
(
	get_id('@', 'conf@name@New Zealand Football'),
	get_id('@', 'country@name@New Zealand'),
	1891
),
(
	get_id('@', 'conf@name@Oman Football Association'),
	get_id('@', 'country@name@Oman'),
	1978
),
(
	get_id('@', 'conf@name@Pakistan Football Federation'),
	get_id('@', 'country@name@Pakistan'),
	1947
),
(
	get_id('@', 'conf@name@Federación Panameña de Fútbol'),
	get_id('@', 'country@name@Panama'),
	1937
),
(
	get_id('@', 'conf@name@Federación Peruana de Futbol'),
	get_id('@', 'country@name@Peru'),
	1922
),
(
	get_id('@', 'conf@name@Philippine Football Federation'),
	get_id('@', 'country@name@Philippines'),
	1907
),
(
	get_id('@', 'conf@name@Palau Football Association'),
	get_id('@', 'country@name@Palau'),
	1990
),
(
	get_id('@', 'conf@name@Papua New Guinea Football Association'),
	get_id('@', 'country@name@Papua New Guinea'),
	1962
),
(
	get_id('@', 'conf@name@Polski Związek Piłki Nożnej'),
	get_id('@', 'country@name@Poland'),
	1919
),
(
	get_id('@', 'conf@name@Federación Puertorriqueña de Fútbol'),
	get_id('@', 'country@name@Puerto Rico'),
	1940
),
(
	get_id('@', 'conf@name@DPR Korea Football Association'),
	get_id('@', 'country@name@North Korea'),
	1945
),
(
	get_id('@', 'conf@name@Federação Portuguesa de Futebol'),
	get_id('@', 'country@name@Portugal'),
	1914
),
(
	get_id('@', 'conf@name@Asociación Paraguaya de Fútbol'),
	get_id('@', 'country@name@Paraguay'),
	1906
),
(
	get_id('@', 'conf@name@Palestine Football Association'),
	get_id('@', 'country@name@Palestine'),
	1928
),
(
	get_id('@', 'conf@name@Qatar Football Association'),
	get_id('@', 'country@name@Qatar'),
	1960
),
(
	get_id('@', 'conf@name@Federația Română de Fotbal'),
	get_id('@', 'country@name@Romania'),
	1909
),
(
	get_id('@', 'conf@name@Russian Football Union'),
	get_id('@', 'country@name@Russian Federation'),
	1912
),
(
	get_id('@', 'conf@name@Fédération Rwandaise de Football Association'),
	get_id('@', 'country@name@Rwanda'),
	1972
),
(
	get_id('@', 'conf@name@Saudi Arabian Football Federation'),
	get_id('@', 'country@name@Saudi Arabia'),
	1956
),
(
	get_id('@', 'conf@name@Scottish Football Association'),
	get_id('@', 'country@name@Scotland'),
	1873
),
(
	get_id('@', 'conf@name@Sudan Football Association'),
	get_id('@', 'country@name@Sudan'),
	1936
),
(
	get_id('@', 'conf@name@Fédération Sénégalaise de Football'),
	get_id('@', 'country@name@Senegal'),
	1960
),
(
	get_id('@', 'conf@name@Football Association of Singapore'),
	get_id('@', 'country@name@Singapore'),
	1892
),
(
	get_id('@', 'conf@name@Solomon Islands Football Federation'),
	get_id('@', 'country@name@Solomon Islands'),
	1978
),
(
	get_id('@', 'conf@name@Sierra Leone Football Association'),
	get_id('@', 'country@name@Sierra Leone'),
	1967
),
(
	get_id('@', 'conf@name@Federación Salvadoreña de Fútbol'),
	get_id('@', 'country@name@El Salvador'),
	1935
),
(
	get_id('@', 'conf@name@Federazione Sammarinese Giuoco Calcio'),
	get_id('@', 'country@name@San Marino'),
	1931
),
(
	get_id('@', 'conf@name@Somali Football Federation'),
	get_id('@', 'country@name@Somalia'),
	1951
),
(
	get_id('@', 'conf@name@Football Association of Serbia'),
	get_id('@', 'country@name@Serbia'),
	1919
),
(
	get_id('@', 'conf@name@South Sudan Football Association'),
	get_id('@', 'country@name@South Sudan'),
	2011
),
(
	get_id('@', 'conf@name@Federação Santomense de Futebol'),
	get_id('@', 'country@name@São Tomé and Príncipe'),
	1977
),
(
	get_id('@', 'conf@name@Surinaamse Voetbal Bond'),
	get_id('@', 'country@name@Suriname'),
	1920
),
(
	get_id('@', 'conf@name@Slovenský futbalový zväz'),
	get_id('@', 'country@name@Slovak Republic'),
	1938
),
(
	get_id('@', 'conf@name@Nogometna zveza Slovenije'),
	get_id('@', 'country@name@Slovenia'),
	1920
),
(
	get_id('@', 'conf@name@Svenska Fotbollförbundet'),
	get_id('@', 'country@name@Sweden'),
	1904
),
(
	get_id('@', 'conf@name@Eswatini Football Association'),
	get_id('@', 'country@name@Eswatini'),
	1968
),
(
	get_id('@', 'conf@name@Seychelles Football Federation'),
	get_id('@', 'country@name@Seychelles'),
	1988
),
(
	get_id('@', 'conf@name@Syrian Arab Football Association'),
	get_id('@', 'country@name@Syria'),
	1936
),
(
	get_id('@', 'conf@name@Fédération Tchadienne de Football'),
	get_id('@', 'country@name@Chad'),
	1962
),
(
	get_id('@', 'conf@name@Fédération Togolaise de Football'),
	get_id('@', 'country@name@Togo'),
	1960
),
(
	get_id('@', 'conf@name@Football Association of Thailand'),
	get_id('@', 'country@name@Thailand'),
	1916
),
(
	get_id('@', 'conf@name@Tajikistan Football Federation'),
	get_id('@', 'country@name@Tajikistan'),
	1936
),
(
	get_id('@', 'conf@name@Football Federation of Turkmenistan'),
	get_id('@', 'country@name@Turkmenistan'),
	1992
),
(
	get_id('@', 'conf@name@Federação de Futebol de Timor-Leste'),
	get_id('@', 'country@name@Timor-Leste'),
	2002
),
(
	get_id('@', 'conf@name@Tonga Football Association'),
	get_id('@', 'country@name@Tonga'),
	1965
),
(
	get_id('@', 'conf@name@Trinidad and Tobago Football Association'),
	get_id('@', 'country@name@Trinidad and Tobago'),
	1908
),
(
	get_id('@', 'conf@name@Fédération Tunisienne de Football'),
	get_id('@', 'country@name@Tunisia'),
	1957
),
(
	get_id('@', 'conf@name@Türkiye Futbol Federasyonu'),
	get_id('@', 'country@name@Türkiye'),
	1923
),
(
	get_id('@', 'conf@name@Chinese Taipei Football Association'),
	get_id('@', 'country@name@Taiwan'),
	1924
),
(
	get_id('@', 'conf@name@Tanzania Football Federation'),
	get_id('@', 'country@name@Tanzania'),
	1930
),
(
	get_id('@', 'conf@name@Federation of Uganda Football Associations'),
	get_id('@', 'country@name@Uganda'),
	1924
),
(
	get_id('@', 'conf@name@Ukrainian Association of Football'),
	get_id('@', 'country@name@Ukraine'),
	1991
),
(
	get_id('@', 'conf@name@Asociación Uruguaya de Fútbol'),
	get_id('@', 'country@name@Uruguay'),
	1900
),
(
	get_id('@', 'conf@name@United States Soccer Federation'),
	get_id('@', 'country@name@United States'),
	1913
),
(
	get_id('@', 'conf@name@Uzbekistan Football Association'),
	get_id('@', 'country@name@Uzbekistan'),
	1946
),
(
	get_id('@', 'conf@name@Saint Vincent and the Grenadines Football Federation'),
	get_id('@', 'country@name@Saint Vincent and the Grenadines'),
	1979
),
(
	get_id('@', 'conf@name@Federación Venezolana de Fútbol'),
	get_id('@', 'country@name@Venezuela'),
	1926
),
(
	get_id('@', 'conf@name@Vietnam Football Federation'),
	get_id('@', 'country@name@Vietnam'),
	1962
),
(
	get_id('@', 'conf@name@Vanuatu Football Federation'),
	get_id('@', 'country@name@Vanuatu'),
	1934
),
(
	get_id('@', 'conf@name@Football Association of Wales'),
	get_id('@', 'country@name@Wales'),
	1876
),
(
	get_id('@', 'conf@name@Football Federation Samoa'),
	get_id('@', 'country@name@Samoa'),
	1968
),
(
	get_id('@', 'conf@name@Football Federation of Kosovo'),
	get_id('@', 'country@name@Kosovo'),
	1946
),
(
	get_id('@', 'conf@name@Yemen Football Association'),
	get_id('@', 'country@name@Yemen'),
	1962
),
(
	get_id('@', 'conf@name@South African Football Association'),
	get_id('@', 'country@name@South Africa'),
	1991
),
(
	get_id('@', 'conf@name@Football Association of Zambia'),
	get_id('@', 'country@name@Zambia'),
	1929
),
(
	get_id('@', 'conf@name@Zimbabwe Football Association'),
	get_id('@', 'country@name@Zimbabwe'),
	1965
);
--------------------------------------------------------------------------------

