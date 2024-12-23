package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

/**
 * Pannello che presenta i trofei e premi di un giocatore.
 */
public class ViewPlayerCase
				extends JPanel
{
	public ViewPlayerCase(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<String>> clubTrophyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> clubTrophyTableMap = new HashMap<>();

		final Vector<Vector<String>> nationalTrophyTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> nationalTrophyTableMap = new HashMap<>();

		final Vector<Vector<String>> prizeTableData = new Vector<>();

		final Integer[] clubTableIndex = {-1, -1};
		final JLabel ctrlClubMouseTable = new JLabel((String) null);

		final Integer[] nationalTableIndex = {-1, -1};
		final JLabel ctrlNationalMouseTable = new JLabel((String) null);


		Controller.getInstance().setPlayerCaseView(
						playerID,
						infoPlayerMap,
						clubTrophyTableData,
						clubTrophyTableMap,
						nationalTrophyTableData,
						nationalTrophyTableMap,
						prizeTableData
		);

		final MyTable clubTrophyTable;
		final MyTable nationalTrophyTable;
		final MyTable prizeTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
		JPanel tablePanel;
		TablePanel clubTrophyPanel;
		TablePanel nationalTrophyPanel;
		TablePanel prizePanel;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		topViewPlayerPanel = new TopViewPlayerPanel(playerID, this);
		this.add(topViewPlayerPanel);
		topViewPlayerPanel.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						null,
						GuiConfiguration.TWO_CELL_GROW_FILL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_TOP_GAP_10_0_LAYOUT_CONSTRAINT
		);

		tablePanel = new JPanel(migLayout);
		tablePanel.setOpaque(false);

		this.add(tablePanel);

		clubTrophyPanel = new TablePanel(false, clubTableIndex, ctrlClubMouseTable);
		clubTrophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubTrophies"));

		clubTrophyTable = clubTrophyPanel.getMyTable();
		clubTrophyTable.setModel(new TableModel(clubTrophyTableData, GuiConfiguration.PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME));
		clubTrophyTable.setPreferredScrollableViewportSize(clubTrophyTable.getPreferredSize());

		clubTrophyTable.getColumnModel().getColumn(2).setCellRenderer(new TableRenderer());

		tablePanel.add(clubTrophyPanel);

		nationalTrophyPanel = new TablePanel(false, nationalTableIndex, ctrlNationalMouseTable);
		nationalTrophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalTrophies"));

		nationalTrophyTable = nationalTrophyPanel.getMyTable();
		nationalTrophyTable.setModel(new TableModel(nationalTrophyTableData, GuiConfiguration.PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME));
		nationalTrophyTable.setPreferredScrollableViewportSize(nationalTrophyTable.getPreferredSize());

		nationalTrophyTable.getColumnModel().getColumn(2).setCellRenderer(new TableRenderer());

		tablePanel.add(nationalTrophyPanel);

		prizePanel = new TablePanel(false);
		prizePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));

		prizeTable = prizePanel.getMyTable();
		prizeTable.setModel(new TableModel(prizeTableData, GuiConfiguration.PLAYER_PRIZE_TABLE_COLUMN_NAME));
		prizeTable.setPreferredScrollableViewportSize(prizeTable.getPreferredSize());

		tablePanel.add(prizePanel);
		/*------------------------------------------------------------------------------------------------------*/

		ctrlClubMouseTable.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlClubMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String teamID;

						teamID = clubTrophyTableMap.get(clubTableIndex[1]).get(clubTableIndex[0]);

						ViewPlayerCase.this.getParent().setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(ViewPlayerCase.this.getParent());

						MainFrame.getMainFrameInstance().getContentPane().add(
										new MenuBarPanel(new ViewTeamSeasonPanel(teamID, Team.TEAM_TYPE.CLUB.toString())),
										GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
						);

					} catch (Exception ignored) {
					} finally {
						ctrlClubMouseTable.setText("@null");
					}
				}
			}
		});

		ctrlNationalMouseTable.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlNationalMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String teamID;

						teamID = nationalTrophyTableMap.get(nationalTableIndex[1]).get(nationalTableIndex[0]);

						ViewPlayerCase.this.getParent().setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(ViewPlayerCase.this.getParent());

						MainFrame.getMainFrameInstance().getContentPane().add(
										new MenuBarPanel(new ViewTeamSeasonPanel(teamID, Team.TEAM_TYPE.NATIONAL.toString())),
										GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
						);
					} catch (Exception ignored) {
					} finally {
						ctrlNationalMouseTable.setText("@null");
					}
				}
			}
		});
	}

}
