package gui;

import controller.Controller;

import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

public class SearchTotalStatistics
				extends JPanel
{
	public SearchTotalStatistics()
	{
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlPlayerRole = new JLabel((String) null);

		final Vector<Vector<String>> totalStatisticsTableData = new Vector<>();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		RadioPanel teamTypePanel;
		InfoPanel infoPanel;
		PlayerRoleCheckPanel playerRolePanel;
		TablePanel totalStatisticsTablePanel;
		JButton button;

		String string;

		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);

		string = GuiConfiguration.getMessage("searchTotalPlayerStatistics");
		string = string.toUpperCase();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("info");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("totalStatisticsTeamTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("info");
		string = string.toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerRolePanel = new PlayerRoleCheckPanel(ctrlPlayerRole);
		centralPanel.add(playerRolePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("totalStatisticsRoleInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		totalStatisticsTablePanel = new TablePanel(true, null);
		this.add(totalStatisticsTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();
		button = new JButton(string);
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable totalStatisticsTable = totalStatisticsTablePanel.getMyTable();
				String string;

				totalStatisticsTableData.clear();

				Controller.getInstance().setStatisticTable(
								ctrlTeamType.getText(),
								ctrlPlayerRole.getText(),
								totalStatisticsTableData
				);

				totalStatisticsTable.setModel(new TableModel(totalStatisticsTableData, GuiConfiguration.STATISTIC_TOTAL_TABLE_COLUMN_NAME));
				totalStatisticsTable.setPreferredScrollableViewportSize(totalStatisticsTable.getPreferredSize());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("countries");
				string += " ";
				string += totalStatisticsTableData.size();
				string = string.toUpperCase();

				totalStatisticsTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";
				if (ctrlTeamType.getText() != null) {
					string += StringUtils.capitalize(GuiConfiguration.getMessage("teamType"));
					string += ": ";
					string += StringUtils.capitalize(GuiConfiguration.getMessage(ctrlTeamType.getText()));
				}

				if (ctrlPlayerRole.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += StringUtils.capitalize(GuiConfiguration.getMessage("role"));
					string += ": ";
					string += StringUtils.capitalize(GuiConfiguration.getMessage(ctrlPlayerRole.getText())); //TODO RICORDA DF_MF
				}

				totalStatisticsTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				SearchTotalStatistics.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

	}
}
