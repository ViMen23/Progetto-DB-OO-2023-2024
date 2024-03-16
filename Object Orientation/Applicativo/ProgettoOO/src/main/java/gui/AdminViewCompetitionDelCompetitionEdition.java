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

public class AdminViewCompetitionDelCompetitionEdition
				extends JPanel
{

	public AdminViewCompetitionDelCompetitionEdition(String competitionID, String competitionTeamType)
	{
		final Map<String, String> infoCompetitionMap = new LinkedHashMap<>();


		final Vector<Vector<Object>> competitionEditionTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> competitionEditionTableMap = new HashMap<>();


		Controller.getInstance().setCompetitionInfoMap(competitionID, infoCompetitionMap);

		Controller.getInstance().setCompetitionTableAdmin(
						competitionID,
						competitionTeamType,
						competitionEditionTableData,
						competitionEditionTableMap
		);

		final MyTable competitionTable;

		MigLayout migLayout;
		AdminTopViewCompetition adminTopViewCompetition;
		TitleLabel titleLabel;
		TablePanel competitionEditionPanel;
		JButton deleteButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewCompetition = new AdminTopViewCompetition(competitionID, competitionTeamType, this);

		this.add(adminTopViewCompetition);
		adminTopViewCompetition.setGeneralInfoPanel(infoCompetitionMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("delCompetitionEdition"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		competitionEditionPanel = new TablePanel(false);

		competitionEditionPanel.getTitleLabel().setText(GuiConfiguration.getMessage("competitionEditions"));

		competitionTable = competitionEditionPanel.getMyTable();
		competitionTable.setModel(
						new TableModel(
										competitionEditionTableData,
										GuiConfiguration.ADMIN_COMPETITION_EDITION_TABLE_COLUM_NAME,
										true
						)
		);
		competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());

		this.add(competitionEditionPanel);
		/*------------------------------------------------------------------------------------------------------*/

		deleteButton = new JButton(GuiConfiguration.getMessage("delAllSelected"));
		deleteButton.setCursor(GuiConfiguration.HAND_CURSOR);
		deleteButton.setEnabled(!competitionEditionTableData.isEmpty());
		this.add(deleteButton);

		deleteButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				int chosenOption;

				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgDeleteSelected"),
								GuiConfiguration.getMessage("delCompetitionEdition"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message;

					for (int i = 0; i < competitionEditionTableData.size(); ++i) {
						if ((Boolean) competitionEditionTableData.get(i).getFirst()) {
							message = Controller.getInstance().deleteCompetitionEdition(
											competitionID,
											competitionEditionTableMap.get(1).get(i)
							);

							JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
						}
					}
				}

				try {
					AdminViewCompetitionDelCompetitionEdition.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewCompetitionDelCompetitionEdition.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewCompetitionDelCompetitionEdition(competitionID, competitionTeamType)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}

			}
		});

	}
}
