package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

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


/**
 * TYPE : class - gui package
 * NAME : ChooseYearRangePanel
 *
 * DESC: Pannello per l'interfaccia di scelta di un intervallo di tempo
 *       compreso tra due anni
 */
public class CompetitionEditionFilterPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JPanel panel;
	protected JButton button;
	protected JCheckBox checkBox;
	protected JLabel label;

	protected String string;

	public CompetitionEditionFilterPanel(Controller controller)
	{
		setLayout(new GridBagLayout());
		
		GridBagConstraints gbc;
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Intestazione ricerca
		 */
		string = GuiConfiguration.getMessage("stepFilter");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setFont(GuiConfiguration.getOutputFont());
		button.setEnabled(false);

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										1.0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.HORIZONTAL, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		add(button,gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Intestazione ricerca per nome
		 */
		string = "1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string);
		label.setHorizontalTextPosition(SwingConstants.RIGHT);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 1,
										1, 1,
										1.0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.HORIZONTAL, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		panel = new JPanel(new GridBagLayout());
		panel.add(label, gbc);

		gbc = new GridBagConstraints
						(

										0, 1,
										1, 1,
										1.0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.HORIZONTAL, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		add(panel,gbc);
		/*------------------------------------------------------------------------------------------------------*/


		// TODO
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new SearchTeamTypePanel(controller);

		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(0, 10, 10, 10),
																		new MatteBorder(0, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);
		/*------------------------------------------------------------------------------------------------------*/


		// TODO
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(0,20,0,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.LINE_START;

		label = new JLabel
						(
										(
														"2. " +
																		GuiConfiguration.getMessage("choose") +
																		" " +
																		GuiConfiguration.getMessage("season")
										).toUpperCase()
						);

		label.setHorizontalTextPosition(SwingConstants.RIGHT);
		label.setFont(GuiConfiguration.getOutputFont());
		label.setForeground(Color.WHITE);

		panel = new JPanel(new GridBagLayout());
		panel.setBackground(new Color(50, 100, 200));
		panel.add(label, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.insets = new Insets(0,10,0,10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		add(panel,gbc);
		/*------------------------------------------------------------------------------------------------------*/


		// ricerca per eta
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new ChoosePanel
						(
										controller,
										StringUtils.capitalize(GuiConfiguration.getMessage("season"))
						);


		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(0, 10, 10, 10),
																		new MatteBorder(0, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);
		/*------------------------------------------------------------------------------------------------------*/


		// intestazione ricerca per nazione nascita
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(0,20,0,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.LINE_START;

		label = new JLabel
						(
										(
														"3. " +
																		GuiConfiguration.getMessage("choose") +
																		" " +
																		GuiConfiguration.getMessage("country") +
																		"/" +
																		GuiConfiguration.getMessage("confederation")
										).toUpperCase()
						);

		label.setHorizontalTextPosition(SwingConstants.RIGHT);
		label.setFont(GuiConfiguration.getOutputFont());
		label.setForeground(Color.WHITE);

		panel = new JPanel(new GridBagLayout());
		panel.setBackground(new Color(50, 100, 200));
		panel.add(label, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 5;
		gbc.insets = new Insets(0,10,0,10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		add(panel,gbc);

		// ricerca per nazione nascita
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 6;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new SearchCountryConfederationPanel(controller);


		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(0, 10, 10, 10),
																		new MatteBorder(0, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		// intestazione ricerca per ruolo
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(0,20,0,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.anchor = GridBagConstraints.LINE_START;

		label = new JLabel
						(
										(
														"4. " +
																		GuiConfiguration.getMessage("choose") +
																		" " +
																		GuiConfiguration.getMessage("competition")
										).toUpperCase()
						);

		label.setHorizontalTextPosition(SwingConstants.RIGHT);
		label.setFont(GuiConfiguration.getOutputFont());
		label.setForeground(Color.WHITE);

		panel = new JPanel(new GridBagLayout());
		panel.setBackground(new Color(50, 100, 200));
		panel.add(label, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 7;
		gbc.insets = new Insets(0,10,0,10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		add(panel,gbc);
		/*------------------------------------------------------------------------------------------------------*/

		// ricerca per ruolo
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 8;
		gbc.insets = new Insets(0,0,10,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		panel = new ChoosePanel
						(
										controller,
										StringUtils.capitalize(GuiConfiguration.getMessage("competition"))
						);


		panel.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(0, 10, 10, 10),
																		new MatteBorder(0, 10, 10, 10, Color.WHITE)
														)
						);

		add(panel, gbc);
		/*------------------------------------------------------------------------------------------------------*/


		// bottone avvia ricerca
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 9;
		gbc.insets = new Insets(0,0,20,0);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;

		button = new JButton(GuiConfiguration.getMessage("go").toUpperCase());
		button.setFont(GuiConfiguration.getOutputFont());

		add(button, gbc);
		/*------------------------------------------------------------------------------------------------------*/
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
