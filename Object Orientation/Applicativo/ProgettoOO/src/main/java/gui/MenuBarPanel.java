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
	protected JMenuItem generalResearchCountryMenuItem;
	protected JMenu confederationMenu;
	protected JMenuItem generalResearchConfederationMenuItem;
	protected JMenu competitionMenu;
	protected JMenuItem generalResearchCompetitionMenuItem;
	protected JMenu teamMenu;
	protected JMenuItem generalResearchTeamMenuItem;
	protected JMenu playerMenu;
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
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchCountryMenuItem = new JMenuItem(string);

		generalResearchCountryMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				SearchCountryPanel searchCountryPanel = new SearchCountryPanel();

				MainFrame.getMainFrameInstance().add(searchCountryPanel);
			}
		});

		countryMenu.getPopupMenu().add(generalResearchCountryMenuItem);

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
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchConfederationMenuItem = new JMenuItem(string);

		generalResearchConfederationMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				SearchConfederationPanel searchConfederationPanel = new SearchConfederationPanel();

				MainFrame.getMainFrameInstance().add(searchConfederationPanel);
			}
		});

		confederationMenu.getPopupMenu().add(generalResearchConfederationMenuItem);

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
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchCompetitionMenuItem = new JMenuItem(string);

		generalResearchCompetitionMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				SearchCompetitionPanel searchCompetitionPanel = new SearchCompetitionPanel();

				MainFrame.getMainFrameInstance().add(searchCompetitionPanel);
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
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchTeamMenuItem = new JMenuItem(string);

		generalResearchTeamMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				SearchTeamPanel searchTeamPanel = new SearchTeamPanel();

				MainFrame.getMainFrameInstance().add(searchTeamPanel);
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
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		generalResearchPlayerMenuItem = new JMenuItem(string);

		generalResearchPlayerMenuItem.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				SearchPlayerPanel searchPlayerPanel = new SearchPlayerPanel();

				MainFrame.getMainFrameInstance().add(searchPlayerPanel);
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
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				//MilitancyFilterPanel militancyFilterPanel = new MilitancyFilterPanel();

				//MainFrame.getMainFrameInstance().add(militancyFilterPanel);
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
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				CompetitionEditionFilterPanel competitionEditionFilterPanel = new CompetitionEditionFilterPanel();

				MainFrame.getMainFrameInstance().add(competitionEditionFilterPanel);
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
			public void actionPerformed(ActionEvent e)
			{
				Component component = MainFrame.getMainFrameInstance().getContentPane().getComponent(2);

				component.setVisible(false);

				MainFrame.getMainFrameInstance().remove(component);

				StepFilterPanel stepFilterPanel = new StepFilterPanel();

				MainFrame.getMainFrameInstance().add(stepFilterPanel);
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