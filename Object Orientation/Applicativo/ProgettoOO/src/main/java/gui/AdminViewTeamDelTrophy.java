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

public class AdminViewTeamDelTrophy
				extends JPanel
{
	public AdminViewTeamDelTrophy(String teamID, String teamType)
	{
		final Map<String, String> infoTeamMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> trophyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> trophyTableMap = new HashMap<>();


		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);

		Controller.getInstance().setTeamTrophyTableAdmin(
						teamID,
						teamType,
						trophyTableData,
						trophyTableMap
		);

		final MyTable trophyTable;

		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		TablePanel trophyPanel;
		JButton deleteButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.FIVE_CELL_EXT_GAP_10_0_INT_GAP_10_0_0_10_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewTeam = new AdminTopViewTeam(teamID, teamType, this);

		this.add(adminTopViewTeam);
		adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delTrophy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		trophyPanel = new TablePanel(false);

		trophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("trophies"));

		trophyTable = trophyPanel.getMyTable();
		trophyTable.setModel(new TableModel(trophyTableData, GuiConfiguration.ADMIN_TEAM_TROPHY_TABLE_COLUMN_NAME, true));
		trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());

		this.add(trophyPanel);
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
						String message = Controller.getInstance().removeTrophyTeam(
										teamID,
										trophyTableMap.get(3).get(i),
										trophyTableMap.get(2).get(i),
										trophyTableMap.get(1).get(i)
						);

						System.out.println(message);
					}
				}

				try {
					AdminViewTeamDelTrophy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewTeamDelTrophy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamDelTrophy(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
