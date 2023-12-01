package model;

import java.time.LocalDate;

public class Trofeo
{
	public String nome;
	public Boolean tipo;

	public Trofeo(String nome, Boolean tipo)
	{
		this.nome = nome;
		this.tipo = tipo;
	}

	public String printTipo()
	{
		if (this.tipo) {
			return "Individuale";
		}
		else {
			return "Di squadra";
		}
	}

	public void assegnaTrofeo(Calciatore calciatore, LocalDate dataAssegnazione)
	{
		calciatore.listaTrofei.add(new TrofeoCalciatore(calciatore, this, dataAssegnazione));
	}

	public void assegnaTrofeo(Squadra squadra, LocalDate dataAssegnazione)
	{
		squadra.listaTrofei.add(new TrofeoSquadra(squadra, this, dataAssegnazione));
	}

	@Override
	public String toString() {
		String toPrint = "\nTROFEO";
		toPrint += "\n\tNome: " + nome;
		toPrint += "\n\tTipo:" + printTipo();

		return toPrint;
	}
}
