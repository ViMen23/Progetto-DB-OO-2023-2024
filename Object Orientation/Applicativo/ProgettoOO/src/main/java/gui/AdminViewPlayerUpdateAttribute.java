package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerUpdateAttribute
				extends JPanel
{
	public AdminViewPlayerUpdateAttribute(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<String>> goalkeepingAttributeTableData = new Vector<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		Controller.getInstance().setAttributeGoalkeepingTable(playerID, goalkeepingAttributeTableData);

		final MyTable goalkeepingTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
		JPanel tablePanel;
		TablePanel goalkeepingAttributePanel;

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		topViewPlayerPanel = new TopViewPlayerPanel(playerID, this);
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

		goalkeepingAttributePanel = new TablePanel(false);
		goalkeepingAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("goalkeepingAttributes"));

		goalkeepingTable = goalkeepingAttributePanel.getMyTable();
		goalkeepingTable.setModel(new DefaultTableModel(goalkeepingAttributeTableData, GuiConfiguration.PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME));
		goalkeepingTable.setPreferredScrollableViewportSize(goalkeepingTable.getPreferredSize());

		JComboBox<Integer> comboBox = new JComboBox<>();

		for(int i = 0; i < 1000; ++i) {
			comboBox.addItem(i);
		}

		goalkeepingTable.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(comboBox));

		tablePanel.add(goalkeepingAttributePanel);
		/*------------------------------------------------------------------------------------------------------*/

	}
}
