package model;

import java.time.LocalDate;
import java.util.ArrayList;

public class Calciatore
{
	public String nome;
	public String cognome;
	public LocalDate dataNascita;
	public Character piede;
	public LocalDate dataRitiro;
	public ArrayList<Ruolo> listaRuoli = new ArrayList<Ruolo>();
	public ArrayList<Feature> listaFeature = new ArrayList<Feature>();
	public ArrayList<TrofeoCalciatore> listaTrofei = new ArrayList<TrofeoCalciatore>();
	public ArrayList<Militanza> carriera = new ArrayList<Militanza>();

	public Calciatore(String nome, String cognome, LocalDate dataNascita,
										Ruolo ruolo, Character piede, LocalDate dataRitiro)
	{
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.piede = piede;
		this.dataRitiro = dataRitiro;
		ruolo.aggiungiRuolo(this);
	}


	@Override
	public String toString()
	{
		String toPrint = "\nCALCIATORE";
		toPrint += "\n\tNome: " + nome;
		toPrint += "\n\tCognome: " + cognome;
		toPrint += "\n\tData nascita: " + dataNascita;
		toPrint += "\n\tPiede: " + piede;
		toPrint += "\n\tData ritiro: " + dataRitiro;

		return toPrint;
	}

}
