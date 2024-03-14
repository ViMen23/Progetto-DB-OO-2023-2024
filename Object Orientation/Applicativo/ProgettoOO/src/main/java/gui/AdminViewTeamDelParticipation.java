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

public class AdminViewTeamDelParticipation
				extends JPanel
{
	public AdminViewTeamDelParticipation(String teamID, String teamType)
	{
		final JLabel ctrlSeason = new JLabel((String) null);

		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<Vector<Object>> participationTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> participationTableMap = new HashMap<>();


		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);

		final MyTable participationTable;

		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		LabelComboPanel showSeasonPanel;
		JButton showButton;
		TablePanel participationPanel;
		JButton deleteButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewTeam = new AdminTopViewTeam(teamID, teamType, this);

		this.add(adminTopViewTeam);
		adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delParticipation"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		showSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season").toUpperCase(),
						true,
						GuiConfiguration.THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT,
						ctrlSeason
		);

		showButton = new JButton(GuiConfiguration.getMessage("show"));
		showButton.setCursor(GuiConfiguration.HAND_CURSOR);
		showButton.setEnabled(false);

		showSeasonPanel.add(showButton);

		this.add(showSeasonPanel);
		/*------------------------------------------------------------------------------------------------------*/

		participationPanel = new TablePanel(false);

		participationPanel.getTitleLabel().setText(GuiConfiguration.getMessage("participations"));

		participationTable = participationPanel.getMyTable();
		participationTable.setModel(new TableModel(participationTableData, GuiConfiguration.TEAM_PARTICIPATING_TABLE_COLUMN_NAME));
		participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());

		this.add(participationPanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		deleteButton.setEnabled(false);

		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "ELIMINA PARTECIPAZIONI"); //TODO

				for (int i = 0; i < participationTableData.size(); ++i) {
					if ((Boolean) participationTableData.get(i).getFirst()) {
						String message = Controller.getInstance().deletePartecipation(teamID, participationTableMap.get(1).get(i), seasonMap.get(ctrlSeason.getText()));


						System.out.println(message);
					}
				}

				try {
					AdminViewTeamDelParticipation.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewTeamDelParticipation.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamDelParticipation(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
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

					Controller.getInstance().setPartecipationYearComboBox(
									teamID,
									teamType,
									seasonVector,
									seasonMap
					);

					if (seasonVector.isEmpty()) {
						seasonVector.add(GuiConfiguration.getMessage("noData"));
					}
					showSeasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
				} else {
					showButton.setEnabled(null != seasonMap.get(ctrlSeason.getText()));
				}
			}
		});

		showButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				infoTeamMap.clear();
				participationTableData.clear();
				participationTableMap.clear();

				Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);

				Controller.getInstance().setPartecipationTableAdmin(
								teamID,
								seasonMap.get(ctrlSeason.getText()),
								participationTableData,
								participationTableMap
				);

				adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);

				string = GuiConfiguration.getMessage("participations");
				string += " ";
				string += ctrlSeason.getText();
				participationPanel.getTitleLabel().setText(string);


				participationTable.setModel(new TableModel(participationTableData, GuiConfiguration.ADMIN_TEAM_PARTICIPATING_TABLE_COLUMN_NAME, true));
				participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());

				deleteButton.setEnabled(true);
				revalidate();
			}
		});
	}
}
