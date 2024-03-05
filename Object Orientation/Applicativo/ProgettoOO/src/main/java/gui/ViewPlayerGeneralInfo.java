package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerGeneralInfo
				extends JPanel
{
	public ViewPlayerGeneralInfo(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<String>> positionTableData = new Vector<>();
		final Vector<Vector<String>> nationalityTableData = new Vector<>();

		Controller.getInstance().setPlayerGeneralView(
						playerID,
						infoPlayerMap,
						positionTableData,
						nationalityTableData
		);

		final MyTable positionTable;
		final MyTable nationalityTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
		JPanel tablePanel;
		TablePanel positionPanel;
		TablePanel nationalityPanel;

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

		positionPanel = new TablePanel(false);
		positionPanel.getTitleLabel().setText(GuiConfiguration.getMessage("positions"));

		positionTable = positionPanel.getMyTable();
		positionTable.setModel(new TableModel(positionTableData, GuiConfiguration.PLAYER_POSITION_TABLE_COLUMN_NAME));
		positionTable.setPreferredScrollableViewportSize(positionTable.getPreferredSize());

		tablePanel.add(positionPanel);

		nationalityPanel = new TablePanel(false);
		nationalityPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalities"));

		nationalityTable = nationalityPanel.getMyTable();
		nationalityTable.setModel(new TableModel(nationalityTableData, GuiConfiguration.PLAYER_NATIONALITY_TABLE_COLUMN_NAME));
		nationalityTable.setPreferredScrollableViewportSize(nationalityTable.getPreferredSize());

		tablePanel.add(nationalityPanel);
		/*------------------------------------------------------------------------------------------------------*/

	}

}
