package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class ViewCompetitionFrame
				extends JPanel
{
	protected JPanel top;
	protected JPanel menuBar;
	protected JPanel informationPanel;
	protected JPanel seasonPanel;
	protected JPanel teamPanel;
	protected JPanel playerPanel;
	protected JPanel partecipationPanel;

	protected JButton showButton;


	public ViewCompetitionFrame()
	{
		String string;
		String title;
		String tableName;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug",
				"0[fill]0",
				"0[]0[]15[]15[]15[]15[]10"
			);

		setLayout(migLayout);


		informationPanel = new InformationCompetitionPanel();

		add(informationPanel, "wrap");

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo panello stagione:  panel
		 */
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();


		seasonPanel = new ChoosePanel(string);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo azione mostra:  bottone
		 */

		string = GuiConfiguration.getMessage("show");
		string = string.toUpperCase();

		showButton = new JButton(string);

		seasonPanel.add(showButton);

		add(seasonPanel, "wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo panello squadre:  panel
		 */

		title = GuiConfiguration.getMessage("teamTrophies");
		title += " ";
		title += "Serie A 2022-2023";
		title = title.toUpperCase();

		tableName = "teamTrophy";


		teamPanel = new SampleTable(title, tableName);

		add(teamPanel, "split 2");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo panello calciatori:  panel
		 */

		title = GuiConfiguration.getMessage("playerTrophies");
		title += " ";
		title += "Serie A 2022-2023";
		title = title.toUpperCase();

		tableName = "playerTrophy";


		playerPanel = new SampleTable(title, tableName);

		add(playerPanel, "wrap");
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo panello partecipazioni:  panel
		 */

		title = GuiConfiguration.getMessage("teams");
		title += " ";
		title += GuiConfiguration.getMessage("participants");
		title += " ";
		title += "Serie A 2022-2023";
		title = title.toUpperCase();

		tableName = "partecipant";

		partecipationPanel = new SampleTable(title, tableName);

		add(playerPanel, "wrap");
		/*------------------------------------------------------------------------------------------------------*/

	}
}
