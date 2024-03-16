package dao;

/**
 * Interfaccia che definisce i metodi per l'accesso ai dati relativi agli amministratori.
 */
public interface AdminDAO
{
	/**
	 * Verifica se un utente è un amministratore nel database.
	 * <p>
	 * @param username Il nome utente da verificare.
	 * @param password La password dell'utente.
	 * @return True se l'utente è un amministratore, false altrimenti.
	 */
	boolean isAdminDB(String username,
										String password);
}
