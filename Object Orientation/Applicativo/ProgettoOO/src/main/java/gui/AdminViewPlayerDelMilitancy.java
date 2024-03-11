package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerDelMilitancy
				extends JPanel
{
	public AdminViewPlayerDelMilitancy(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<Object>> militancyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> militancyTableMap = new HashMap<>();


		//TODO MOSTREREMO O NO UN FILTRO PER FAR VEDERE SOLO MILTANZE CLUB O NAZIONALI E DI UNA DETERMINATA SQUADRA?
		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

//		Controller.getInstance().setPlayerPositionTable(
//						playerID,
//						playerPositionTableData,
//						playerPositionTableMap
//		);
		//TODO

		final MyTable militancyTable;

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		TablePanel militancyTablePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delMilitancy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		militancyTablePanel = new TablePanel(false);

		militancyTablePanel.getTitleLabel().setText(GuiConfiguration.getMessage("career"));

		militancyTable = militancyTablePanel.getMyTable();
		militancyTable.setModel(new TableModel(militancyTableData, GuiConfiguration.PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME, true));
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
				JOptionPane.showConfirmDialog(null, "ELIMINA TROFEI"); //TODO

				for (int i = 0; i < militancyTableData.size(); ++i) {
					if ((Boolean) militancyTableData.get(i).getFirst()) {
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
					AdminViewPlayerDelMilitancy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerDelMilitancy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerDelMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

	}
}
