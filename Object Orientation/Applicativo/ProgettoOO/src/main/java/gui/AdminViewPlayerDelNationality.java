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

public class AdminViewPlayerDelNationality
				extends JPanel
{
	public AdminViewPlayerDelNationality(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> nationalityTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> nationalityTableMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		Controller.getInstance().setNationalityTable(
						playerID,
						nationalityTableData,
						nationalityTableMap
		);


		final MyTable nationalityTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		TablePanel nationalityTablePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delNationality"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		nationalityTablePanel = new TablePanel(false);

		nationalityTablePanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalities"));

		nationalityTable = nationalityTablePanel.getMyTable();
		nationalityTable.setModel(new TableModel(nationalityTableData, GuiConfiguration.ADMIN_PLAYER_NATIONALITY_TABLE_COLUMN_NAME, true));
		nationalityTable.setPreferredScrollableViewportSize(nationalityTable.getPreferredSize());

		this.add(nationalityTablePanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "ELIMINA NAZIONALITA"); //TODO

				for (int i = 0; i < nationalityTableData.size(); ++i) {
					if ((Boolean) nationalityTableData.get(i).getFirst()) {
						String message = Controller.getInstance().removeNationality(
										playerID,
										nationalityTableMap.get(1).get(i)
						);

						System.out.println(message);
					}
				}

				try {
					AdminViewPlayerDelNationality.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelNationality.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelNationality(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
