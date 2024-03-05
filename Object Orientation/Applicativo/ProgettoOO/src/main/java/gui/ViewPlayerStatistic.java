package gui;

import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerStatistic
				extends JPanel
{

	public ViewPlayerStatistic(String playerID, Boolean club, String title)
	{
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlInitialSeason = new JLabel((String) null);
		final JLabel ctrlFinalSeason = new JLabel((String) null);

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> initialSeasonVector = new Vector<>();
		final Map<String, String> initialSeasonMap = new HashMap<>();

		final Vector<String> finalSeasonVector = new Vector<>();
		final Map<String, String> finalSeasonMap = new HashMap<>();

		final Vector<Vector<String>> playerStatisticTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerStatisticTableMap = new HashMap<>();

		MigLayout migLayout;
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
		String teamType;

		if (club) {
			rowConstraint = GuiConfiguration.SEVEN_CELL_LAYOUT_CONSTRAINT;
			teamType = Team.TEAM_TYPE.CLUB.toString();
		}
		else {
			rowConstraint = GuiConfiguration.FIVE_CELL_LAYOUT_CONSTRAINT;
			teamType = Team.TEAM_TYPE.NATIONAL.toString();
		}

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		setLayout(migLayout);
		setOpaque(false);

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						rowConstraint
		);

		centralPanel = new JPanel(migLayout);

		topFilterPanel = new TopSearchPanel(
						title,
						this,
						centralPanel
		);

		this.add(topFilterPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);
		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		if (club) {
			titleLabel = new TitleLabel(GuiConfiguration.getMessage("team").toUpperCase());
			centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

			titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
			centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

			teamNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("team"), true, ctrlTeamName);
			centralPanel.add(teamNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

			infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamInfo"));
			centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		}
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

		playerStatisticTablePanel = new TablePanel(true, null);
		centralPanel.add(playerStatisticTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		button = new JButton(GuiConfiguration.getMessage("search"));


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable playerStatisticTable = playerStatisticTablePanel.getMyTable();
				String string;

				//infoPlayerMap.clear();
				playerStatisticTableData.clear();
				playerStatisticTableMap.clear();

//				Controller.getInstance().setPlayerStatisticView(
//								playerID,
//								teamType,
//								teamNameMap.get(ctrlTeamName.getText()),
//								competitionNameMap.get(ctrlCompetitionName.getText()),
//								initialSeasonMap.get(ctrlInitialSeason.getText()),
//								finalSeasonMap.get(ctrlFinalSeason.getText()),
//								infoPlayerMap,
//								playerStatisticTableData,
//								playerStatisticTableMap
//				);

				playerStatisticTable.setModel(new TableModel(playerStatisticTableData, GuiConfiguration.TEAM_TABLE_COLUMN_NAME));
				playerStatisticTable.setPreferredScrollableViewportSize(playerStatisticTable.getPreferredSize());

				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("teams");
				string += " ";
				string += playerStatisticTableData.size();

				playerStatisticTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";

				if (ctrlTeamName.getText() != null) {
					string += GuiConfiguration.getMessage("team").toUpperCase();
					string += ": ";
					string += ctrlTeamName.getText();
				}

				if (ctrlCompetitionName.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("competition").toUpperCase();
					string += ": ";
					string += ctrlCompetitionName.getText();
				}

				if (ctrlInitialSeason.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("initialSeason");
					string += ": ";
					string += ctrlInitialSeason.getText();

					if (ctrlFinalSeason.getText() != null) {
						string += " - ";
						string += ctrlFinalSeason.getText();
					}
				}

				playerStatisticTablePanel.getTextArea().setText(string);

				topFilterPanel.getTitleButton().doClick();
				ViewPlayerStatistic.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

	}
}
