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

/**
 * Classe che rappresenta la vista per l'aggiunta di una partecipazione ad una competizione per una squadra.
 */
public class AdminViewTeamAddParticipation
				extends JPanel
{
	public AdminViewTeamAddParticipation(String teamID, String teamType)
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
		Controller.getInstance().setConfederationMap(teamID, confederationTypeMap);


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
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewTeam = new AdminTopViewTeam(teamID, teamType, this);

		this.add(adminTopViewTeam);
		adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addParticipation"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
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

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				int chosenOption;
				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgConfirmData"),
								GuiConfiguration.getMessage("addParticipation"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message = Controller.getInstance().createPartecipation(teamID, competitionNameMap.get(ctrlCompetition.getText()), seasonMap.get(ctrlSeason.getText()));

					JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
				}

				try {
					AdminViewTeamAddParticipation.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewTeamAddParticipation.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamAddParticipation(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
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
