package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Map;

public class TopViewTeamPanel
				extends JPanel
{

	private final GeneralInfoPanel generalInfoPanel;
	public TopViewTeamPanel(String teamID, String teamType, JPanel rootPanel)
	{

		MigLayout migLayout;
		JPanel navigationPanel;
		JButton squadParticipationButton;
		JButton caseButton;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.THREE_CELL_EXT_GAP_0_INT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		this.setOpaque(false);

		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_15P_INT_GAP_150_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		navigationPanel = new JPanel(migLayout);
		navigationPanel.setBackground(Color.white);

		this.add(navigationPanel);

		squadParticipationButton = new JButton(GuiConfiguration.getMessage("seasonDetails"));
		squadParticipationButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(squadParticipationButton, GuiConfiguration.HGROUP_FRAME_ADD_CONSTRAINT);

		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);
		navigationPanel.add(caseButton, GuiConfiguration.HGROUP_FRAME_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		squadParticipationButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				rootPanel.getParent().setVisible(false);
				MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

				MainFrame.getMainFrameInstance().getContentPane().add(
								new MenuBarPanel(new ViewTeamSeasonPanel(teamID, teamType)),
								GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
				);
			}
		});

		caseButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				rootPanel.getParent().setVisible(false);
				MainFrame.getMainFrameInstance().getContentPane().remove(rootPanel.getParent());

				MainFrame.getMainFrameInstance().getContentPane().add(
								new MenuBarPanel(new ViewTeamCasePanel(teamID, teamType)),
								GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
				);
			}
		});
	}

	public void setGeneralInfoPanel(Map<String,String> infoTeamMap)
	{
		generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "teamInformation");
	}
}
