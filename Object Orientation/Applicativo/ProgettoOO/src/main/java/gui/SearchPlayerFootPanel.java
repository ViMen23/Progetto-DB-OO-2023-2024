
package gui;

import javax.swing.*;
import net.miginfocom.swing.MigLayout;
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
	protected JRadioButton radioButton;
	protected ButtonGroup buttonGroup;

	public SearchPlayerFootPanel()
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowx",
				"20[]50[]50[]20",
				"10[]10"
			);

		setLayout(migLayout);

		buttonGroup = new ButtonGroup();

		/*
		 * Campo ricerca per il piede preferito destro: radioButton
		 */
		string = GuiConfiguration.getMessage("right");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo ricerca per il piede preferito sinistro: radioButton
		 */
		string = GuiConfiguration.getMessage("left");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);

		/*
		 * Campo ricerca per entrambi i piedi preferiti: radioButton
		 */
		string = GuiConfiguration.getMessage("either");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		add(radioButton);

		buttonGroup.add(radioButton);


	}

}
