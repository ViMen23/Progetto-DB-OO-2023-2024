package model;

import java.time.LocalDate;
import java.util.ArrayList;

public class TrofeoSquadra
{
	public Squadra squadra;
	public Trofeo trofeo;
	public LocalDate dataAssegnazione;

	public TrofeoSquadra(Squadra squadra, Trofeo trofeo, LocalDate dataAssegnazione)
	{
		this.squadra = squadra;
		this.trofeo = trofeo;
		this.dataAssegnazione = dataAssegnazione;
	}

	@Override
	public String toString() {
		String toPrint = "\nTROFEO SQUADRA";
		toPrint += "\n\tSquadra: " + squadra.nome;
		toPrint += "\n\tTrofeo: " + trofeo.nome;
		toPrint += "\n\tData assegnazione: " + dataAssegnazione;

		return toPrint;
	}
}
