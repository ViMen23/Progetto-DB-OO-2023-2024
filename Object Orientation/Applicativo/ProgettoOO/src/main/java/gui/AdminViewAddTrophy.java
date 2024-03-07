package gui;

import controller.Controller;

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

public class AdminViewAddTrophy
				extends JPanel
{
	public AdminViewAddTrophy(String teamID,String teamType)
	{
		final JLabel ctrlSeason = new JLabel((String) null);
		final JLabel ctrlCompetition = new JLabel((String) null);
		final JLabel ctrlTrophy = new JLabel((String) null);

		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> trophyNameVector = new Vector<>();
		final Map<String, String> trophyNameMap = new HashMap<>();

		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);


		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		LabelComboPanel seasonPanel;
		LabelComboPanel competitionNamePanel;
		LabelComboPanel trophyNamePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addTrophy"));
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
						ctrlCompetition
		);

		this.add(competitionNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		trophyNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("trophy"),
						false,
						ctrlTrophy
		);
		this.add(trophyNamePanel);
		/*------------------------------------------------------------------------------------------------------*/


		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI VOLER AGGIUNGERE IL TROFEO");

				//String message = Controller.getInstance().creat;

				try {
					JPanel panel = new AdminViewDelParticipation(teamID, teamType);

					AdminViewAddTrophy.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewAddTrophy.this);

					MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					panel.setVisible(true);
				} catch (Exception ex) {
					System.out.println("ERRORE: " + ex.getMessage());
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

					Controller.getInstance().setPartecipationYearComboBox(
									teamID,
									teamType,
									seasonVector,
									seasonMap
					);

					if (seasonVector.isEmpty()) {
						seasonVector.add(GuiConfiguration.getMessage("noData"));
					}
					seasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
				} else {
					competitionNamePanel.getMyComboBox().setEnabled(null != seasonMap.get(ctrlSeason.getText()));
					competitionNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlCompetition.setText(null);
				}
			}
		});
		ctrlCompetition.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCompetition.getText(), "@fill")) {
					competitionNameVector.clear();
					competitionNameMap.clear();

					Controller.getInstance().setPartecipationComboBox(
									teamID,
									seasonMap.get(ctrlSeason.getText()),
									competitionNameVector,
									competitionNameMap
					);

					if (competitionNameVector.isEmpty()) {
						competitionNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					competitionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(competitionNameVector));
				} else {
					trophyNamePanel.getMyComboBox().setEnabled(null != competitionNameMap.get(ctrlCompetition.getText()));
					trophyNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlTrophy.setText(null);
				}
			}
		});

		ctrlTrophy.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTrophy.getText(), "@fill")) {
					trophyNameVector.clear();
					trophyNameMap.clear();

//					Controller.getInstance().setPartecipationComboBox(
//									teamID,
//									seasonMap.get(ctrlSeason.getText()),
//									competitionNameVector,
//									competitionNameMap
//					);

					if (trophyNameVector.isEmpty()) {
						trophyNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					trophyNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(trophyNameVector));
				} else {
					confirmButton.setEnabled(null != trophyNameMap.get(ctrlTrophy.getText()));
				}
			}
		});

	}
}
