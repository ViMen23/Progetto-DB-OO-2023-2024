package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerDelTrophy
				extends JPanel
{
	public AdminViewPlayerDelTrophy(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<Object>> trophyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> trophyTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		//TODO CALL TO CONTROLLER

		final MyTable trophyTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
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

		trophyPanel = new TablePanel(false);

		trophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("trophies"));

		trophyTable = trophyPanel.getMyTable();
		trophyTable.setModel(new TableModel(trophyTableData, GuiConfiguration.ADMIN_PLAYER_TROPHY_TABLE_COLUMN_NAME));
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
				JOptionPane.showConfirmDialog(null, "ELIMINA TROFEI"); //TODO

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
	}
}
