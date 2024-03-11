package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerDelClubTrophy
				extends JPanel
{
	public AdminViewPlayerDelClubTrophy(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> trophyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> trophyTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		Controller.getInstance().setPlayerTrophyTableAdmin(
						playerID,
						Team.TEAM_TYPE.CLUB.toString(),
						trophyTableData,
						trophyTableMap
		);

		final MyTable trophyTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		TablePanel trophyTablePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delClubTrophy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		trophyTablePanel = new TablePanel(false);

		trophyTablePanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubTrophies"));

		trophyTable = trophyTablePanel.getMyTable();
		trophyTable.setModel(new TableModel(trophyTableData, GuiConfiguration.ADMIN_PLAYER_TROPHY_TABLE_COLUMN_NAME, true));
		trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());

		this.add(trophyTablePanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "ELIMINA TROFEI"); //TODO

				for (int i = 0; i < trophyTableData.size(); ++i) {
					if ((Boolean) trophyTableData.get(i).getFirst()) {
						String message = Controller.getInstance().removeTrophyPlayer(
										playerID,
										trophyTableMap.get(3).get(i),
										trophyTableMap.get(4).get(i),
										trophyTableMap.get(2).get(i),
										trophyTableMap.get(1).get(i)
						);

						System.out.println(message);
					}
				}

				try {
					AdminViewPlayerDelClubTrophy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelClubTrophy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelClubTrophy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
