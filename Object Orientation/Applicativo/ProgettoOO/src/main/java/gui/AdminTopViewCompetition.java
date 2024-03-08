package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

public class AdminTopViewCompetition
				extends JPanel
{
	private final GeneralInfoPanel generalInfoPanel;
	public AdminTopViewCompetition(String competitionID, String competitionTeamType) {
		MigLayout migLayout;
		JPanel panel;
		JButton addCompetitionEdition;
		JButton deleteCompetitionEdition;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						null
		);
		setLayout(migLayout);


		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		/*------------------------------------------------------------------------------------------------------*/


		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);

		this.add(panel);

		addCompetitionEdition = new JButton(GuiConfiguration.getMessage("addCompetitionEdition"));
		addCompetitionEdition.setCursor(GuiConfiguration.HAND_CURSOR);

		panel.add(addCompetitionEdition, GuiConfiguration.HGROUP_ADD_CONSTRAINT);


		deleteCompetitionEdition = new JButton(GuiConfiguration.getMessage("delCompetitionEdition"));
		deleteCompetitionEdition.setCursor(GuiConfiguration.HAND_CURSOR);
		panel.add(deleteCompetitionEdition, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		addCompetitionEdition.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				container.add(new AdminViewAddCompetitionEdition(competitionID, competitionTeamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});

		deleteCompetitionEdition.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(container.getComponentCount() - 1);

				component.setVisible(false);
				container.remove(component);

				//container.add(new AdminViewDelCompetitonEdition(competitionID, competitionTeamType), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
			}
		});
	}

	public void setGeneralInfoPanel(Map<String,String> infoCompetitionMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoCompetitionMap, "competitionInformation");
	}
}
