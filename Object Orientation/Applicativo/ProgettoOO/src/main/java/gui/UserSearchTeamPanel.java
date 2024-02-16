/*
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
*/
/**
 * TYPE : class - gui package
 * NAME : UserSearchCompetitionPanel
 *
 * DESC: TODO
 */
/*
public class UserSearchTeamPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel label;
	protected JTextField textField;
	protected JComboBox<String> comboBox;
	protected JButton button;
	protected JRadioButton radioButton;
	protected JCheckBox checkBox;
	protected ButtonGroup buttonGroup;


	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final static int columnNumber = 25;


	public UserSearchTeamPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);

		// intestazione ricerca per nome
		checkBox = new JCheckBox
						(
										(
														currentLocale.getString("searchBy") +
																		" " +
																		currentLocale.getString("name")
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

		// TODO
		label = new JLabel
						(
										StringUtils.capitalize(currentLocale.getString("longName")),
										SwingConstants.LEADING
						);

		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;

		add(label, gbc);

		// TODO
		textField = new JTextField(columnNumber);
		textField.setFont(inputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 2;

		add(textField, gbc);

		// TODO
		label = new JLabel
						(
										StringUtils.capitalize(currentLocale.getString("shortName")),
										SwingConstants.LEADING
						);

		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 3;

		add(label, gbc);

		// TODO
		textField = new JTextField(columnNumber);
		textField.setFont(inputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 3;

		add(textField, gbc);


		checkBox = new JCheckBox
						(
										(
														currentLocale.getString("searchBy") +
																		" " +
																		currentLocale.getString("teamType")
										).toUpperCase()
						);

		checkBox.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 4;
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
		gbc.gridy = 5;
		gbc.insets = new Insets(0, 0, 10, 0);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		add(label, gbc);

		buttonGroup = new ButtonGroup();

		// TODO
		radioButton = new JRadioButton
						(
										StringUtils.capitalize(currentLocale.getString("club"))
						);

		radioButton.setFont(outputFont);
		radioButton.setSelected(true);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 6;

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

		// TODO
		radioButton = new JRadioButton
						(
										StringUtils.capitalize(currentLocale.getString("national"))
						);

		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 6;

		add(radioButton, gbc);

		buttonGroup.add(radioButton);


		checkBox = new JCheckBox
						(
										(
														currentLocale.getString("searchBy") +
																		" " +
																		currentLocale.getString("nation") +
																		"/" +
																		currentLocale.getString("confederation")
										).toUpperCase()
						);

		checkBox.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 7;
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
		gbc.gridy = 8;
		gbc.insets = new Insets(0, 0, 10, 0);
		gbc.fill = GridBagConstraints.HORIZONTAL;
		add(label, gbc);

		// TODO
		label = new JLabel
						(
										StringUtils.capitalize(currentLocale.getString("world")),
										SwingConstants.LEADING
						);

		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 9;

		add(label, gbc);

		// TODO
		comboBox = new JComboBox<String>();
		comboBox.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 9;

		add(comboBox, gbc);

		// TODO
		label = new JLabel
						(
										StringUtils.capitalize(currentLocale.getString("continent")),
										SwingConstants.LEADING
						);

		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 10;

		add(label, gbc);

		// TODO
		comboBox = new JComboBox<String>();
		comboBox.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 10;

		add(comboBox, gbc);

		// TODO
		label = new JLabel
						(
										StringUtils.capitalize(currentLocale.getString("nation")),
										SwingConstants.LEADING
						);

		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 11;

		add(label, gbc);

		// TODO
		comboBox = new JComboBox<String>();
		comboBox.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 11;

		add(comboBox, gbc);


		// TODO
		button = new JButton(currentLocale.getString("search").toUpperCase());
		button.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 12;
		gbc.insets = new Insets(20, 0, 10, 0);

		add(button, gbc);

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
*/