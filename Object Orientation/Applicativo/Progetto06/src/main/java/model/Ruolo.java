package model;

public class Ruolo
{
	private char codiceRuolo;
	private String descrizione;

	private Ruolo( char codiceRuolo, String descrizione)
	{
		this.codiceRuolo = codiceRuolo;
		this.descrizione = descrizione;

		Statico.listaRuoli.add(this);
	}

	public char getCodiceRuolo() { return codiceRuolo; }

	public String getDescrizione() { return descrizione; }
	public void setDescrizione(String descrizione) { this.descrizione = descrizione; }
	public void setCodiceRuolo(char codiceRuolo) { this.codiceRuolo = codiceRuolo; }

	@Override
	public String toString(){
		String toPrint = "\nRuolo: ";
		toPrint += "\nCodice Ruolo: " + getCodiceRuolo();
		toPrint += "\nDescrizione: " + getDescrizione();
		return toPrint;
	}
}
