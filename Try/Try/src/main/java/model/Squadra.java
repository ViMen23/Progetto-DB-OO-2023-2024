package model;

import java.time.LocalDate;
import java.util.ArrayList;

public class Squadra
{
	public String nome;
	public String nazionalita;
	public ArrayList<TrofeoSquadra> listaTrofei = new ArrayList<TrofeoSquadra>();

	public Squadra(String nome, String nazionalita)
	{
		this.nome = nome;
		this.nazionalita = nazionalita;
	}

	public void aggiungiMilitanza(Calciatore calciatore, LocalDate dataInizio, LocalDate dataFine)
	{
		calciatore.carriera.add(new Militanza(calciatore, this, dataInizio, dataFine));
	}

	@Override
	public String toString() {
		String toPrint = "\nSQUADRA";
		toPrint += "\n\tNome: " + nome;
		toPrint += "\n\tNazionalita: " + nazionalita;

		return toPrint;
	}
}
