package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MenuBarPanel
				extends  JPanel
{
	protected JButton homeButton;
	protected JMenuBar menuBar;
	protected JMenu countryMenu;
	protected JMenuItem showAllCountryMenuItem;
	protected JMenu confederationMenu;
	protected JMenuItem showAllConfederationMenuItem;
	protected JMenu competitionMenu;
	protected JMenuItem showAllCompetitionMenuItem;
	protected JMenuItem generalResearchCompetitionMenuItem;
	protected JMenu teamMenu;
	protected JMenuItem showAllTeamMenuItem;
	protected JMenuItem generalResearchTeamMenuItem;
	protected JMenu playerMenu;
	protected JMenuItem showAllPlayerMenuItem;
	protected JMenuItem generalResearchPlayerMenuItem;
	protected JMenuItem militancyResearchPlayerMenuItem;
	protected JMenu statisticMenu;
	protected JMenuItem showTotalStatisticMenuItem;
	protected JMenuItem showCompetitionEditionStatisticMenuItem;
	protected JButton filterButton;
	protected JButton diceButton;



	public MenuBarPanel()
	{
		String string;
		ImageIcon imageIcon;
		MigLayout migLayout;

		migLayout = new MigLayout
						(
										"debug",
										"30[]50:push[]50:push[]30[]30",
										""
						);

		setLayout(migLayout);
		setBackground(Color.white);


		/*
		 * TODO
		 */
		imageIcon = GuiConfiguration.createImageIcon("images/homy.png");

		homeButton = new JButton(imageIcon);

		homeButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				GuiConfiguration.resetHomeFrame();
			}
		});

		add(homeButton);


		/*
		 * TODO
		 */
		menuBar = new JMenuBar();

		migLayout = new MigLayout
						(
										"debug",
										"50[]50[]50[]50[]50[]50[]50",
										""
						);

		menuBar.setLayout(migLayout);

		add(menuBar);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("countries");
		string = string.toUpperCase();

		countryMenu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[]"
						);

		countryMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(countryMenu);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		showAllCountryMenuItem = new JMenuItem(string);

		showAllCountryMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if
					(component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				SearchCountryPanel searchCountryPanel = new SearchCountryPanel();
				searchCountryPanel.setName("viewAllCountry");

				MainFrame.getMainFrameInstance().add(searchCountryPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		countryMenu.getPopupMenu().add(showAllCountryMenuItem);

		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("confederations");
		string = string.toUpperCase();

		confederationMenu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[]"
						);

		confederationMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(confederationMenu);

		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		showAllConfederationMenuItem = new JMenuItem(string);

		showAllConfederationMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if
					(component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				ViewAllConfederation viewAllConfederation = new ViewAllConfederation();
				viewAllConfederation.setName("viewAllConfederation");

				MainFrame.getMainFrameInstance().add(viewAllConfederation);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		confederationMenu.getPopupMenu().add(showAllConfederationMenuItem);

		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("competitions");
		string = string.toUpperCase();

		competitionMenu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		competitionMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(competitionMenu);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		showAllCompetitionMenuItem = new JMenuItem(string);

		competitionMenu.getPopupMenu().add(showAllCompetitionMenuItem);

		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchCompetitionMenuItem = new JMenuItem(string);

		generalResearchCompetitionMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if
					(component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				SearchCompetitionPanel searchCompetitionPanel = new SearchCompetitionPanel();
				searchCompetitionPanel.setName("searchCompetitionPanel");

				MainFrame.getMainFrameInstance().add(searchCompetitionPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		competitionMenu.getPopupMenu().add(generalResearchCompetitionMenuItem);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("teams");
		string = string.toUpperCase();

		teamMenu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		teamMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(teamMenu);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		showAllTeamMenuItem = new JMenuItem(string);

		teamMenu.getPopupMenu().add(showAllTeamMenuItem);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchTeamMenuItem = new JMenuItem(string);

		generalResearchTeamMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if
					(component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				SearchTeamPanel searchTeamPanel = new SearchTeamPanel();
				searchTeamPanel.setName("searchTeamPanel");

				MainFrame.getMainFrameInstance().add(searchTeamPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		teamMenu.getPopupMenu().add(generalResearchTeamMenuItem);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("players");
		string = string.toUpperCase();

		playerMenu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][][]"
						);

		playerMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(playerMenu);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		showAllPlayerMenuItem = new JMenuItem(string);

		playerMenu.getPopupMenu().add(showAllPlayerMenuItem);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchPlayerMenuItem = new JMenuItem(string);

		generalResearchPlayerMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if (component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				SearchPlayerPanel searchPlayerPanel = new SearchPlayerPanel();
				searchPlayerPanel.setName("searchPlayerPanel");

				MainFrame.getMainFrameInstance().add(searchPlayerPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		playerMenu.getPopupMenu().add(generalResearchPlayerMenuItem);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("militancyResearch");
		string = string.toUpperCase();

		militancyResearchPlayerMenuItem = new JMenuItem(string);

		militancyResearchPlayerMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if (component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				MilitancyFilterPanel militancyFilterPanel = new MilitancyFilterPanel();
				militancyFilterPanel.setName("militancyFilterPanel");

				MainFrame.getMainFrameInstance().add(militancyFilterPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		playerMenu.getPopupMenu().add(militancyResearchPlayerMenuItem);


		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("statistics");
		string = string.toUpperCase();

		statisticMenu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		statisticMenu.getPopupMenu().setLayout(migLayout);

		menuBar.add(statisticMenu);

		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("totalStatistics");
		string = string.toUpperCase();

		showTotalStatisticMenuItem = new JMenuItem(string);

		statisticMenu.getPopupMenu().add(showTotalStatisticMenuItem);

		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("competitionEditionStatistics");
		string = string.toUpperCase();

		showCompetitionEditionStatisticMenuItem = new JMenuItem(string);

		showCompetitionEditionStatisticMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if (component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				CompetitionEditionFilterPanel competitionEditionFilterPanel = new CompetitionEditionFilterPanel();
				competitionEditionFilterPanel.setName("competitionEditionFilterPanel");

				MainFrame.getMainFrameInstance().add(competitionEditionFilterPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		statisticMenu.getPopupMenu().add(showCompetitionEditionStatisticMenuItem);


		/*
		 * TODO
		 */
		imageIcon = GuiConfiguration.createImageIcon("images/filter.png");

		filterButton = new JButton(imageIcon);

		filterButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
					if (component.getName().equalsIgnoreCase("topPanel") || component.getName().equalsIgnoreCase("menuBarPanel")) {
						continue;
					}

					MainFrame.getMainFrameInstance().remove(component);
				}

				StepFilterPanel stepFilterPanel = new StepFilterPanel();
				stepFilterPanel.setName("stepFilterPanel");

				MainFrame.getMainFrameInstance().add(stepFilterPanel);
				MainFrame.getMainFrameInstance().pack();
			}
		});

		add(filterButton);


		/*
		 * TODO
		 */
		imageIcon = GuiConfiguration.createImageIcon("images/dice.png");

		diceButton = new JButton(imageIcon);

		add(diceButton);

	}
}