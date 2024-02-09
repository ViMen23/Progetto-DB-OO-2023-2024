package model;

/**
 * TYPE : enum
 * NAME : EnPrivilege
 *
 * DESC : Enum delle possibili tipologie di livello di privilegio di un utente
 */
public enum EnPrivilege
{
	GENERAL_USER,	// utente generico
	ADMIN,				// amministratore che non puo' creare altri amministratori
	SUPER_ADMIN		// amministratore che puo' creare altri amministratori
}
