package model;

import java.time.LocalDate;

public class Militanza {
	private Squadra squadra;
	private Calciatore calciatore;
	private LocalDate dataInizio;
	private LocalDate dataFine;


	private Militanza (Squadra squadra, Calciatore calciatore,
										 LocalDate dataInizio, LocalDate dataFine)
	{
		this.squadra = squadra;
		this.calciatore = calciatore;
		this.dataInizio = dataInizio;
		this.dataFine = dataFine;

		// spostare queste due istruzioni altrove
		this.squadra.addMilitanza(this);
		this.calciatore.addMilitanza(this);
	}

	public LocalDate getDataInizio() { return dataInizio; }

	public Calciatore getCalciatore() { return calciatore; }

	public LocalDate getDataFine() { return dataFine; }

	public Squadra getSquadra() { return squadra; }

	public void setCalciatore(Calciatore calciatore) { this.calciatore = calciatore; }

	public void setDataFine(LocalDate dataFine) { this.dataFine = dataFine; }

	public void setSquadra(Squadra squadra) { this.squadra = squadra; }
	public void setDataInizio(LocalDate dataInizio) { this.dataInizio = dataInizio; }

	@Override
	public String toString()
	{
		String toPrint = "\nMilitanza";
		toPrint +="\nCalciatore: " + getCalciatore().getNome() + " " + getCalciatore().getCognome();
		toPrint +="\nSquadra: " + getSquadra().getNome();
		toPrint += "\nData Inizio: " + getDataInizio();
		toPrint += "\nData Fine: " + getDataFine();
		return toPrint;
	}
}
