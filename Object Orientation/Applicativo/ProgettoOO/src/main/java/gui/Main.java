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

		JPanel panel = new TopPanel();
		panel.setVisible(true);

		JPanel menuPanel = new MenuBarPanel();
		menuPanel.setVisible(false);

		MainFrame.getMainFrameInstance().add(panel, "sgx frame");

		JPanel panel1 = new AdminNavigationPanel();

		panel1.setVisible(true);

		MainFrame.getMainFrameInstance().add(panel1, "sgx frame, gap top 20");



		MainFrame.getMainFrameInstance().setMinimumSize(new Dimension(1600, 100));

		MainFrame.getMainFrameInstance().setVisible(true);

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
