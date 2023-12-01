package model;

import java.time.LocalDate;

public class TrofeoCalciatore
{
	public Calciatore calciatore;
	public Trofeo trofeo;
	public LocalDate dataAssegnazione;

	public TrofeoCalciatore(Calciatore calciatore, Trofeo trofeo, LocalDate dataAssegnazione)
	{
		this.calciatore = calciatore;
		this.trofeo = trofeo;
		this.dataAssegnazione = dataAssegnazione;
	}

	@Override
	public String toString() {
		String toPrint = "\nTROFEO CALCIATORE";
		toPrint += "\n\tCalciatore:" + calciatore.nome + " " + calciatore.cognome;
		toPrint += "\n\tTrofeo: " + trofeo.nome;
		toPrint += "\n\tData assegnazione: " + dataAssegnazione;

		return toPrint;
	}
}
