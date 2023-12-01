package model;

import java.time.LocalDate;

public class Militanza
{
	public Calciatore calciatore;
	public Squadra squadra;
	public LocalDate dataInizio;
	public LocalDate dataFine;
	public Integer presenze;
	public Integer goal;

	public Militanza(Calciatore calciatore, Squadra squadra, LocalDate dataInizio, LocalDate dataFine,
									 Integer presenze, Integer goal)
	{
		this.calciatore = calciatore;
		this.squadra = squadra;
		this.dataInizio = dataInizio;
		this.dataFine = dataFine;
		this.presenze = presenze;
		this.goal = goal;

		Character p = 'P';
		for (Ruolo ruolo : calciatore.listaRuoli) {
			if (ruolo.codice.compareTo(p) == 0) {
				new MilitanzaPortiere(this);
			}
		}
	}

	public Militanza(Calciatore calciatore, Squadra squadra, LocalDate dataInizio, LocalDate dataFine)
	{
		this(calciatore, squadra, dataInizio, dataFine, 0, 0);
	}

	@Override
	public String toString() {
		String toPrint = "\nMILITANZA";
		toPrint += "\n\tCalciatore: " + calciatore.nome + " " + calciatore.cognome;
		toPrint += "\n\tSquadra: " + squadra.nome;
		toPrint += "\n\tData inizio: " + dataInizio;
		toPrint += "\n\tData fine: " + dataFine;
		toPrint += "\n\tPresenze: " + presenze;
		toPrint += "\n\tGoal: " + goal;

		return toPrint;
	}
}
