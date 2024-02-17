
package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

public class MilitancyFilterPanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JPanel panel;
	protected JButton button;
	protected JCheckBox checkBox;
	protected JLabel label;

	public MilitancyFilterPanel(Controller controller)
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"[fill]",
				"50[]20[]0[]10[]0[]10[]0[]10[]0[]20[]50"
			);

		setLayout(migLayout);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo intestazione ricerca: bottone
		 */

		string = GuiConfiguration.getMessage("militancyFilter");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setEnabled(false);

		add(button);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta tipo team: stampa
		 */

		string = "  1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta tipo team: panel
		 */

		panel = new SearchTeamTypePanel(controller);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta paese: stampa
		 */

		string = "  2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta paese: panel
		 */

		panel = new SearchNationConfederationPanel(controller);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta squadra: stampa
		 */

		string = "  3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta squadra: panel
		 */

		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		panel = new ChoosePanel(controller, string);

		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta anni: stampa
		 */

		string = "  4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("years");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta anni: panel
		 */
		string = GuiConfiguration.getMessage("from");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);


		panel = new ChoosePanel(controller, string);
		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo scelta anni: panel
		 */
		string = GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);


		panel.add(new ChoosePanel(controller, string));

		add(panel);

		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo avvia ricerca: bottone
		 */

		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		add(button);
		/*------------------------------------------------------------------------------------------------------*/
	}

	@Override
	public void actionPerformed(ActionEvent e) {

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}


}
