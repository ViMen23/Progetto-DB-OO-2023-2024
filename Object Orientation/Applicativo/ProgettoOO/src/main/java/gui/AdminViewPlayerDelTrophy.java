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

public class AdminViewPlayerDelTrophy
				extends JPanel
{
	public AdminViewPlayerDelTrophy(String playerID)
	{
		final JLabel ctrlTeamName = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<Vector<Object>> trophyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> trophyTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		final MyTable trophyTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel showTeamPanel;
		JButton showButton;
		TablePanel trophyPanel;
		JButton deleteButton;


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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delTrophy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		showTeamPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("team").toUpperCase(),
						true,
						GuiConfiguration.THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT,
						ctrlTeamName
		);

		showButton = new JButton(GuiConfiguration.getMessage("show"));
		showButton.setCursor(GuiConfiguration.HAND_CURSOR);
		showButton.setEnabled(false);

		showTeamPanel.add(showButton);

		this.add(showTeamPanel);
		/*------------------------------------------------------------------------------------------------------*/

		trophyPanel = new TablePanel(false);

		trophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("trophies"));

		trophyTable = trophyPanel.getMyTable();
		trophyTable.setModel(new TableModel(trophyTableData, GuiConfiguration.ADMIN_PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME));
		trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());

		this.add(trophyPanel);
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

				for (int i = 0; i < trophyTableData.size(); ++i) {
					if ((Boolean) trophyTableData.get(i).getFirst()) {
//						String message = Controller.getInstance().deletePartecipation(teamID, participationTableMap.get(1).get(i), seasonMap.get(ctrlSeason.getText()));
//
//
//						System.out.println(message);
					}
				}

				try {
					AdminViewPlayerDelTrophy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelTrophy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
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

					//TODO CALL TO CONTROLLER

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					showTeamPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				} else {
					showButton.setEnabled(null != teamNameMap.get(ctrlTeamName.getText()));
				}
			}
		});

		showButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				infoPlayerMap.clear();
				trophyTableMap.clear();
				trophyTableMap.clear();

				Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

				//TODO CALL TO CONTROLLER

				adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);


				trophyTable.setModel(new TableModel(trophyTableData, GuiConfiguration.ADMIN_PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME, true));
				trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());

				deleteButton.setEnabled(true);
				revalidate();
			}
		});
	}
}
