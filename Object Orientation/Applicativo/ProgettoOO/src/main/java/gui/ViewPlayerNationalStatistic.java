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
		final JLabel ctrlInitialYear = new JLabel((String) null);
		final JLabel ctrlFinalYear = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();


		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> initialYearVector = new Vector<>();
		final Map<String, String> initialYearMap = new HashMap<>();

		final Vector<String> finalYearVector = new Vector<>();
		final Map<String, String> finalYearMap = new HashMap<>();

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
		LabelComboPanel competitionNamePanel;
		LabelComboPanel initialYearPanel;
		LabelComboPanel finalYearPanel;
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
						GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel = new JPanel(migLayout);

		topFilterPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("filterNationalStatistics"),
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
					Component newComponent;

					ViewPlayerNationalStatistic.this.getParent().setVisible(false);
					contentPane.remove(ViewPlayerNationalStatistic.this.getParent());

					newComponent = new MenuBarPanel(new ViewPlayerNationalStatistic(playerID));
					contentPane.add(newComponent, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					newComponent.setVisible(true);

				} catch (Exception ex) {
					System.err.println("Errore: " + ex.getMessage());
				}
			}
		});

		this.add(topFilterPanel);
		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
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


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("yearsRange"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		initialYearPanel = new LabelComboPanel(GuiConfiguration.getMessage("initialYear"), true,ctrlInitialYear);
		centralPanel.add(initialYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		finalYearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("finalYear"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlFinalYear
		);
		centralPanel.add(finalYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);


		infoPanel = new InfoPanel(GuiConfiguration.getMessage("yearsRangeInfo"));
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
								Team.TEAM_TYPE.NATIONAL.toString(),
								null,
								competitionNameMap.get(ctrlCompetitionName.getText()),
								initialYearMap.get(ctrlInitialYear.getText()),
								finalYearMap.get(ctrlFinalYear.getText()),
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

				if (ctrlInitialYear.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("yearsRange");
					string += ": ";
					string += ctrlInitialYear.getText();

					if (ctrlFinalYear.getText() != null) {
						string += " - ";
						string += ctrlFinalYear.getText();
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

		ctrlInitialYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlInitialYear.getText(), "@fill")) {
					initialYearVector.clear();
					initialYearMap.clear();

					Controller.getInstance().setPlayerComboBoxYear(
									playerID,
									Team.TEAM_TYPE.NATIONAL.toString(),
									initialYearVector,
									initialYearMap
					);

					if (initialYearVector.isEmpty()) {
						initialYearVector.add(GuiConfiguration.getMessage("noData"));
					}

					initialYearPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(initialYearVector));
				} else {
					finalYearPanel.getMyComboBox().setSelectedIndex(-1);
					finalYearPanel.getMyComboBox().setEnabled(null != initialYearMap.get(ctrlInitialYear.getText()));
					ctrlFinalYear.setText(null);
				}
			}
		});

		ctrlFinalYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlFinalYear.getText(), "@fill")) {
					finalYearVector.clear();
					finalYearMap.clear();

					for (String season : initialYearVector) {
						finalYearVector.add(season);
						finalYearMap.put(season, initialYearMap.get(season));
						if (season.equalsIgnoreCase(ctrlInitialYear.getText())) {
							break;
						}
					}

					finalYearPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(finalYearVector));
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
