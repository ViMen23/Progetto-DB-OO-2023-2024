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

/**
 * Classe che rappresenta la vista per l'eliminazione di una militanza in una squadra di club per un giocatore.
 */
public class AdminViewPlayerDelClubMilitancy
				extends JPanel
{

	public AdminViewPlayerDelClubMilitancy(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<Object>> militancyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> militancyTableMap = new HashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		Controller.getInstance().setClubCareerAdmin(
						playerID,
						militancyTableData,
						militancyTableMap
		);

		final MyTable militancyTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		TablePanel militancyTablePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delClubMilitancy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		militancyTablePanel = new TablePanel(false);

		militancyTablePanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubCareer"));

		militancyTable = militancyTablePanel.getMyTable();
		militancyTable.setModel(new TableModel(militancyTableData, GuiConfiguration.ADMIN_PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME, true));
		militancyTable.setPreferredScrollableViewportSize(militancyTable.getPreferredSize());

		this.add(militancyTablePanel);
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
								GuiConfiguration.getMessage("delClubMilitancy"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message;

					for (int i = 0; i < militancyTableData.size(); ++i) {
						if ((Boolean) militancyTableData.get(i).getFirst()) {
							message = Controller.getInstance().deleteMilitancy(
											playerID,
											militancyTableMap.get(3).get(i),
											militancyTableMap.get(1).get(i)
							);

							JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
						}
					}
				}

				try {
					AdminViewPlayerDelClubMilitancy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelClubMilitancy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelClubMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
