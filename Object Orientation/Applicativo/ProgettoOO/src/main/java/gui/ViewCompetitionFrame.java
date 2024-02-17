package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;

public class ViewCompetitionFrame
				extends JFrame
{
	protected JPanel top;
	protected JPanel menuBar;
	protected JPanel panelInformation;
	protected JPanel panelSeason;
	protected JPanel panelTeam;
	protected JPanel panelPlayer;
	protected JPanel panelPartecipation;

	protected JButton button;


	public ViewCompetitionFrame(Controller controller) {

		super("Progetto");

		MigLayout migLayout;
		String string;
		String title;
		String tableName;

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		setResizable(true);
		setMinimumSize(new Dimension(500, 500));
		setMaximumSize(new Dimension(1500, 1000));


		migLayout = new MigLayout
			(
				"debug",
				"0[fill]0",
				"0[]0[]15[]15[]15[]15[]10"
			);


		setLayout(migLayout);


		top = new Top(controller);

		add(top, "wrap");

		menuBar = new MenuBar(controller);

		add(menuBar, "wrap");

		panelInformation = new InformationCompetitionPanel(controller);

		add(panelInformation, "wrap");

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo panello stagione:  panel
		 */
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();


		panelSeason = new ChoosePanel(controller, string);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo azione mostra:  bottone
		 */

		string = GuiConfiguration.getMessage("show");
		string = string.toUpperCase();

		button = new JButton(string);

		panelSeason.add(button);

		add(panelSeason, "wrap");
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


		panelTeam = new SampleTable(controller, title, tableName);

		add(panelTeam, "split 2");
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


		panelPlayer = new SampleTable(controller, title, tableName);

		add(panelPlayer, "wrap");
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

		panelPartecipation = new SampleTable(controller, title, tableName);

		add(panelPartecipation, "wrap");
		/*------------------------------------------------------------------------------------------------------*/

	}
}
