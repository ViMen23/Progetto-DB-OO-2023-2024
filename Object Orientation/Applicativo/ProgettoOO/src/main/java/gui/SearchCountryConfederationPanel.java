
package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

/**
 * TYPE : class - gui package
 * NAME : UserSearchCompetitionPanel
 *
 * DESC: TODO
 */

public class SearchCountryConfederationPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{

	protected JComboBox<String> comboBox;
	protected JRadioButton radioButton;
	protected ButtonGroup buttonGroup;

	public SearchCountryConfederationPanel(Controller controller)
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"30[]20[]30",
				"20[]10[]10[]20"
			);

		setLayout(migLayout);

		buttonGroup = new ButtonGroup();

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo mondo: radio button
		 */

		string = GuiConfiguration.getMessage("world");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo mondo:  comboBox
		 */

		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		add(comboBox);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo continente:  radio button
		 */

		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);

		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo continente:  combo box
		 */

		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		add(comboBox);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo nazione:  radio button
		 */

		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo nazione:  combo box
		 */

		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		add(comboBox);
		/*------------------------------------------------------------------------------------------------------*/
	}


	@Override
	public void actionPerformed(ActionEvent e)
	{
		/*
		if (e.getActionCommand() == "search"){
			JPanel resultPanel = new UserResultSearchPanel(Controller.getControllerInstance(), Main.currentLocale, "competitions", 5);
			JOptionPane.showMessageDialog(null, resultPanel);
		}

		 */
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
