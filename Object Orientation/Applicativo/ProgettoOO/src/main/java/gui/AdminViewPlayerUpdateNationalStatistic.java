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

public class AdminViewPlayerUpdateNationalStatistic
				extends JPanel
{

	public AdminViewPlayerUpdateNationalStatistic(String playerID)
	{
		final JLabel ctrlYear = new JLabel((String) null);
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel((String) null);


		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> yearVector = new Vector<>();
		final Map<String,String> yearMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Map<String, String> playerStatisticTableMap = new LinkedHashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel yearPanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("updateNationalStatistics"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/
		yearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("year"),
						true,
						ctrlYear
		);

		this.add(yearPanel);
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
				String playID;

				playerStatisticTableMap.clear();

				playID = Controller.getInstance().setStatisticMapAdmin(
								playerID,
								teamNameMap.get(ctrlTeamName.getText()),
								competitionNameMap.get(ctrlCompetitionName.getText()),
								ctrlYear.getText(),
								playerStatisticTableMap
				);

				try {
					Component component = AdminViewPlayerUpdateNationalStatistic.this.getComponent(AdminViewPlayerUpdateNationalStatistic.this.getComponentCount() -1);

					component.setVisible(false);
					AdminViewPlayerUpdateNationalStatistic.this.remove(component);

					AdminViewPlayerUpdateNationalStatistic.this.add(new AdminViewPlayerUpdateStatistic(
										playerID,
										playID,
										playerStatisticTableMap
									), GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT
					);
				} catch (Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		ctrlYear.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlYear.getText(), "@fill")) {
					yearVector.clear();
					yearMap.clear();

					Controller.getInstance().setPlayerComboBoxYear(playerID, Team.TEAM_TYPE.NATIONAL.toString(), yearVector, yearMap);

					if (yearVector.isEmpty()) {
						yearVector.add(GuiConfiguration.getMessage("noData"));
					}
					yearPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(yearVector));
				} else {
					competitionNamePanel.getMyComboBox().setEnabled(null != yearMap.get(ctrlYear.getText()));
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
									Team.TEAM_TYPE.NATIONAL.toString(),
									yearMap.get(ctrlYear.getText()),
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
									yearMap.get(ctrlYear.getText()),
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
