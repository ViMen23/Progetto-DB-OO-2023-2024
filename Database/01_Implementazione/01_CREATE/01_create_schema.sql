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
 * SCHEMA                                                                     
 ******************************************************************************/


/******************************************************************************* 
 * TYPE : SCHEMA
 * NAME : public
 *
 * DESC : Lo schema per il database.
 *        È stato scelto di utilizzare lo schema public in quanto è
 *        il percorso di ricerca predefinito per ogni database in Postgresql,
 *        in modo da rendere il codice più leggibile                            
 ******************************************************************************/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
--------------------------------------------------------------------------------

/******************************************************************************* 
 * TYPE : EXTENSION
 * NAME : hstore
 *
 * DESC : Estensione necessaria per rendere più comoda l'implementazione
 *        di alcune funzioni e trigger.
 *
 *        NOTA: per maggiori informazioni consultare la documentazione ufficiale
 *              di Postgresql                      
 ******************************************************************************/
CREATE EXTENSION hstore;
--------------------------------------------------------------------------------
