package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.util.ResourceBundle;

/**
 * TYPE : class - gui package
 * NAME : ChooseSeasonPanel
 *
 * DESC: Pannello per costruire un'interfaccia con lo scopo
 *       di far scegliere una stagione calcistica
 */
public class ChooseSeasonPanel
				extends JPanel
{
	protected JLabel label;

	protected JComboBox<String> comboBox;

	protected JButton button;
	protected String string;


	public ChooseSeasonPanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Stampa stagione
		 */
		string = GuiConfiguration.getMessage("season");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,0),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Elenco stagioni
		 */
		comboBox = new JComboBox<String>();
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setEditable(true);
		comboBox.setFont(GuiConfiguration.getOutputFont());

		for(int i = 1; i<=25; ++i)
		{
			comboBox.addItem("Season " + i);
		}

		comboBox.setSelectedIndex(-1);


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
		 * Bottone per mostrare
		 */
		string = GuiConfiguration.getMessage("show");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setActionCommand("showSeason");
		button.setCursor(GuiConfiguration.get);
		button.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 10, 0);

		add(button, gbc);
		/*------------------------------------------------------------------------------------------------------*/
	}
}
