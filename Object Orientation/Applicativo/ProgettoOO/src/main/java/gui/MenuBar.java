package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MenuBar
				extends  JPanel
{
	protected JButton button;
	protected JMenuBar menuBar;
	protected JMenu menu;
	protected JMenuItem menuItem;


	public MenuBar(Controller controller)
	{
		MigLayout migLayout;
		String string;
		ImageIcon imageIcon;

		migLayout = new MigLayout
						(
										"debug",
										"30[]50:push[]50:push[]30[]30",
										""
						);

		setLayout(migLayout);
		setBackground(Color.white);


		imageIcon = GuiConfiguration.createImageIcon("images/homy.png");

		button = new JButton(imageIcon);

		add(button);


		// configurazione barra menu
		menuBar = new JMenuBar();

		migLayout = new MigLayout
						(
										"debug",
										"50[]50[]50[]50[]50[]50[]50",
										""
						);

		menuBar.setLayout(migLayout);

		add(menuBar);


		// configurazione menu paese
		string = GuiConfiguration.getMessage("countries");
		string = string.toUpperCase();

		menu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[]"
						);

		menu.getPopupMenu().setLayout(migLayout);

		menuBar.add(menu);

		// configurazione sub menu generale
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione menu confederazione
		string = GuiConfiguration.getMessage("confederations");
		string = string.toUpperCase();

		menu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[]"
						);

		menu.getPopupMenu().setLayout(migLayout);

		menuBar.add(menu);

		// configurazione oggetto menu confederazione
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione menu competizione
		string = GuiConfiguration.getMessage("competitions");
		string = string.toUpperCase();

		menu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		menu.getPopupMenu().setLayout(migLayout);

		menuBar.add(menu);

		// configurazione oggetto menu competizione
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione oggetto menu competizione
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		menuBar.add(menu);

		// configurazione menu squadra
		string = GuiConfiguration.getMessage("teams");
		string = string.toUpperCase();

		menu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		menu.getPopupMenu().setLayout(migLayout);

		menuBar.add(menu);

		// configurazione oggetto menu squadra
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione oggetto menu squadra
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);




		// configurazione menu giocatore
		string = GuiConfiguration.getMessage("players");
		string = string.toUpperCase();

		menu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][][]"
						);

		menu.getPopupMenu().setLayout(migLayout);

		menuBar.add(menu);

		// configurazione oggetto menu calciatore
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione oggetto menu calciatore
		string = GuiConfiguration.getMessage("generalResearch");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione oggetto menu calciatore
		string = GuiConfiguration.getMessage("militancyResearch");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);


		// configurazione menu giocatore
		string = GuiConfiguration.getMessage("statistics");
		string = string.toUpperCase();

		menu = new JMenu(string);

		migLayout = new MigLayout
						(
										"debug, flowy",
										"",
										"[][]"
						);

		menu.getPopupMenu().setLayout(migLayout);

		menuBar.add(menu);

		// configurazione oggetto menu calciatore
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("totalStatistics");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// configurazione oggetto menu calciatore
		string = GuiConfiguration.getMessage("show");
		string += " ";
		string += GuiConfiguration.getMessage("competitionEditionStatistics");
		string = string.toUpperCase();

		menuItem = new JMenuItem(string);

		menu.getPopupMenu().add(menuItem);

		// bottone filtro
		imageIcon = GuiConfiguration.createImageIcon("images/filter.png");
		button = new JButton(imageIcon);

		add(button);

		// bottone dado
		imageIcon = GuiConfiguration.createImageIcon("images/dice.png");
		button = new JButton(imageIcon);

		add(button);

	}
}