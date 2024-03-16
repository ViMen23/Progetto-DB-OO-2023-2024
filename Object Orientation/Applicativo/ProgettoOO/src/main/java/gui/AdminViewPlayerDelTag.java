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

public class AdminViewPlayerDelTag
				extends JPanel
{
	public AdminViewPlayerDelTag(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> playerTagTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerTagTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		Controller.getInstance().setTagTable(
						playerID,
						playerTagTableData,
						playerTagTableMap
		);

		final MyTable playerTagTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		TablePanel playerTagTablePanel;
		JButton deleteButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);

		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delPlayerTag"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		playerTagTablePanel = new TablePanel(false);

		playerTagTablePanel.getTitleLabel().setText(GuiConfiguration.getMessage("tag").toUpperCase());

		playerTagTable = playerTagTablePanel.getMyTable();
		playerTagTable.setModel(new TableModel(playerTagTableData, GuiConfiguration.ADMIN_PLAYER_TAG_TABLE_COLUMN_NAME, true));
		playerTagTable.setPreferredScrollableViewportSize(playerTagTable.getPreferredSize());

		this.add(playerTagTablePanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				int chosenOption;

				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgDeleteSelected"),
								GuiConfiguration.getMessage("delPlayerTag"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message;

					for (int i = 0; i < playerTagTableData.size(); ++i) {
						if ((Boolean) playerTagTableData.get(i).getFirst()) {
							message = Controller.getInstance().removePlayerTag(
											playerID,
											playerTagTableMap.get(1).get(i)
							);

							JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
						}
					}
				}

				try {
					AdminViewPlayerDelTag.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelTag.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelTag(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
