package gui;

import controller.Controller;
import model.Country;
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

public class AdminViewAddParticipation
				extends JPanel
{
	public AdminViewAddParticipation(String teamID, String teamType)
	{
		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlSeason = new JLabel((String) null);
		final JLabel ctrlCompetition = new JLabel((String) null);

		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Map<String, String> confederationTypeMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Enum[] enumCountryType;


		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);
		Controller.getInstance().setConfederationPartecipation(teamID, confederationTypeMap);


		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		JPanel panel;
		JLabel label;
		RadioPanel countryTypePanel;
		LabelComboPanel seasonPanel;

		LabelComboPanel competitionNamePanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						GuiConfiguration.SIX_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewTeam = new AdminTopViewTeam(teamID, teamType);

		this.add(adminTopViewTeam);
		adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addParticipation"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		this.add(panel);

		label = new JLabel(GuiConfiguration.getMessage("confederationType"));

		panel.add(label);

		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			enumCountryType = Country.COUNTRY_TYPE.values();
		}
		else {
			enumCountryType = new Enum[]{Country.COUNTRY_TYPE.WORLD, Country.COUNTRY_TYPE.CONTINENT};
		}

		countryTypePanel = new RadioPanel(enumCountryType, ctrlCountryType);
		panel.add(countryTypePanel);
		/*------------------------------------------------------------------------------------------------------*/

		competitionNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("competition"),
						false,
						ctrlCompetition
		);

		this.add(competitionNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		seasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season"),
						false,
						ctrlSeason
		);
		this.add(seasonPanel);
		/*------------------------------------------------------------------------------------------------------*/


		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI AVER INSERITO I DATI CORRETTAMENTE"); //TODO

				String message = Controller.getInstance().createPartecipation(teamID, competitionNameMap.get(ctrlCompetition.getText()), seasonMap.get(ctrlSeason.getText()));

				System.out.println(message);
			}
		});

		ctrlCountryType.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				competitionNamePanel.getMyComboBox().setEnabled(null != ctrlCountryType.getText());
				competitionNamePanel.getMyComboBox().setSelectedIndex(-1);
				ctrlCompetition.setText(null);
			}
		});
		ctrlCompetition.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCompetition.getText(), "@fill")) {
					competitionNameVector.clear();
					competitionNameMap.clear();

					Controller.getInstance().setCompetitionConfederationComboBox(
									confederationTypeMap.get(ctrlCountryType.getText()),
									teamType,
									competitionNameVector,
									competitionNameMap
					);


					if (competitionNameVector.isEmpty()) {
						competitionNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					competitionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(competitionNameVector));
				} else {
					seasonPanel.getMyComboBox().setEnabled(null != competitionNameMap.get(ctrlCompetition.getText()));
					seasonPanel.getMyComboBox().setSelectedIndex(-1);
					ctrlSeason.setText(null);
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

					Controller.getInstance().setCompetitionEditionComboBox(
									teamType,
									competitionNameMap.get(ctrlCompetition.getText()),
									seasonVector,
									seasonMap
					);

					if (seasonVector.isEmpty()) {
						seasonVector.add(GuiConfiguration.getMessage("noData"));
					}
					seasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
				} else {
					confirmButton.setEnabled(null != seasonMap.get(ctrlSeason.getText()));
				}
			}
		});

	}

}
