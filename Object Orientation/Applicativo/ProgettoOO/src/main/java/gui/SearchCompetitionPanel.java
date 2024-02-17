package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;



public class SearchCompetitionPanel
				extends JPanel
{
	protected JPanel panel;
	protected JButton button;
	protected JCheckBox checkBox;
	protected ButtonGroup buttonGroup;
	protected JRadioButton radioButton;

	public SearchCompetitionPanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"",
				"[]20[]10[]10[]10[]10[]10[]10[]10[]10[]20"
			);


		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo titolo: bottone
		 */
		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("competitions");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setEnabled(false);

		add(button);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per nome: checkbox
		 */

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setHorizontalTextPosition(SwingConstants.RIGHT);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());

		add(checkBox);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per nome: panel
		 */


		panel = new SearchCompetitionNamePanel(controller);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per tipo di competizione: panel
		 */

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setHorizontalTextPosition(SwingConstants.RIGHT);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());

		add(checkBox);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per tipo competizione: panel
		 */

		migLayout = new MigLayout
			(
				"debug, flowx",
				"[]50[]50[]",
				"10[]20"
			);

		panel = new JPanel(migLayout);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		buttonGroup = new ButtonGroup();

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo campionato: radioButton
		 */

		string = GuiConfiguration.getMessage("league");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		panel.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		buttonGroup.add(radioButton);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo coppa: radioButton
		 */

		string = GuiConfiguration.getMessage("cup");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		panel.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/


		buttonGroup.add(radioButton);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo supercoppa: radioButton
		 */

		string = GuiConfiguration.getMessage("supercup");
		string = StringUtils.capitalize(string);

		radioButton = new JRadioButton(string);

		panel.add(radioButton);
		/*------------------------------------------------------------------------------------------------------*/

		buttonGroup.add(radioButton);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per tipo squadra: checkbox
		 */

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setHorizontalTextPosition(SwingConstants.RIGHT);

		add(checkBox);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per tipo squadra: panel
		 */

		panel = new SearchTeamTypePanel(controller);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		checkBox = new JCheckBox(string);
		checkBox.setOpaque(true);
		checkBox.setBackground(GuiConfiguration.getSearchPanelColor());
		checkBox.setHorizontalTextPosition(SwingConstants.RIGHT);

		add(checkBox);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo ricerca per paese e confederazione: checkBox
		 */

		panel = new SearchCountryConfederationPanel(controller);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo avvia ricerca: button
		 */

		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		add(button);
		/*------------------------------------------------------------------------------------------------------*/
	}
}