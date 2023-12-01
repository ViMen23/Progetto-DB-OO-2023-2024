package model;

public class Ruolo
{
	public Character codice;
	public String descrizione;

	public Ruolo(Character codice, String descrizione)
	{
		this.codice = codice;
		this.descrizione = descrizione;
	}

	public void aggiungiRuolo(Calciatore calciatore)
	{
		calciatore.listaRuoli.add(this);
	}

	@Override
	public String toString() {
		String toPrint = "\nRUOLO";
		toPrint += "\n\tCodice: " + codice;
		toPrint += "\n\tDescrizione: " + descrizione;

		return toPrint;
	}
}
