package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

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
 * NAME : ChooseYearRangePanel
 *
 * DESC: Pannello per l'interfaccia di scelta di un intervallo di tempo
 *       compreso tra due anni
 */
public class ChooseYearRangePanel
				extends JPanel
{
	protected JLabel label;
	protected JComboBox<String> comboBox;

	protected String string;

	public ChooseYearRangePanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Scelta anno inizio
		 */
		string = GuiConfiguration.getMessage("from");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(
										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,30),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Lista anno inizio
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(
										1, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,0),
										0, 0
						);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Scelta anno fine
		 */
		string = GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(
										0, 1,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,30),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Lista anno fine
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(
										1, 1,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/
	}

}
