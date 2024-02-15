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

	protected ResourceBundle resourceBundle;

	final static float outputFontSize = 15;


	public ChooseSeasonPanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		setBackground(Color.white);

		GridBagConstraints gbc;

		resourceBundle = Main.getCurrentLocale();

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font outputBoldFont = outputFont.deriveFont(Font.BOLD);


		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Stampa stagione
		 */
		string = resourceBundle.getString("season");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 0, 10, 0);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Elenco stagioni
		 */
		comboBox = new JComboBox<String>();
		comboBox.setMaximumRowCount(5);
		comboBox.setEditable(true);

		comboBox.setFont(outputFont);

		for(int i = 1; i<=25; ++i)
		{
			comboBox.addItem("Season " + i);
		}

		comboBox.setSelectedIndex(-1);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 10, 0);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/


		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Bottone per mostrare
		 */
		string = resourceBundle.getString("show");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setActionCommand("showSeason");
		button.setCursor(new Cursor(Cursor.HAND_CURSOR));
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
