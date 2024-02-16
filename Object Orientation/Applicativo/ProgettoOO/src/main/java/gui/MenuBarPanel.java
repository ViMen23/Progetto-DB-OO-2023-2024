/*
package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;
*/

/**
 * TYPE : class - gui package
 * NAME : UserFilterPanel
 *
 * DESC: TODO
 */
/*
public class MenuBarPanel
				extends  JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JButton button;
	protected JMenuBar menuBar;
	protected JMenu menu;
	protected JMenu subMenu;
	protected JMenuItem menuItem;

	final static float outputFontSize = 18;

	public static Timer timer;


	public MenuBarPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);

		timer = new Timer(250, this);

		// configurazione bottone home
		button = new JButton(Main.createImageIcon("images/homy.png", 30, 30));

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,30);
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.weightx = 1.0;

		add(button, gbc);



		// configurazione barra menu
		menuBar = new JMenuBar();
		menuBar.setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,30);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		add(menuBar, gbc);


		// configurazione menu paese
		menu = new JMenu
						(
										currentLocale.getString("countries").toUpperCase()
						);

		menu.setForeground(Color.WHITE);
		menu.getPopupMenu().setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,50,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);

		// configurazione sub menu generale
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("all")
										).toUpperCase()
						);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);



		// configurazione menu confederazione
		menu = new JMenu
						(
										currentLocale.getString("confederations").toUpperCase()
						);

		menu.setForeground(Color.WHITE);
		menu.getPopupMenu().setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);

		// configurazione oggetto menu confederazione
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("all")
										).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);


		// configurazione menu competizione
		menu = new JMenu
						(
										currentLocale.getString("competitions").toUpperCase()
						);

		menu.setForeground(Color.WHITE);
		menu.getPopupMenu().setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);

		// configurazione oggetto menu competizione
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("all")
										).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);


		// configurazione oggetto menu competizione
		menuItem = new JMenuItem
						(
										(currentLocale.getString("generalResearch")).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);


		// configurazione menu squadra
		menu = new JMenu
						(
										currentLocale.getString("teams").toUpperCase()
						);

		menu.setForeground(Color.WHITE);
		menu.getPopupMenu().setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);

		// configurazione oggetto menu squadra
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("all")
										).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);

		// configurazione oggetto menu squadra
		menuItem = new JMenuItem
						(
										currentLocale.getString("generalResearch").toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);


		// configurazione menu giocatore
		menu = new JMenu
						(
										currentLocale.getString("players").toUpperCase()
						);

		menu.setForeground(Color.WHITE);
		menu.getPopupMenu().setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);

		// configurazione oggetto menu calciatore
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("all")
										).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);

		// configurazione oggetto menu calciatore
		menuItem = new JMenuItem
						(
										currentLocale.getString("generalResearch").toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);

		// configurazione oggetto menu calciatore
		menuItem = new JMenuItem
						(
										currentLocale.getString("militancyResearch").toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;


		menu.getPopupMenu().add(menuItem, gbc);

		// configurazione menu giocatore
		menu = new JMenu
						(
										currentLocale.getString("statistics").toUpperCase()
						);

		menu.setForeground(Color.WHITE);
		menu.getPopupMenu().setLayout(new GridBagLayout());

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 5;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		menuBar.add(menu, gbc);

		// configurazione oggetto menu calciatore
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("totalStatistics")
										).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);

		// configurazione oggetto menu calciatore
		menuItem = new JMenuItem
						(
										(
														currentLocale.getString("show") +
																		" " +
																		currentLocale.getString("competitionEditionStatistics")
										).toUpperCase()
						);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_START;

		menu.getPopupMenu().add(menuItem, gbc);


		// bottone filtro
		button = new JButton(Main.createImageIcon("images/filter.png", 30, 30));

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,10);
		gbc.anchor = GridBagConstraints.LINE_END;
		gbc.weightx = 1.0;

		add(button, gbc);

		// bottone dado
		button = new JButton(Main.createImageIcon("images/dice.png", 30, 30));

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.LINE_END;
		gbc.weightx = 1.0;

		add(button, gbc);


	}


	@Override
	public void actionPerformed(ActionEvent e)
	{

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}
}
*/