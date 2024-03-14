package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerClubStatistic
				extends JPanel
{

	public ViewPlayerClubStatistic(String playerID)
	{
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlInitialSeason = new JLabel((String) null);
		final JLabel ctrlFinalSeason = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> initialSeasonVector = new Vector<>();
		final Map<String, String> initialSeasonMap = new HashMap<>();

		final Vector<String> finalSeasonVector = new Vector<>();
		final Map<String, String> finalSeasonMap = new HashMap<>();

		final Vector<Vector<Object>> playerStatisticTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerStatisticTableMap = new HashMap<>();

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		Controller.getInstance().setPlayerInfoMap(
						playerID,
						infoPlayerMap
		);

		final MyTable statisticTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
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

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_10
		);

		this.setLayout(migLayout);


		topViewPlayerPanel = new TopViewPlayerPanel(playerID, this);
		this.add(topViewPlayerPanel);
		topViewPlayerPanel.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.SEVEN_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel = new JPanel(migLayout);

		topFilterPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("filterClubStatistics"),
						this,
						centralPanel
		);

		JButton resetButton = topFilterPanel.getResetButton();

		for(ActionListener actionListener: resetButton.getActionListeners()) {
			resetButton.removeActionListener(actionListener);
		}

		resetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Container contentPane = MainFrame.getMainFrameInstance().getContentPane();
				try {
					ViewPlayerClubStatistic.this.getParent().setVisible(false);
					contentPane.remove(ViewPlayerClubStatistic.this.getParent());

					contentPane.add(new MenuBarPanel(
									new ViewPlayerClubStatistic(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);

				} catch (Exception ex) {
					System.err.println("Errore: " + ex.getMessage());
				}
			}
		});

		this.add(topFilterPanel);
		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("team").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("team"), true, ctrlTeamName);
		centralPanel.add(teamNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

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

		this.add(playerStatisticTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


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
								Team.TEAM_TYPE.CLUB.toString(),
								teamNameMap.get(ctrlTeamName.getText()),
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

				if (teamNameMap.get(ctrlTeamName.getText()) != null) {
					string += GuiConfiguration.getMessage("team").toUpperCase();
					string += ": ";
					string += ctrlTeamName.getText();
				}

				if (competitionNameMap.get(ctrlCompetitionName.getText()) != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("competition").toUpperCase();
					string += ": ";
					string += ctrlCompetitionName.getText();
				}

				if (initialSeasonMap.get(ctrlInitialSeason.getText()) != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("seasonsRange");
					string += ": ";
					string += ctrlInitialSeason.getText();
					string += " - ";

					if (finalSeasonMap.get(ctrlFinalSeason.getText()) != null) {
						string += ctrlFinalSeason.getText();
					}
					else {
						string += Year.now().toString();
						string += "/";
						string += Year.now().plusYears(1).toString();
					}
				}

				playerStatisticTablePanel.getTextArea().setText(string);

				topFilterPanel.getTitleButton().doClick();
				ViewPlayerClubStatistic.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		ctrlTeamName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTeamName.getText(), "@fill")) {
					teamNameVector.clear();
					teamNameMap.clear();

					Controller.getInstance().setTeamComboBox(
									playerID,
									teamNameVector,
									teamNameMap
					);

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				}
			}
		});

		ctrlCompetitionName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCompetitionName.getText(), "@fill")) {
					competitionNameVector.clear();
					competitionNameMap.clear();

					Controller.getInstance().setCompetitionComboBox(
									playerID,
									Team.TEAM_TYPE.CLUB.toString(),
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

		ctrlInitialSeason.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlInitialSeason.getText(), "@fill")) {
					initialSeasonVector.clear();
					initialSeasonMap.clear();

					Controller.getInstance().setPlayerComboBoxYear(
									playerID,
									Team.TEAM_TYPE.CLUB.toString(),
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

		ctrlFinalSeason.addPropertyChangeListener("text", new PropertyChangeListener() {
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

		ctrlMouseTable.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String teamID;

						teamID = playerStatisticTableMap.get(tableIndex[1]).get(tableIndex[0]);

						ViewPlayerClubStatistic.this.getParent().setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(ViewPlayerClubStatistic.this.getParent());

						MainFrame.getMainFrameInstance().getContentPane().add(
										new MenuBarPanel(new ViewTeamSeasonPanel(teamID, Team.TEAM_TYPE.CLUB.toString())),
										GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
						);

					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});
	}
}
