package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class ViewPlayerDetailedInfo
				extends JPanel
{
	public ViewPlayerDetailedInfo(String playerID)
	{
		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<Vector<String>> goalkeepingAttributeTableData = new Vector<>();
		final Vector<Vector<String>> mentalAttributeTableData = new Vector<>();
		final Vector<Vector<String>> physicalAttributeTableData = new Vector<>();
		final Vector<Vector<String>> technicalAttributeTableData = new Vector<>();
		final Vector<Vector<String>> tagTableData = new Vector<>();

		Controller.getInstance().setPlayerDetailedView(
						playerID,
						infoPlayerMap,
						goalkeepingAttributeTableData,
						mentalAttributeTableData,
						physicalAttributeTableData,
						technicalAttributeTableData,
						tagTableData
		);

		System.out.println(goalkeepingAttributeTableData);
		System.out.println(mentalAttributeTableData);

		final MyTable goalkeepingTable;
		final MyTable mentalTable;
		final MyTable physicalTable;
		final MyTable technicalTable;
		final MyTable tagTable;

		MigLayout migLayout;
		TopViewPlayerPanel topViewPlayerPanel;
		JPanel tablePanel;
		TablePanel goalkeepingAttributePanel;
		TablePanel mentalAttributePanel;
		TablePanel physicalAttributePanel;
		TablePanel technicalAttributePanel;
		TablePanel tagPanel;

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

		goalkeepingAttributePanel = new TablePanel(false);
		goalkeepingAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("goalkeepingAttributes"));

		goalkeepingTable = goalkeepingAttributePanel.getMyTable();
		goalkeepingTable.setModel(new TableModel(goalkeepingAttributeTableData, GuiConfiguration.PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME));
		goalkeepingTable.setPreferredScrollableViewportSize(goalkeepingTable.getPreferredSize());

		tablePanel.add(goalkeepingAttributePanel);

		mentalAttributePanel = new TablePanel(false);
		mentalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("mentalAttributes"));

		mentalTable = mentalAttributePanel.getMyTable();
		mentalTable.setModel(new TableModel(mentalAttributeTableData, GuiConfiguration.PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME));
		mentalTable.setPreferredScrollableViewportSize(mentalTable.getPreferredSize());

		tablePanel.add(mentalAttributePanel);

		physicalAttributePanel = new TablePanel(false);
		physicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("physicalAttributes"));

		physicalTable = physicalAttributePanel.getMyTable();
		physicalTable.setModel(new TableModel(physicalAttributeTableData, GuiConfiguration.PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME));
		physicalTable.setPreferredScrollableViewportSize(physicalTable.getPreferredSize());

		tablePanel.add(physicalAttributePanel);

		technicalAttributePanel = new TablePanel(false);
		technicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("technicalAttributes"));

		technicalTable = technicalAttributePanel.getMyTable();
		technicalTable.setModel(new TableModel(technicalAttributeTableData, GuiConfiguration.PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME));
		technicalTable.setPreferredScrollableViewportSize(technicalTable.getPreferredSize());

		tablePanel.add(technicalAttributePanel);

		tagPanel = new TablePanel(false);
		tagPanel.getTitleLabel().setText(GuiConfiguration.getMessage("tag"));

		tagTable = tagPanel.getMyTable();
		tagTable.setModel(new TableModel(tagTableData, GuiConfiguration.PLAYER_TAG_TABLE_COLUMN_NAME));
		tagTable.setPreferredScrollableViewportSize(tagTable.getPreferredSize());

		tablePanel.add(tagPanel);
		/*------------------------------------------------------------------------------------------------------*/

	}

}
