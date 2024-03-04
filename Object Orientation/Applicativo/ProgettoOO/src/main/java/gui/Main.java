package gui;

import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;

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


		//SearchPlayerPanel searchPlayerPanel = new SearchPlayerPanel();

		//searchPlayerPanel.setName("searchPlayerPanel");

		//searchCountryPanel.setName("boh");

		//MainFrame.getMainFrameInstance().add(new ViewPlayerPanel("3"), "sgx frame, growy");

		MainFrame.getMainFrameInstance().add(new SearchPlayerPanel(), "sgx frame, growy");

		MainFrame.getMainFrameInstance().setMinimumSize(new Dimension(1600, 100));

		MainFrame.getMainFrameInstance().pack();


		//Controller.getInstance().subConfederations("Confederation of North and Central America and Caribbean Association Football");

		//Controller.getInstance().subCountries(2);
		//Controller.getInstance().searchCompetitions("jik", null, null, null);

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
