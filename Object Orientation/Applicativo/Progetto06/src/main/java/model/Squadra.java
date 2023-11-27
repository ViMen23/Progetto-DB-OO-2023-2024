package model;

import java.util.ArrayList;

public class Squadra {
	private String nome;
	private Paese paese;
	private char tipologia; //n per nazionale, c per club
	private ArrayList<Competizione> competizioniSquadra = new ArrayList<>();
	private ArrayList<Trofeo> trofeiSquadra = new ArrayList<>();
	private ArrayList<Militanza> militanzaSquadra = new ArrayList<>();
	private Squadra (String nome, char tipologia,
									 Paese paese)
	{
		this.nome = nome;
		this.tipologia = tipologia;
		this.paese = paese;

		Statico.listaSquadre.add(this);
	}

	public ArrayList<Militanza> getMilitanzaSquadra() { return militanzaSquadra; }

	public char getTipologia() {
		return tipologia;
	}

	public String getNome() {
		return nome;
	}

	public Paese getPaese() {
		return paese;
	}

	public ArrayList<Competizione> getCompetizioniSquadra() {
		return competizioniSquadra;
	}
	public ArrayList<Trofeo> getTrofeiSquadra() {
		return trofeiSquadra;
	}

	public void setTipologia(char tipologia) { this.tipologia = tipologia; }

	public void setNome(String nome) { this.nome = nome; }

	public void setPaese(Paese paese) { this.paese = paese; }

	public void setCompetizioniSquadra(ArrayList<Competizione> competizioniSquadra) { this.competizioniSquadra = competizioniSquadra; }

	public void setTrofeiSquadra(ArrayList<Trofeo> trofeiSquadra) { this.trofeiSquadra = trofeiSquadra; }

	public void addMilitanza(Militanza militanza){ getMilitanzaSquadra().add(militanza); }
	@Override
	public String toString()
	{
		String toPrint = "\nSquadra:";
		toPrint += "\nNome: " + getNome();
		toPrint += "\nNazione: " + getPaese().getNazione();
		toPrint += "\nTipologia: " + getTipologia();
		return toPrint;
	}
}

