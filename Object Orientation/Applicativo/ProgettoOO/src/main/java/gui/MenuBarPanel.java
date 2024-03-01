package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MenuBarPanel
				extends  JPanel
{
	private final ImageIcon homeIcon = GuiConfiguration.createImageIcon("images/homy.png");
	private final ImageIcon filterIcon = GuiConfiguration.createImageIcon("images/filter.png");
	private final ImageIcon diceIcon = GuiConfiguration.createImageIcon("images/dice.png");

	private final JButton homeButton;
	private final JMenuBar menuBar;
	private final JMenu countryMenu;
	private final JMenuItem generalResearchCountryMenuItem;
	private final JMenu confederationMenu;
	private final JMenuItem generalResearchConfederationMenuItem;
	private final JMenu competitionMenu;
	private final JMenuItem generalResearchCompetitionMenuItem;
	private final JMenu teamMenu;
	private final JMenuItem generalResearchTeamMenuItem;
	private final JMenu playerMenu;
	private final JMenuItem generalResearchPlayerMenuItem;
	private final JMenuItem militancyResearchPlayerMenuItem;
	private final JMenu statisticMenu;
	private final JMenuItem researchTotalStatisticMenuItem;
	private final JMenuItem filterCompetitionEditionStatisticMenuItem;
	private final JButton filterButton;
	private final JButton diceButton;



	public MenuBarPanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
						(
										"debug",
										"2%[]5%[]5%[]3%[]2%",
										""
						);

		setLayout(migLayout);
		setBackground(Color.white);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON HOMEPAGE
		 *------------------------------------------------------------------------------------------------------*/



		homeButton = new JButton(homeIcon);
		homeButton.setCursor(GuiConfiguration.getButtonCursor());


		add(homeButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON HOMEPAGE
		 *------------------------------------------------------------------------------------------------------*/



		homeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				GuiConfiguration.resetHomeFrame();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUBAR
		 *------------------------------------------------------------------------------------------------------*/



		menuBar = new JMenuBar();

		migLayout = new MigLayout
						(
										"debug",
										"50[]50[]50[]50[]50[]50[]50",
										""
						);

		menuBar.setLayout(migLayout);

		add(menuBar);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENU PAESI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("countries");
		string = string.toUpperCase();

		countryMenu = new JMenu(string);
		countryMenu.setCursor(GuiConfiguration.getButtonCursor());

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[]"
						);

		countryMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(countryMenu);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchCountryMenuItem = new JMenuItem(string);

		countryMenu.getPopupMenu().add(generalResearchCountryMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		generalResearchCountryMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						new SearchCountryPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENU CONFEDERAZIONI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("confederations");
		string = string.toUpperCase();

		confederationMenu = new JMenu(string);
		confederationMenu.setCursor(GuiConfiguration.getButtonCursor());

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[]"
						);

		confederationMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(confederationMenu);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchConfederationMenuItem = new JMenuItem(string);

		confederationMenu.getPopupMenu().add(generalResearchConfederationMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		generalResearchConfederationMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						new SearchConfederationPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENU COMPETIZIONI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("competitions");
		string = string.toUpperCase();

		competitionMenu = new JMenu(string);
		competitionMenu.setCursor(GuiConfiguration.getButtonCursor());

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		competitionMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(competitionMenu);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchCompetitionMenuItem = new JMenuItem(string);

		competitionMenu.getPopupMenu().add(generalResearchCompetitionMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		generalResearchCompetitionMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						new SearchCompetitionPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENU SQUADRE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("teams");
		string = string.toUpperCase();

		teamMenu = new JMenu(string);
		teamMenu.setCursor(GuiConfiguration.getButtonCursor());

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		teamMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(teamMenu);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchTeamMenuItem = new JMenuItem(string);

		teamMenu.getPopupMenu().add(generalResearchTeamMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		generalResearchTeamMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						new SearchTeamPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENU CALCIATORI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("players");
		string = string.toUpperCase();

		playerMenu = new JMenu(string);
		playerMenu.setCursor(GuiConfiguration.getButtonCursor());

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][][]"
						);

		playerMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(playerMenu);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchPlayerMenuItem = new JMenuItem(string);

		playerMenu.getPopupMenu().add(generalResearchPlayerMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		generalResearchPlayerMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel(
									MainFrame.getMainFrameInstance().getContentPane(),
									new SearchPlayerPanel(),
									2,
									"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA PER MILITANZA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("militancyResearch");
		string = string.toUpperCase();

		militancyResearchPlayerMenuItem = new JMenuItem(string);

		playerMenu.getPopupMenu().add(militancyResearchPlayerMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		militancyResearchPlayerMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						null,
					//new MilitancyFilterPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENU STATISTICHE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("statistics");
		string = string.toUpperCase();

		statisticMenu = new JMenu(string);
		statisticMenu.setCursor(GuiConfiguration.getButtonCursor());

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		statisticMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(statisticMenu);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA STATISTICHE TOTALI
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("totalStatistics");
		string = string.toUpperCase();

		researchTotalStatisticMenuItem = new JMenuItem(string);

		statisticMenu.getPopupMenu().add(researchTotalStatisticMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		researchTotalStatisticMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						null,
									//new SearchTotalStatistics(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * MENUITEM RICERCA STATISTICHE PER EDIZIONE COMPETIZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("competitionEditionFilter");
		string = string.toUpperCase();

		filterCompetitionEditionStatisticMenuItem = new JMenuItem(string);

		statisticMenu.getPopupMenu().add(filterCompetitionEditionStatisticMenuItem);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterCompetitionEditionStatisticMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						null,
									//new CompetitionEditionFilterPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON FILTRO PER PASSI
		 *------------------------------------------------------------------------------------------------------*/



		filterButton = new JButton(filterIcon);
		filterButton.setCursor(GuiConfiguration.getButtonCursor());

		add(filterButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		filterButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				GuiConfiguration.switchPanel
					(
						MainFrame.getMainFrameInstance().getContentPane(),
						null,
						//new StepFilterPanel(),
						2,
						"sgx frame"
					);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON CALCIATORE CASUALE
		 *------------------------------------------------------------------------------------------------------*/

		diceButton = new JButton(diceIcon);
		diceButton.setCursor(GuiConfiguration.getButtonCursor());

		add(diceButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		diceButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
	}
}