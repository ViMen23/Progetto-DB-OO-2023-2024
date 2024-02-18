

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

public class SearchTeamTypePanel
				extends JPanel
{
	protected JRadioButton radioButton;
	protected ButtonGroup buttonGroup;


	public SearchTeamTypePanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowx, insets 10 0 10 0",
				"30:push[]20[]30:push",
				""
			);

		setLayout(migLayout);

		buttonGroup = new ButtonGroup();


		/*
		 * Campo club: radio button
		 */
		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);


		/*
		 * Campo nazionale:  radio button
		 */
		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/
	}


}
