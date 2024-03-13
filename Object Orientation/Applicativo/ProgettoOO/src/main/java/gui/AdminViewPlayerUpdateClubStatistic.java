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
import java.util.*;

public class AdminViewPlayerUpdateClubStatistic
				extends JPanel
{
	public AdminViewPlayerUpdateClubStatistic(String playerID)
	{
		final JLabel ctrlSeason = new JLabel((String) null);
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel((String) null);


		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<Vector<String>> playerStatisticTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerStatisticTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel seasonPanel;
		LabelComboPanel competitionNamePanel;
		LabelComboPanel teamNamePanel;
		JButton searchButton;
		JLabel label;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);

		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("updateClubStatistics"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/
		seasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season"),
						true,
						ctrlSeason
		);

		this.add(seasonPanel);
		/*------------------------------------------------------------------------------------------------------*/

		competitionNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("competition"),
						false,
						ctrlCompetitionName
		);

		this.add(competitionNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		teamNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("team"),
						false,
						ctrlTeamName
		);

		this.add(teamNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		searchButton = new JButton(GuiConfiguration.getMessage("search"));
		searchButton.setCursor(GuiConfiguration.HAND_CURSOR);
		searchButton.setEnabled(false);

		this.add(searchButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		label = new JLabel();
		this.add(label);
		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				playerStatisticTableData.clear();
				playerStatisticTableMap.clear();

				Controller.getInstance().setStatisticTableAdmin(
								playerID,
								teamNameMap.get(ctrlTeamName.getText()),
								competitionNameMap.get(ctrlCompetitionName.getText()),
								seasonMap.get(ctrlSeason.getText()),
								playerStatisticTableData,
								playerStatisticTableMap
				);

				try {
					Component component = AdminViewPlayerUpdateClubStatistic.this.getComponent(AdminViewPlayerUpdateClubStatistic.this.getComponentCount() -1);

					component.setVisible(false);
					AdminViewPlayerUpdateClubStatistic.this.remove(component);


					Map<String, String> playerStatisticMap = new LinkedHashMap<>();

					playerStatisticMap.put("match", playerStatisticTableData.getFirst().get(0));
					playerStatisticMap.put("goal_scored", playerStatisticTableData.getFirst().get(1));
					playerStatisticMap.put("penalty_scored", playerStatisticTableData.getFirst().get(2));
					playerStatisticMap.put("assist", playerStatisticTableData.getFirst().get(3));
					playerStatisticMap.put("yellow_card", playerStatisticTableData.getFirst().get(4));
					playerStatisticMap.put("red_card", playerStatisticTableData.getFirst().get(5));
					playerStatisticMap.put("goal_conceded", playerStatisticTableData.getFirst().get(6));
					playerStatisticMap.put("penalty_saved", playerStatisticTableData.getFirst().get(7));

					AdminViewPlayerUpdateClubStatistic.this.add(new AdminViewPlayerUpdateStatistic(
										playerID,
										playerStatisticTableMap.get(0).get(0),
										playerStatisticMap
									), GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT
					);
				} catch (Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		ctrlSeason.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlSeason.getText(), "@fill")) {
					seasonVector.clear();
					seasonMap.clear();

					Controller.getInstance().setPlayerComboBoxYear(playerID, Team.TEAM_TYPE.CLUB.toString(), seasonVector, seasonMap);

					if (seasonVector.isEmpty()) {
						seasonVector.add(GuiConfiguration.getMessage("noData"));
					}
					seasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
				} else {
					competitionNamePanel.getMyComboBox().setEnabled(null != seasonMap.get(ctrlSeason.getText()));
					competitionNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlCompetitionName.setText(null);
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

					Controller.getInstance().setCompetitionPlayComboBox(
									playerID,
									seasonMap.get(ctrlSeason.getText()),
									competitionNameVector,
									competitionNameMap
					);

					if (competitionNameVector.isEmpty()) {
						competitionNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					competitionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(competitionNameVector));
				} else {
					teamNamePanel.getMyComboBox().setEnabled(null != competitionNameMap.get(ctrlCompetitionName.getText()));
					teamNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlTeamName.setText(null);
				}
			}
		});
		ctrlTeamName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTeamName.getText(), "@fill")) {
					teamNameVector.clear();
					teamNameMap.clear();

					Controller.getInstance().setTeamPlayComboBox(
									playerID,
									seasonMap.get(ctrlSeason.getText()),
									competitionNameMap.get(ctrlCompetitionName.getText()),
									teamNameVector,
									teamNameMap
					);

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				} else {
					searchButton.setEnabled(null != teamNameMap.get(ctrlTeamName.getText()));
				}
			}
		});
	}
}
