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
{
	protected JLabel label;
	protected JRadioButton radioButton;
	protected JCheckBox checkBox;
	protected ButtonGroup buttonGroup;

	protected String string;

	public SearchPlayerFootPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		buttonGroup = new ButtonGroup();

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("right");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);
		radioButton.setFont(GuiConfiguration.getOutputFont());
		radioButton.setSelected(true);

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,20,50),
										0, 0
						);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("left")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 50);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("either")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 2;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 0);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

	}

}
