
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

/**
 * TYPE : class - gui package
 * NAME : ChooseYearRangePanel
 *
 * DESC: Pannello per l'interfaccia di scelta di un intervallo di tempo
 *       compreso tra due anni
 */

public class CompetitionEditionFilterPanel
				extends JPanel
{
	protected JPanel panel;
	protected JButton button;
	protected JLabel label;


	public CompetitionEditionFilterPanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"[fill]",
				"50[]20[]0[]10[]0[]10[]0[]10[]0[]20[]50"
			);

		setLayout(migLayout);


		/*
		 * Campo titolo:  bottone
		 */

		string = GuiConfiguration.getMessage("stepFilter");
		string = string.toUpperCase();

		button = new JButton(string);
		button.setEnabled(false);

		add(button);


		/*
		 * Campo tipo team:  stampa
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


		/*
		 * Campo tipo team:  panel
		 */
		panel = new SearchTeamTypePanel();

		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);


		/*
		 * Campo stagione:  stampa
		 */
		string = "  2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string +=  GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);


		add(label);


		/*
		 * Campo stagione:  panel
		 */
		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		panel = new ChoosePanel(string);

		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);


		/*
		 * Campo stagione:  stampa
		 */
		string = "  3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);


		/*
		 * Campo paese:  panel
		 */
		panel = new SearchCountryConfederationPanel();

		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);


		/*
		 * Campo competizione:  stampa
		 */
		string = "  4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);

		add(label);


		/*
		 * Campo competizione:  panel
		 */
		string = GuiConfiguration.getMessage("competition");
		string = StringUtils.capitalize(string);

		panel = new ChoosePanel(string);

		panel.setBorder(GuiConfiguration.getSearchPanelBorder());

		add(panel);


		/*
		 * Campo avvia ricerca:  bottone
		 */
		string = GuiConfiguration.getMessage("go");
		string = string.toUpperCase();

		button = new JButton(string);

		add(button);
	}

}
