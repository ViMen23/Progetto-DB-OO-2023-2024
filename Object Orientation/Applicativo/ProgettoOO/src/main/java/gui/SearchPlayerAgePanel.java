package gui;

import controller.Controller;
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


	public SearchPlayerAgePanel(Controller controller, ResourceBundle currentLocale) 
	{
		setLayout(new GridBagLayout());
		
		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);
		
		label = new JLabel(string);
		
		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,30),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/


		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										1, 0,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,0),
										0, 0
						);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		string = currentLocale.getString("age");
		string = StringUtils.capitalize(string);

		label = new JLabel();
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 1,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,30),
										0, 0
						);

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										1, 1,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * TODO
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										2, 1,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/

	}

}



