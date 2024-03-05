package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;


import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewTeamCasePanel
				extends JPanel
{
	public ViewTeamCasePanel(String teamID, String teamType)
	{
		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Vector<Vector<String>> trophyTableData = new Vector<>();
		final Vector<Vector<String>> prizeTableData = new Vector<>();

		Controller.getInstance().setTeamCaseView(
						teamID,
						teamType,
						infoTeamMap,
						trophyTableData,
						prizeTableData
		);

		MigLayout migLayout;
		JPanel navigationPanel;
		GeneralInfoPanel generalInfoPanel;
		JButton squadParticipationButton;
		JButton caseButton;
		JPanel tablePanel;
		JPanel casePanel;
		TablePanel trophyPanel;
		TablePanel prizePanel;


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.THREE_CELL_EXT_GAP_0_10_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		generalInfoPanel = new GeneralInfoPanel();
		this.add(generalInfoPanel);
		generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "teamInformation");
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

		navigationPanel.add(squadParticipationButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);

		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);

		navigationPanel.add(caseButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.TWO_CELL_LAYOUT_CONSTRAINT
		);

		casePanel = new JPanel(migLayout);


		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_GROW_FILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
		);

		tablePanel = new JPanel(migLayout);

		casePanel.add(tablePanel);

		trophyPanel = new TablePanel(false);
		trophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("trophies"));
		trophyPanel.getMyTable().setModel(new TableModel(trophyTableData, GuiConfiguration.TEAM_TROPHY_TABLE_COLUMN_NAME));
		trophyPanel.getMyTable().setPreferredScrollableViewportSize(trophyPanel.getMyTable().getPreferredSize());

		tablePanel.add(trophyPanel);

		prizePanel = new TablePanel(false);
		prizePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));
		prizePanel.getMyTable().setModel(new TableModel(prizeTableData, GuiConfiguration.TEAM_PRIZE_TABLE_COLUMN_NAME));
		prizePanel.getMyTable().setPreferredScrollableViewportSize(prizePanel.getMyTable().getPreferredSize());

		tablePanel.add(prizePanel);

		this.add(casePanel);


// TODO decommentare quando pronta l altra vista

//		squadParticipationButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				Container container = MainFrame.getMainFrameInstance().getContentPane();
//				Component component = container.getComponent(2);
//				component.setVisible(false);
//				container.remove(component);
//
//				try {
//					Component newComponent = new ViewTeamSeasonPanel(teamID, teamType);
//					container.add(newComponent, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
//					newComponent.setVisible(true);
//				} catch (Exception ex) {
//					System.out.println(ex.getMessage());
//				}
//			}
//		});

		caseButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container container = MainFrame.getMainFrameInstance().getContentPane();
				Component component = container.getComponent(2);
				component.setVisible(false);
				container.remove(component);

				try {
					Component newComponent = new ViewTeamCasePanel(teamID, teamType);
					container.add(newComponent, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
			}
		});
	}
}
