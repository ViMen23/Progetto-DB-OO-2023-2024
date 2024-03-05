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
		ViewTeamCaseGeneralInfo viewTeamCaseGeneralInfo;
		JPanel tablePanel;
		TablePanel trophyPanel;
		TablePanel prizePanel;


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		viewTeamCaseGeneralInfo = new ViewTeamCaseGeneralInfo(teamID, teamType);
		this.add(viewTeamCaseGeneralInfo);
		viewTeamCaseGeneralInfo.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_GROW_FILL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_TOP_GAP_10_0_LAYOUT_CONSTRAINT
		);

		tablePanel = new JPanel(migLayout);

		this.add(tablePanel);

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
	}
}
