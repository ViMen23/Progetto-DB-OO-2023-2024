package model;
import java.util.ArrayList;

public class Trofeo
{
	private String nome;
	private char tipologia; // I individuale e per S di squadra
	private Integer anno;

	private ArrayList<Competizione> competizioneTrofeo = new ArrayList<>();

	private Trofeo ( String nome,
									char tipologia, Integer anno, Competizione competizione)
	{
		this(nome, tipologia, anno);
		this.competizioneTrofeo.add(competizione);
	}
	private Trofeo ( String nome,
									 char tipologia, Integer anno)
	{
		this.nome = nome;
		this.tipologia = tipologia;
		this.anno = anno;

		Statico.listaTrofei.add(this);
	}

	// fare metodo che chiama il costruttore
	public char getTipologia() { return tipologia; }

	public String getNome() { return nome; }

	public ArrayList<Competizione> getCompetizioneTrofeo() { return competizioneTrofeo; }

	public Integer getAnno() { return anno; }

	public void setTipologia(char tipologia) { this.tipologia = tipologia; }

	public void setNome(String nome) { this.nome = nome; }

	public void setAnno(Integer anno) { this.anno = anno;	}

	public void setCompetizioneTrofeo(ArrayList<Competizione> competizioneTrofeo) { this.competizioneTrofeo = competizioneTrofeo; }


	@Override
	public String toString()
	{
		String toPrint = "\nTrofeo:" +
											"\nNome: " + getNome() +
											"\nTipologia: " + getTipologia() +
											"\nAnno: " + getAnno();
		return toPrint;
	}
}
