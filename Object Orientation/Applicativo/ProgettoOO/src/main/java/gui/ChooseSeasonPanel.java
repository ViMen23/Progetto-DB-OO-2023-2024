package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.*;
import java.util.ResourceBundle;

public class ChooseSeasonPanel
				extends JPanel
{
	protected JLabel label;

	protected JComboBox<String> comboBox;

	protected JButton button;

	final static float outputFontSize = 15;
	final static float inputFontSize = 15;


	public ChooseSeasonPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		setBackground(Color.white);

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);
		Font outputBoldFont = outputFont.deriveFont(Font.BOLD);

		// filtro stagione label
		label = new JLabel(currentLocale.getString("season"), SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		//stagione combo box
		comboBox = new JComboBox<String>();
		comboBox.setMaximumRowCount(5);
		comboBox.setEditable(true);

		comboBox.setFont(outputFont);


		for(int i = 1; i<=25; ++i){
			comboBox.addItem("Season " + i);
		}

		comboBox.setSelectedIndex(-1);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);


		add(comboBox, gbc);


		//mostrare button
		button = new JButton(currentLocale.getString("show"));
		button.setActionCommand("showSeason");
		button.setCursor(new Cursor(Cursor.HAND_CURSOR));
		button.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		add(button, gbc);

	}
}
