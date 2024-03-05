package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerCareer
				extends JPanel
{
	public ViewPlayerCareer(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<String>> clubCareerTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> clubCareerTableMap = new HashMap<>();
		final Vector<Vector<String>> nationalCareerTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> nationalCareerTableMap = new HashMap<>();

		final Integer[] clubTableIndex = {-1, -1};
		final JLabel ctrlClubMouseTable = new JLabel((String) null);

		final Integer[] nationalTableIndex = {-1, -1};
		final JLabel ctrlNationalMouseTable = new JLabel((String) null);

		Controller.getInstance().setPlayerCareerView(
						playerID,
						infoPlayerMap,
						clubCareerTableData,
						clubCareerTableMap,
						nationalCareerTableData,
						nationalCareerTableMap
		);

		System.out.println(clubCareerTableData);
		System.out.println(nationalCareerTableData);


		final MyTable clubCareerTable;
		final MyTable nationalCareerTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
		JPanel tablePanel;
		TablePanel clubCareerPanel;
		TablePanel nationalCareerPanel;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		topViewPlayerPanel = new TopViewPlayerPanel(playerID);
		this.add(topViewPlayerPanel);
		topViewPlayerPanel.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_GROW_FILL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_TOP_GAP_10_0_LAYOUT_CONSTRAINT
		);

		tablePanel = new JPanel(migLayout);
		tablePanel.setOpaque(false);

		this.add(tablePanel);

		clubCareerPanel = new TablePanel(false, clubTableIndex, ctrlClubMouseTable);
		clubCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubCareer"));

		clubCareerTable = clubCareerPanel.getMyTable();
		clubCareerTable.setModel(new TableModel(clubCareerTableData, GuiConfiguration.PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME));
		clubCareerTable.setPreferredScrollableViewportSize(clubCareerTable.getPreferredSize());

		tablePanel.add(clubCareerPanel);

		nationalCareerPanel = new TablePanel(false, nationalTableIndex, ctrlNationalMouseTable);
		nationalCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalCareer"));

		nationalCareerTable = nationalCareerPanel.getMyTable();
		nationalCareerTable.setModel(new TableModel(nationalCareerTableData, GuiConfiguration.PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME));
		nationalCareerTable.setPreferredScrollableViewportSize(nationalCareerTable.getPreferredSize());

		tablePanel.add(nationalCareerPanel);
		/*------------------------------------------------------------------------------------------------------*/


		ctrlClubMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				//TODO
			}
		});

		ctrlNationalMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				//TODO
			}
		});
	}

}
