package model;

public class Paese {
	private String codice;
	private String nazione;
	private String continente;

	// costruttore nazione

	private Paese(String codice, String nazione, String continente ){
		this.codice = codice;
		this.nazione = nazione;
		this.continente = continente;

		// add to lista nazione
		Statico.listaPaesi.add(this);
	}

	public String getCodice() {
		return codice;
	}

	public String getContinente() { return continente; }

	public String getNazione() { return nazione;	}

	public void setCodice(String codice) { this.codice = codice;	}

	public void setContinente(String continente) { this.continente = continente; }

	public void setNazione(String nazione) { this.nazione = nazione; }

	@Override
	public String toString(){
		return String.format("%nNazione:" +
													"%nCodice Paese: " + getCodice() +
													"%nPaese: " + getNazione() +
													"%nContinente: " + getContinente()
		);
	}

}
