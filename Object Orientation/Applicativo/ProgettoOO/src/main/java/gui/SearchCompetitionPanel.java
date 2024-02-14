package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;


public class SearchCompetitionPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JPanel panel;
	protected JButton button;
	final static float outputFontSize = 18;

	public SearchCompetitionPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		Font outputFont = this.getFont().deriveFont(outputFontSize);

		GridBagConstraints gbc;

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(0,0,20,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		button = new JButton
						(
										(
														currentLocale.getString("search") +
																		" " +
																		currentLocale.getString("competitions")
										).toUpperCase()
						);

		button.setFont(outputFont);
		button.setEnabled(false);
		button.setForeground(Color.WHITE);


		add(button,gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new SearchCompetitionNamePanel(controller, currentLocale);

		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(10, 10, 10, 10),
																		new MatteBorder(10, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new SearchCompetitionTypePanel(controller, currentLocale);


		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(10, 10, 10, 10),
																		new MatteBorder(10, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new SearchTeamTypePanel(controller, currentLocale);


		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(10, 10, 10, 10),
																		new MatteBorder(10, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new SearchCountryConfederationPanel(controller, currentLocale);


		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(10, 10, 10, 10),
																		new MatteBorder(10, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 5;
		gbc.insets = new Insets(0,0,20,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		button = new JButton(currentLocale.getString("search").toUpperCase());
		button.setFont(outputFont);

		add(button, gbc);

	}

	@Override
	public void actionPerformed(ActionEvent e) {

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}


}
