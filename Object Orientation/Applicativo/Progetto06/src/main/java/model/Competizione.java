package model;

public class Competizione {
	private String nome;
	private char tipologia; // 'c' per club 'n' per nazionali
	private Paese paese;
	private Integer annoInizio;
	private Integer annoFine;
	public Integer maxNumPartite;
	public Integer numeroPartecipanti;

	//array list trofeo

	private Competizione(String nome, char tipologia,
											 Paese paese, Integer annoInizio,
											 Integer annoFine,
											 Integer maxNumPartite,
											 Integer numeroPartecipanti)
	{
		this.nome = nome;
		this.tipologia = tipologia;
		this.paese = paese;
		this.annoInizio = annoInizio;
		this.annoFine = annoFine;
		this.maxNumPartite = maxNumPartite;
		this.numeroPartecipanti = numeroPartecipanti;

		// inserisci competizioni alla lista
		Statico.listaCompetizioni.add( this );
	}

	public char getTipologia() { return tipologia; }

	public Paese getPaese() { return paese; }

	public Integer getAnnoFine() { return annoFine; }

	public Integer getAnnoInizio() { return annoInizio; }

	public Integer getMaxNumPartite() {	return maxNumPartite; }

	public Integer getNumeroPartecipanti() { return numeroPartecipanti; }

	public String getNome() {	return nome; }

	public void setAnnoFine(Integer annoFine) { this.annoFine = annoFine; }

	public void setAnnoInizio(Integer annoInizio) { this.annoInizio = annoInizio; }

	public void setMaxNumPartite(Integer maxNumPartite) { this.maxNumPartite = maxNumPartite; }

	public void setNome(String nome) { this.nome = nome; }

	public void setNumeroPartecipanti(Integer numeroPartecipanti) { this.numeroPartecipanti = numeroPartecipanti; }

	public void setPaese(Paese paese) { this.paese = paese; }

	public void setTipologia(char tipologia) { this.tipologia = tipologia; }

	// controlli per chiamare il costruttore


	@Override
	public String toString(){
		String toPrint = "\nCompetizione: " +
				"\nNome: " + getAnnoInizio() + "-" + getAnnoFine() +
				"\nPaese: " + getPaese().getNazione() +
				"\nTipologia: " + getTipologia() +
				"\nNumero Partecipanti: " + getNumeroPartecipanti() +
				"\nNumero Massimo Partite per Squadra: " + getMaxNumPartite();
		return toPrint;
	}

}
