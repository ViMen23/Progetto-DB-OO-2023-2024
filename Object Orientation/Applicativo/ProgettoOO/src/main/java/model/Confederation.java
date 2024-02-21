//package model;
//
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * TYPE : class
// * NAME : Confederation
// *
// * DESC: Classe che rappresenta il concetto astratto di confederazione calcistica
// */
//public class Confederation
//{
//	private static List<Confederation> confederationList = new ArrayList<Confederation>();
//
//	private final String ID;
//	private final String shortName;
//	private final String longName;
//	private final Country country;
//	private final Confederation superConfederation;
//
//
//	public Confederation(String ID, String shortName, String longName,
//											 Country country, Confederation superConfederation)
//	{
//		this.ID = ID;
//		this.shortName = shortName;
//		this.longName = longName;
//		this.country = country;
//		this.superConfederation = superConfederation;
//
//		confederationList.add(this);
//	}
//
//
//	public String getID()
//	{
//		return ID;
//	}
//	public String getShortName()
//	{
//		return shortName;
//	}
//	public String getLongName()
//	{
//		return longName;
//	}
//	public Country getCountry()
//	{
//		return country;
//	}
//	public Confederation getSuperConfederation()
//	{
//		return superConfederation;
//	}
//
//	public static List<Confederation> getConfederationList()
//	{
//		return confederationList;
//	}
//
//}
