package gui;

import controller.Controller;
import model.Country;

import javax.swing.*;

/**
 * TYPE : class - gui package
 * NAME : Main
 *
 * DESC: TODO
 */
public class Main
{
	private static void createAndShowGUI()
	{
		GuiConfiguration.initGuiConfiguration();


		SearchCountryPanel searchCountryPanel = new SearchCountryPanel();

		//searchPlayerPanel.setName("searchPlayerPanel");

		searchCountryPanel.setName("boh");

		MainFrame.getMainFrameInstance().add(searchCountryPanel);
		MainFrame.getMainFrameInstance().pack();

		//Controller.getControllerInstance().subConfederations("Confederation of North and Central America and Caribbean Association Football");

		//Controller.getControllerInstance().subCountries("Asia");
		//Controller.getControllerInstance().searchCompetitions("jik", null, null, null);

		//ResultSearchPanel resultSearchPanel = new ResultSearchPanel("ciao", 15);
		//MainFrame.getMainFrameInstance().add(resultSearchPanel);

		//MainFrame.getMainFrameInstance().pack();
	}
	
	public static void main(String[] args)
	{
		// Pianifica un lavoro per la creazione e la visualizzazione della GUI di questa applicazione.
		SwingUtilities.invokeLater(new Runnable() {
				public void run()
				{
					createAndShowGUI();
				}
		});
	}

}
