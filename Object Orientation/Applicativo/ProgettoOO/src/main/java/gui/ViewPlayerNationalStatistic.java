package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerNationalStatistic
				extends JPanel
{

	public ViewPlayerNationalStatistic(String playerID)
	{
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlInitialSeason = new JLabel((String) null);
		final JLabel ctrlFinalSeason = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();


		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> initialSeasonVector = new Vector<>();
		final Map<String, String> initialSeasonMap = new HashMap<>();

		final Vector<String> finalSeasonVector = new Vector<>();
		final Map<String, String> finalSeasonMap = new HashMap<>();

		final Vector<Vector<String>> playerStatisticTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerStatisticTableMap = new HashMap<>();

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		Controller.getInstance().setPlayerStatisticView(
						playerID,
						Team.TEAM_TYPE.NATIONAL.toString(),
						null,
						null,
						null,
						null,
						infoPlayerMap,
						playerStatisticTableData,
						playerStatisticTableMap
		);

		final MyTable statisticTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
		JPanel statisticFilterPanel;
		TopSearchPanel topFilterPanel;
		JPanel centralPanel;
		InfoPanel infoPanel;
		TitleLabel titleLabel;
		LabelComboPanel teamNamePanel;
		LabelComboPanel competitionNamePanel;
		LabelComboPanel initialSeasonPanel;
		LabelComboPanel finalSeasonPanel;
		TablePanel playerStatisticTablePanel;
		JButton button;

		String rowConstraint;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_10
		);

		this.setLayout(migLayout);


		topViewPlayerPanel = new TopViewPlayerPanel(playerID);
		this.add(topViewPlayerPanel);
		topViewPlayerPanel.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		statisticFilterPanel = new JPanel(migLayout);
		statisticFilterPanel.setOpaque(false);
		this.add(statisticFilterPanel);


		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel = new JPanel(migLayout);

		topFilterPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("filterNationalStatistics"),
						statisticFilterPanel,
						centralPanel
		);

		statisticFilterPanel.add(topFilterPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);
		statisticFilterPanel.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("competition").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		competitionNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("competition"), true, ctrlCompetitionName);
		centralPanel.add(competitionNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("competitionInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("seasonRange").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		initialSeasonPanel = new LabelComboPanel(GuiConfiguration.getMessage("initialSeason"), true,ctrlInitialSeason);
		centralPanel.add(initialSeasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		finalSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("finalSeason"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlFinalSeason
		);
		centralPanel.add(finalSeasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);


		infoPanel = new InfoPanel(GuiConfiguration.getMessage("seasonInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		playerStatisticTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);

		statisticTable = playerStatisticTablePanel.getMyTable();
		statisticTable.setModel(new TableModel(playerStatisticTableData, GuiConfiguration.PLAYER_STATISTIC_TABLE_COLUMN_NAME));
		statisticTable.setPreferredScrollableViewportSize(statisticTable.getPreferredSize());

		statisticFilterPanel.add(playerStatisticTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		button = new JButton(GuiConfiguration.getMessage("search"));


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable playerStatisticTable = playerStatisticTablePanel.getMyTable();
				String string;

				infoPlayerMap.clear();
				playerStatisticTableData.clear();
				playerStatisticTableMap.clear();

				Controller.getInstance().setPlayerStatisticView(
								playerID,
								Team.TEAM_TYPE.NATIONAL.toString(),
								null,
								competitionNameMap.get(ctrlCompetitionName.getText()),
								initialSeasonMap.get(ctrlInitialSeason.getText()),
								finalSeasonMap.get(ctrlFinalSeason.getText()),
								infoPlayerMap,
								playerStatisticTableData,
								playerStatisticTableMap
				);

				topViewPlayerPanel.setGeneralInfoPanel(infoPlayerMap);

				playerStatisticTable.setModel(new TableModel(playerStatisticTableData, GuiConfiguration.PLAYER_STATISTIC_TABLE_COLUMN_NAME));
				playerStatisticTable.setPreferredScrollableViewportSize(playerStatisticTable.getPreferredSize());

				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("statistics");
				string += " ";
				string += playerStatisticTableData.size();

				playerStatisticTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";

				if (ctrlCompetitionName.getText() != null) {
					string += GuiConfiguration.getMessage("competition").toUpperCase();
					string += ": ";
					string += ctrlCompetitionName.getText();
				}

				if (ctrlInitialSeason.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("seasonsRange");
					string += ": ";
					string += ctrlInitialSeason.getText();

					if (ctrlFinalSeason.getText() != null) {
						string += " - ";
						string += ctrlFinalSeason.getText();
					}
				}

				playerStatisticTablePanel.getTextArea().setText(string);

				topFilterPanel.getTitleButton().doClick();
				ViewPlayerNationalStatistic.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		ctrlCompetitionName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCompetitionName.getText(), "@fill")) {
					competitionNameVector.clear();
					competitionNameMap.clear();

					Controller.getInstance().setCompetitionComboBox(
									playerID,
									Team.TEAM_TYPE.NATIONAL.toString(),
									competitionNameVector,
									competitionNameMap
					);

					if (competitionNameVector.isEmpty()) {
						competitionNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					competitionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(competitionNameVector));
				}
			}
		});

		ctrlInitialSeason.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlInitialSeason.getText(), "@fill")) {
					initialSeasonVector.clear();
					initialSeasonMap.clear();

					Controller.getInstance().setPlayerComboBox(
									playerID,
									initialSeasonVector,
									initialSeasonMap
					);

					if (initialSeasonVector.isEmpty()) {
						initialSeasonVector.add(GuiConfiguration.getMessage("noData"));
					}

					initialSeasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(initialSeasonVector));
				} else {
					finalSeasonPanel.getMyComboBox().setSelectedIndex(-1);
					finalSeasonPanel.getMyComboBox().setEnabled(null != initialSeasonMap.get(ctrlInitialSeason.getText()));
					ctrlFinalSeason.setText(null);
				}
			}
		});

		ctrlFinalSeason.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlFinalSeason.getText(), "@fill")) {
					finalSeasonVector.clear();
					finalSeasonMap.clear();

					for (String season : initialSeasonVector) {
						finalSeasonVector.add(season);
						finalSeasonMap.put(season, initialSeasonMap.get(season));
						if (season.equalsIgnoreCase(ctrlInitialSeason.getText())) {
							break;
						}
					}

					finalSeasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(finalSeasonVector));
				}
			}
		});

		ctrlMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String teamID;

						teamID = playerStatisticTableMap.get(tableIndex[1]).get(tableIndex[0]);

						JPanel panel = new ViewTeamSeasonPanel(teamID, Team.TEAM_TYPE.NATIONAL.toString());

						ViewPlayerNationalStatistic.this.setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(ViewPlayerNationalStatistic.this);

						MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
						panel.setVisible(true);
					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}

				}
			}
		});
	}
}
