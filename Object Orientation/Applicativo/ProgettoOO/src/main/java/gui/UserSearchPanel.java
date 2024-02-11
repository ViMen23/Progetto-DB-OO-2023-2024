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


	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final static int inputColumn = 25;

	public UserSearchPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		// configurazione bottone logo
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		homeButton = new JButton("Home");
		homeButton.setFont(outputFont);

		add(homeButton, gbc);


		// configurazione bottone ricerca giocatore
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		playerRadioButton = new JRadioButton(currentLocale.getString("player"));
		playerRadioButton.setFont(outputFont);

		add(playerRadioButton, gbc);

		// configurazione bottone ricerca squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

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
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 20;
		gbc.ipady = 20;
		gbc.insets = new Insets(0,0,0,0);

		searchField = new JTextField(inputColumn);
		searchField.setFont(inputFont);

		add(searchField, gbc);

	}

	@Override
	public void actionPerformed(ActionEvent e)
	{

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
