
package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.util.ResourceBundle;

/**
 * TYPE : class - gui package
 * NAME : UserSearchCompetitionPanel
 *
 * DESC: TODO
 */

public class SearchPlayerAgePanel
				extends JPanel
{
	protected JLabel label;
	protected JComboBox<String> comboBox;
	
	protected String string;


	public SearchPlayerAgePanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, wrap 2",
				"[]30[]",
				"10[]20[]10"
			);


		setLayout(migLayout);

		/*
		 * Campo anno di riferimento: stampa
		 */
		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		add(label);

		/*
		 * Campo anno di riferimento: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);

		add(comboBox);

		/*
		 * Campo eta: stampa
		 */
		string = GuiConfiguration.getMessage("age");
		string = StringUtils.capitalize(string);

		label = new JLabel(string);

		add(label);

		/*
		 * Campo eta: comboBox
		 */
		comboBox = new JComboBox<String>();
		comboBox.setEditable(true);
		comboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		comboBox.setSelectedIndex(-1);
		add(comboBox, "split 2");

		/*
		 * Campo eta: comboBox
		 */
		comboBox = new JComboBox<String>();

		add(comboBox);


	}

}
