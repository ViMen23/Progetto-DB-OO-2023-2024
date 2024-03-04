package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ViewTeamPanel
				extends JPanel
{
	private final String teamID;

	public ViewTeamPanel(String teamID)
	{
		final JLabel ctrlSeason = new JLabel((String) null);
		MigLayout migLayout;
		GeneralInfoPanel generalInfoPanel;
		LabelComboPanel showSeason;
		JPanel tableGeneralPanel;
		JButton showButton;
		TablePanel squadPanel;
		TablePanel participationPanel;
		TablePanel trophyPanel;
		TablePanel prizePanel;

		this.teamID = teamID;

		migLayout = new MigLayout
			(
				GuiConfiguration.VLAYOUT_CONSTRAINT,
				GuiConfiguration.ONE_GROW_FILL_CELL,
				"0[]20[]20[]10" //TODO
			);

		this.setLayout(migLayout);


		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		/*------------------------------------------------------------------------------------------------------*/

		showSeason = new LabelComboPanel(GuiConfiguration.getMessage("season"), true, ctrlSeason); //TODO ADD COLUMN CONSTRAINT
		add(showSeason);

		showButton = new JButton(GuiConfiguration.getMessage("show"));
		showSeason.add(showButton);

		showButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout //TODO
			(
				"debug, wrap 2",
				"0[60%, fill]3%[36%, fill]0",
				"0[]20[]10"

			);

		tableGeneralPanel = new JPanel(migLayout);
		tableGeneralPanel.setOpaque(false);

		add(tableGeneralPanel);
		/*------------------------------------------------------------------------------------------------------*/

		squadPanel = new TablePanel(false);
		tableGeneralPanel.add(squadPanel);

		participationPanel = new TablePanel(false);
		tableGeneralPanel.add(participationPanel, "split 3, flowy");//TODO

		trophyPanel = new TablePanel(false);
		tableGeneralPanel.add(trophyPanel);

		prizePanel = new TablePanel(false);
		tableGeneralPanel.add(prizePanel);
	}


	
}
