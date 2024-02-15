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

public class SearchPlayerFootPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel label;
	protected JRadioButton radioButton;
	protected JCheckBox checkBox;
	protected ButtonGroup buttonGroup;

	final static float outputFontSize = 18;


	public SearchPlayerFootPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);


		buttonGroup = new ButtonGroup();

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("right")));
		radioButton.setFont(outputFont);
		radioButton.setSelected(true);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 50);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("left")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 50);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("either")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 0);

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