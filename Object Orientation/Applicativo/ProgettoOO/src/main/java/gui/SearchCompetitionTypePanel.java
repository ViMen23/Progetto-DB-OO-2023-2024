
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

import net.miginfocom.swing.MigLayout;
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



	public SearchCompetitionTypePanel(Controller controller)
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug",
				"[]50",
				"10[]20"
			);

		setLayout(migLayout);


		buttonGroup = new ButtonGroup();

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo campionato: radioButton
		 */

		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		buttonGroup.add(radioButton);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo coppa: radioButton
		 */

		string = 
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("cup")));
		radioButton.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 50);

		add(radioButton, gbc);

		buttonGroup.add(radioButton);

		// TODO
		radioButton = new JRadioButton(StringUtils.capitalize(currentLocale.getString("supercup")));
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
