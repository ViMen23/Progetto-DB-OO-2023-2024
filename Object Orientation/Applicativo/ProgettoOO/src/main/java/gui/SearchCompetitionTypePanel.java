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
import org.apache.commons.lang3.StringUtils;

/**
 * TYPE : class - gui package
 * NAME : UserSearchCompetitionPanel
 *
 * DESC: TODO
 */

public class SearchCompetitionTypePanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel label;
	protected JRadioButton radioButton;
	protected JCheckBox checkBox;
	protected ButtonGroup buttonGroup;

	final static float outputFontSize = 18;


	public SearchCompetitionTypePanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);


		checkBox = new JCheckBox
						(
										(
														currentLocale.getString("searchBy") +
																		" " +
																		currentLocale.getString("competitionType")
										).toUpperCase()
						);

		checkBox.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(20, 0, 0, 0);
		gbc.fill = GridBagConstraints.HORIZONTAL;

		add(checkBox, gbc);

		// sottolineatura divisoria
		label = new JLabel();
		label.setBorder
						(
										new CompoundBorder
														(
																		new EmptyBorder(4, 4, 4, 4),
																		new MatteBorder(0, 0, 1, 0, Color.BLACK)
														)
						);

		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.insets = new Insets(0, 0, 10, 0);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		add(label, gbc);

		buttonGroup = new ButtonGroup();

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("league")));
		radioButton.setFont(outputFont);
		radioButton.setSelected(true);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.insets = new Insets(0, 0, 20, 50);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("cup")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 2;
		gbc.insets = new Insets(0, 0, 20, 50);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("supercup")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 2;
		gbc.insets = new Insets(0, 0, 20, 0);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

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
