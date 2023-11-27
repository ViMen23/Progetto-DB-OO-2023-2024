package model;

import com.sun.source.tree.UsesTree;

import java.time.LocalDate;
import java.util.ArrayList;

public class Calciatore
{
	private String nome;
	private String cognome;
	private LocalDate dataDiNascita;
	private LocalDate dataInizio;
	private LocalDate dataRitiro;
	private char piedePreferito; // A sta per ambidestro, D per destro, S per sinistro
	private ArrayList<Militanza> militanzaCalciatore = new ArrayList<>();
	private ArrayList<Ruolo> ruoliCalciatore = new ArrayList<>();

	// nel metodo che chiamera il costruttore devo mettere un ruolo
	private Calciatore( String nome, String cognome,
											LocalDate dataDiNascita,
											LocalDate dataInizio,
											LocalDate dataRitiro,
											char piedePreferito
											)
	{
		this.nome = nome;
		this.cognome = cognome;
		this.dataDiNascita = dataDiNascita;
		this.dataInizio = dataInizio;
		this.dataRitiro = dataRitiro;
		this.piedePreferito = piedePreferito;

		Statico.listaCalciatori.add( this );
	}

	public String getNome() { return nome; }

	public char getPiedePreferito() { return piedePreferito; }

	public LocalDate getDataDiNascita() { return dataDiNascita; }

	public LocalDate getDataInizio() { return dataInizio; }

	public LocalDate getDataRitiro() { return dataRitiro; }

	public String getCognome() { return cognome; }

	public ArrayList<Militanza> getMilitanzaCalciatore() { return militanzaCalciatore; }

	public void setNome(String nome) { this.nome = nome; }

	public void setCognome(String cognome) { this.cognome = cognome; }

	public void setDataDiNascita(LocalDate dataDiNascita) { this.dataDiNascita = dataDiNascita; }

	public void setDataInizio(LocalDate dataInizio) { this.dataInizio = dataInizio; }

	public void setDataRitiro(LocalDate dataRitiro) { this.dataRitiro = dataRitiro; }

	public void setPiedePreferito(char piedePreferito) { this.piedePreferito = piedePreferito; }
	public void addMilitanza(Militanza militanza){ getMilitanzaCalciatore().add(militanza); }

	@Override
	public String toString(){
		String toPrint = "\nCalciatore";
		toPrint += "\nNome: " + getNome();
		toPrint += "\nCognome: " + getCognome();
		toPrint += "\nData di Nascita: " + getDataDiNascita();
		toPrint += "\nData Inizio: " + getDataInizio();
		toPrint += "\nData Ritiro: " + getDataRitiro();
		toPrint += "\nPiede Preferito: " + getPiedePreferito();
		return toPrint;
	}
}
