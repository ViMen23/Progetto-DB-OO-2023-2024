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

public class AdminViewPlayerDelPrize
				extends JPanel
{
	public AdminViewPlayerDelPrize(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> prizeTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> prizeTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

//		Controller.getInstance().setPlayerPositionTable(
//						playerID,
//						playerPositionTableData,
//						playerPositionTableMap
//		);
		//TODO

		final MyTable prizeTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		TablePanel prizeTablePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delPrize"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		prizeTablePanel = new TablePanel(false);

		prizeTablePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));

		prizeTable = prizeTablePanel.getMyTable();
		prizeTable.setModel(new TableModel(prizeTableData, GuiConfiguration.ADMIN_PLAYER_PRIZE_TABLE_COLUMN_NAME, true));
		prizeTable.setPreferredScrollableViewportSize(prizeTable.getPreferredSize());

		this.add(prizeTablePanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "ELIMINA TROFEI"); //TODO

				for (int i = 0; i < prizeTableData.size(); ++i) {
					if ((Boolean) prizeTableData.get(i).getFirst()) {
//						String message = Controller.getInstance().remove(
//										teamID,
//										trophyTableMap.get(3).get(i),
//										trophyTableMap.get(2).get(i),
//										trophyTableMap.get(1).get(i)
//						);
//
//						System.out.println(message);
						//TODO
					}
				}

				try {
					AdminViewPlayerDelPrize.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelPrize.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelPrize(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
