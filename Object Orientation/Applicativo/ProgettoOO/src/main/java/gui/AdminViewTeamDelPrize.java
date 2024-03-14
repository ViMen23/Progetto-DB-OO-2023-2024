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

public class AdminViewTeamDelPrize
				extends JPanel
{
	public AdminViewTeamDelPrize(String teamID, String teamType)
	{
		final Map<String, String> infoTeamMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> prizeTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> prizeTableMap = new HashMap<>();


		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);

		Controller.getInstance().setTeamPrizeTableAdmin(
						teamID,
						prizeTableData,
						prizeTableMap
		);

		final MyTable prizeTable;

		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		TablePanel prizePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delPrize"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		prizePanel = new TablePanel(false);

		prizePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));

		prizeTable = prizePanel.getMyTable();
		prizeTable.setModel(new TableModel(prizeTableData, GuiConfiguration.ADMIN_TEAM_PRIZE_TABLE_COLUMN_NAME, true));
		prizeTable.setPreferredScrollableViewportSize(prizeTable.getPreferredSize());

		this.add(prizePanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "ELIMINA PREMI"); //TODO

				for (int i = 0; i < prizeTableData.size(); ++i) {
					if ((Boolean) prizeTableData.get(i).getFirst()) {
						String message = Controller.getInstance().removePrizeTeam(
										teamID,
										prizeTableMap.get(2).get(i),
										prizeTableMap.get(1).get(i)
						);

						System.out.println(message);
					}
				}

				try {
					AdminViewTeamDelPrize.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewTeamDelPrize.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewTeamDelPrize(teamID, teamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}

			}
		});

	}
}
