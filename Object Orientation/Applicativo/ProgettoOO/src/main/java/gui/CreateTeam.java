package gui;

import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;

public class CreateTeam
				extends JPanel
{

	public CreateTeam()
	{
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlLongName = new JLabel((String) null);
		final JLabel ctrlShortName = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);

		MigLayout migLayout;
		TitleLabel titleLabel;
		JLabel label;
		LabelTextPanel longNamePanel;
		LabelTextPanel shortNamePanel;
		RadioPanel teamTypePanel;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		JButton button;

		migLayout = new MigLayout(
						"flowy",
						"0[grow, fill]0",
						"0[]0"
		);

		this.setLayout(migLayout);

		titleLabel = new TitleLabel("INSERISCI DATI DELLA SQUADRA");

		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						"center, flowy",
						"[70%, fill, center]",
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		JPanel centerPanel = new JPanel(migLayout);

		this.add(centerPanel);
		/*------------------------------------------------------------------------------------------------------*/


		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						"5%[20%][30%, fill]5%",
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		JPanel panel = new JPanel(migLayout);
		panel.setBackground(Color.white);
		/*------------------------------------------------------------------------------------------------------*/

		label = new JLabel(GuiConfiguration.getMessage("type"));
		panel.add(label);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);

		panel.add(teamTypePanel);

		centerPanel.add(panel);
		/*------------------------------------------------------------------------------------------------------*/

		longNamePanel = new LabelTextPanel(GuiConfiguration.getMessage("longName"), ctrlLongName, Regex.patternAlnum);

		centerPanel.add(longNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		shortNamePanel = new LabelTextPanel(GuiConfiguration.getMessage("shortName"), ctrlShortName, Regex.patternCode);

		centerPanel.add(shortNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		continentNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						true,
						ctrlContinentName
		);

		centerPanel.add(continentNamePanel);

		nationNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						true,
						ctrlNationName
		);
		centerPanel.add(nationNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		button = new JButton(GuiConfiguration.getMessage("confirm"));
		button.setCursor(GuiConfiguration.HAND_CURSOR);

		centerPanel.add(button);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});


		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTeamType.getText(), Team.TEAM_TYPE.NATIONAL.toString())) {
					longNamePanel.getTextField().setEnabled(false);
					shortNamePanel.getTextField().setEnabled(false);
				}
				else {
					longNamePanel.getTextField().setEnabled(true);
					shortNamePanel.getTextField().setEnabled(true);
				}
			}
		});
	}
}
