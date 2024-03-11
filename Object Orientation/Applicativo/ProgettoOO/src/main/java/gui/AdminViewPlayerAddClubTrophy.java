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
import java.time.Year;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerAddClubTrophy
				extends JPanel
{
	public AdminViewPlayerAddClubTrophy(String playerID)
	{
		final JLabel ctrlSeason = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlTrophyName = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> trophyNameVector = new Vector<>();
		final Map<String, String> trophyNameMap = new HashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel seasonPanel;
		LabelComboPanel teamNamePanel;
		LabelComboPanel competitionNamePanel;
		LabelComboPanel trophyNamePanel;
		JButton confirmButton;


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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addClubTrophy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		seasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season"),
						true,
						ctrlSeason
		);

		this.add(seasonPanel);
		/*------------------------------------------------------------------------------------------------------*/

		teamNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("team"),
						false,
						ctrlTeamName
		);

		this.add(teamNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		competitionNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("competition"),
						false,
						ctrlCompetitionName
		);

		this.add(competitionNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		trophyNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("trophy"),
						false,
						ctrlSeason
		);

		this.add(trophyNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI AVER INSERITO I DATI CORRETTAMENTE"); //TODO

				//TODO
//				String message = Controller.getInstance().createPlayerPosition(playerID, positionNameMap.get(ctrlPositionName.getText()));
//
//				System.out.println(message);
			}
		});

		ctrlSeason.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlSeason.getText(), "@fill")) {
					int minYear;
					int maxYear;

					String string;

					string = Controller.getInstance().setPlayerYear(playerID);

					String[] keyPart = string.split("@");

					minYear = Integer.parseInt(keyPart[0]);
					maxYear = Integer.parseInt(keyPart[1]);

					if (maxYear > Year.now().getValue()) {
						maxYear = Year.now().getValue();
					}

					MyComboBox seasonCombo = seasonPanel.getMyComboBox();

					seasonCombo.removeAllItems();

					for (int i = maxYear; i >= minYear; --i) {
						string = String.valueOf(i);
						string += "/";
						string += String.valueOf(i + 1);

						seasonCombo.addItem(string);

						seasonMap.put(string, String.valueOf(i));
					}

				} else {
					teamNamePanel.getMyComboBox().setEnabled(null != seasonMap.get(ctrlSeason.getText()));
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

					Controller.getInstance().setTeamComboBox(
									playerID,
									Team.TEAM_TYPE.CLUB.toString(),
									seasonMap.get(ctrlSeason.getText()),
									teamNameVector,
									teamNameMap
					);

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				} else {
					competitionNamePanel.getMyComboBox().setEnabled(null != teamNameMap.get(ctrlTeamName.getText()));
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

					Controller.getInstance().setPartecipationComboBox(
									teamNameMap.get(ctrlTeamName.getText()),
									seasonMap.get(ctrlSeason.getText()),
									competitionNameVector,
									competitionNameMap
					);

					if (competitionNameVector.isEmpty()) {
						competitionNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					competitionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(competitionNameVector));
				} else {
					trophyNamePanel.getMyComboBox().setEnabled(null != competitionNameMap.get(ctrlCompetitionName.getText()));
					trophyNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlTrophyName.setText(null);
				}
			}
		});
		ctrlTrophyName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTrophyName.getText(), "@fill")) {
					trophyNameVector.clear();
					trophyNameMap.clear();


					Controller.getInstance().setPlayerTrophyComboBox(trophyNameVector, trophyNameMap);


					if (trophyNameVector.isEmpty()) {
						trophyNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					trophyNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(trophyNameVector));
				} else {
					confirmButton.setEnabled(null != trophyNameMap.get(ctrlTrophyName.getText()));
				}
			}
		});

	}

}
