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

/**
 * TYPE : class - gui package
 * NAME : UserSearchPanel
 *
 * DESC: TODO
 */

public class UserSearchPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JButton homeButton;
	protected JRadioButton playerRadioButton;
	protected JRadioButton teamRadioButton;
	protected ButtonGroup choiceRadioButton;
	protected JTextField searchField;
	protected JButton searchButton;
	protected JButton detailedSearchButton;

	protected JFrame frame;
	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final static int inputColumn = 25;

	final ImageIcon homeImageIcon = Main.createImageIcon("images/home.png", 40, 40);
	final ImageIcon searchImageIcon = Main.createImageIcon("images/search.png", 40, 40);

	public UserSearchPanel(Controller controller, ResourceBundle currentLocale, JFrame frame)
	{
		this.frame = frame;
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		// configurazione bottone home
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 2;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,30);

		homeButton = new JButton(homeImageIcon);

		add(homeButton, gbc);


		// configurazione bottone ricerca giocatore
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,30);

		playerRadioButton = new JRadioButton(currentLocale.getString("player"));
		playerRadioButton.setFont(outputFont);

		add(playerRadioButton, gbc);

		// configurazione bottone ricerca squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,30);
		gbc.anchor = GridBagConstraints.FIRST_LINE_START;

		teamRadioButton = new JRadioButton(currentLocale.getString("team"));
		teamRadioButton.setFont(outputFont);

		add(teamRadioButton, gbc);

		// creazione gruppo di bottoni di scelta di ricerca
		choiceRadioButton = new ButtonGroup();
		choiceRadioButton.add(playerRadioButton);
		choiceRadioButton.add(teamRadioButton);
		playerRadioButton.setSelected(true);

		// configurazione barra di ricerca
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 2;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,30);

		searchField = new JTextField(inputColumn);
		searchField.setFont(inputFont);

		add(searchField, gbc);

		//configurazione bottone ricerca
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 2;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,30);

		searchButton = new JButton(searchImageIcon);


		add(searchButton, gbc);


		//configurazione bottone ricerca dettagliata
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 2;
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		detailedSearchButton = new JButton(currentLocale.getString("advancedSearch"));
		detailedSearchButton.setFont(outputFont);
		detailedSearchButton.addActionListener(this);

		add(detailedSearchButton, gbc);

	}

	@Override
	public void actionPerformed(ActionEvent e)
	{

		setVisible(false);

		GridBagConstraints gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,10,0);

		frame.add(new UserAdvancedSearchPanel(Controller.getControllerInstance(), Main.currentLocale), gbc);


	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{

	}

	@Override
	public void caretUpdate(CaretEvent e)
	{

	}

}
