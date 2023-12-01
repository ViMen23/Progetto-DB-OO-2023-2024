package model;

public class Feature
{
	public String nome;

	public Feature(String nome)
	{
		this.nome = nome;
	}

	public void aggiungiFeature(Calciatore calciatore)
	{
		calciatore.listaFeature.add(this);
	}

	@Override
	public String toString()
	{
		String toPrint = "\nFEATURE";
		toPrint += "\n\tNome: " + nome;

		return toPrint;
	}
}
