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
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel label;
	protected JComboBox<String> comboBox;

	protected ResourceBundle resourceBundle;
	protected Font font;

	protected String string;

	public ChooseYearRangePanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		resourceBundle = Main.getCurrentLocale();
		font = (Font) UIManager.get("defaultFont");

		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Scelta anno inizio
		 */
		string = resourceBundle.getString("from");
		string += " ";
		string += resourceBundle.getString("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);
		label.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 10, 30);
		gbc.anchor = GridBagConstraints.LINE_START;

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Lista anno inizio
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 10, 0);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Scelta anno fine
		 */
		string = resourceBundle.getString("to");
		string += " ";
		string += resourceBundle.getString("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);
		label.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.insets = new Insets(0, 0, 20, 30);
		gbc.anchor = GridBagConstraints.LINE_START;

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Lista anno fine
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.insets = new Insets(0, 0, 20, 0);


		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/
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
