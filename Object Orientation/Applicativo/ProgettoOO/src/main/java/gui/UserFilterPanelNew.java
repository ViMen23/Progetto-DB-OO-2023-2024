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
 * NAME : UserFilterPanel
 *
 * DESC: TODO
 */

public class UserFilterPanelNew
				extends  JPanel
  				implements ActionListener, CaretListener, ItemListener
{
	protected JButton button;


	final static float outputFontSize = 22;
	final static float inputFontSize = 20;

	public static Timer timer;


	public UserFilterPanelNew(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		timer = new Timer(250, this);


		// configurazione bottone home
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);
		gbc.anchor = GridBagConstraints.FIRST_LINE_START;

		button = new JButton(Main.createImageIcon("images/home.png", 50, 50));

		add(button, gbc);


		// configurazione label paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		button = new JButton(currentLocale.getString("country"), Main.createImageIcon("images/country.png", 50, 50));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione label paese
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		button = new JButton(currentLocale.getString("confederation"), Main.createImageIcon("images/competition.png", 50, 50));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione label competizione
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		button = new JButton(currentLocale.getString("competition"), Main.createImageIcon("images/competition.png", 50, 50));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione label squadra
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,50);

		button = new JButton(currentLocale.getString("team"), Main.createImageIcon("images/team.png", 50, 50));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione label calciatore
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 5;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton(currentLocale.getString("player"), Main.createImageIcon("images/player.png", 50, 50));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone ricerca
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 6;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);
		gbc.anchor = GridBagConstraints.FIRST_LINE_END;

		button = new JButton(Main.createImageIcon("images/search.png", 50, 50));
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone contatore paesi
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton("0");
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone contatore confederazioni
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton("0");
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone contatore competizioni
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 3;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton("0");
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone contatore squadre
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 4;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton("0");
		button.setFont(outputFont);

		add(button, gbc);

		// configurazione bottone contatore calciatori
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 5;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(0,0,0,0);

		button = new JButton("0");
		button.setFont(outputFont);

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
