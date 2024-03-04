//package gui;
//
//import controller.Controller;
//import net.miginfocom.swing.MigLayout;
//
//import javax.swing.*;
//import javax.swing.table.DefaultTableModel;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.util.HashMap;
//import java.util.LinkedHashMap;
//import java.util.Vector;
//import java.util.Map;
//
//public class ViewPlayerPanel
//				extends JPanel
//{
//	public ViewPlayerPanel(String playerID)
//	{
//		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();
//
//		final Vector<Vector<String>> positionTableData = new Vector<>();
//		final Vector<Vector<String>> nationalityTableData = new Vector<>();
//
//		final Vector<Vector<String>> goalkeepingAttributeTableData = new Vector<>();
//		final Vector<Vector<String>> mentalAttributeTableData = new Vector<>();
//		final Vector<Vector<String>> physicalAttributeTableData = new Vector<>();
//		final Vector<Vector<String>> technicalAttributeTableData = new Vector<>();
//		final Vector<Vector<String>> tagTableData = new Vector<>();
//
//		final Vector<Vector<String>> clubCareerTableData = new Vector<>();
//		final Map<Integer, Map<Integer, String>> clubCareerTableMap = new HashMap<>();
//		final Vector<Vector<String>> nationalCareerTableData = new Vector<>();
//		final Map<Integer, Map<Integer, String>> nationalCareerTableMap = new HashMap<>();
//
//		MigLayout migLayout;
//		GeneralInfoPanel generalInfoPanel;
//		JPanel navigationPanel;
//		JButton generalInfoButton;
//		JButton detailedInfoButton;
//		JButton careerButton;
//		JButton clubStatisticsButton;
//		JButton nationalStatisticsButton;
//		JButton caseButton;
//		JPanel generalInfoTablePanel;
//		TablePanel positionPanel;
//		TablePanel nationalityPanel;
//		JPanel detailedInfoTablePanel;
//		TablePanel goalkeepingAttributePanel;
//		TablePanel mentalAttributePanel;
//		TablePanel physicalAttributePanel;
//		TablePanel technicalAttributePanel;
//		TablePanel tagPanel;
//		JPanel careerTablePanel;
//		TablePanel clubCareerPanel;
//		TablePanel nationalCareerPanel;
//		StatisticFilterPanel clubStatisticsPanel;
//		StatisticFilterPanel nationalStatisticsPanel;
//		JPanel caseAwardsPanel;
//		TablePanel clubTrophyPanel;
//		TablePanel nationalTrophyPanel;
//		TablePanel prizePanel;
//
//
//
//
//		migLayout = new MigLayout(
//						GuiConfiguration.VLAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.ONE_CELL_GAP_0_10
//		);
//
//		this.setLayout(migLayout);
//
//
//		generalInfoPanel = new GeneralInfoPanel();
//		this.add(generalInfoPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
//						null
//		);
//
//		navigationPanel = new JPanel(migLayout);
//		navigationPanel.setBackground(Color.white);
//		this.add(navigationPanel);
//
//		generalInfoButton = new JButton(GuiConfiguration.getMessage("general"));
//		generalInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);
//		navigationPanel.add(generalInfoButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//
//		detailedInfoButton = new JButton(GuiConfiguration.getMessage("detailed"));
//		detailedInfoButton.setCursor(GuiConfiguration.HAND_CURSOR);
//		navigationPanel.add(detailedInfoButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//
//		careerButton = new JButton(GuiConfiguration.getMessage("career"));
//		careerButton.setCursor(GuiConfiguration.HAND_CURSOR);
//		navigationPanel.add(careerButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//
//		clubStatisticsButton = new JButton(GuiConfiguration.getMessage("clubStatistics"));
//		clubStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);
//		navigationPanel.add(clubStatisticsButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//
//		nationalStatisticsButton = new JButton(GuiConfiguration.getMessage("nationalStatistics"));
//		nationalStatisticsButton.setCursor(GuiConfiguration.HAND_CURSOR);
//		navigationPanel.add(nationalStatisticsButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//
//		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
//		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);
//		navigationPanel.add(caseButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
//		);
//
//		generalInfoTablePanel = new JPanel(migLayout);
//		generalInfoTablePanel.setOpaque(false);
//
//		this.add(generalInfoTablePanel);
//
//		positionPanel = new TablePanel(false);
//		positionPanel.getTitleLabel().setText(GuiConfiguration.getMessage("positions"));
//		generalInfoTablePanel.add(positionPanel);
//
//		nationalityPanel = new TablePanel(false);
//		nationalityPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalities"));
//		generalInfoTablePanel.add(nationalityPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
//		);
//
//		detailedInfoTablePanel = new JPanel(migLayout);
//		detailedInfoTablePanel.setOpaque(false);
//
//
//		goalkeepingAttributePanel = new TablePanel(false);
//		goalkeepingAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("goalkeepingAttributes"));
//		detailedInfoTablePanel.add(goalkeepingAttributePanel);
//
//		mentalAttributePanel = new TablePanel(false);
//		mentalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("mentalAttributes"));
//		detailedInfoTablePanel.add(mentalAttributePanel);
//
//		physicalAttributePanel = new TablePanel(false);
//		physicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("physicalAttributes"));
//		detailedInfoTablePanel.add(physicalAttributePanel);
//
//		technicalAttributePanel = new TablePanel(false);
//		technicalAttributePanel.getTitleLabel().setText(GuiConfiguration.getMessage("technicalAttributes"));
//		detailedInfoTablePanel.add(technicalAttributePanel);
//
//		tagPanel = new TablePanel(false);
//		tagPanel.getTitleLabel().setText(GuiConfiguration.getMessage("tag"));
//		detailedInfoTablePanel.add(tagPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
//		);
//
//		careerTablePanel = new JPanel(migLayout);
//		careerTablePanel.setOpaque(false);
//
//		clubCareerPanel = new TablePanel(false);
//		clubCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubCareer"));
//		careerTablePanel.add(clubCareerPanel);
//
//		nationalCareerPanel = new TablePanel(false);
//		nationalCareerPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalCareer"));
//		careerTablePanel.add(nationalCareerPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//		clubStatisticsPanel = new StatisticFilterPanel(playerID, true, GuiConfiguration.getMessage("filterClubStatistics"));
//
//		nationalStatisticsPanel = new StatisticFilterPanel(playerID, false, GuiConfiguration.getMessage("filterNationalStatistics"));
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
//		);
//
//		caseAwardsPanel = new JPanel(migLayout);
//		caseAwardsPanel.setOpaque(false);
//
//		clubTrophyPanel = new TablePanel(false);
//		clubTrophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("clubTrophies"));
//		caseAwardsPanel.add(clubTrophyPanel);
//
//		nationalTrophyPanel = new TablePanel(false);
//		nationalTrophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("nationalTrophies"));
//		caseAwardsPanel.add(nationalTrophyPanel);
//
//		prizePanel = new TablePanel(false);
//		prizePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));
//		caseAwardsPanel.add(prizePanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		generalInfoButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				MyTable positionTable = positionPanel.getMyTable();
//				MyTable nationalityTable = nationalityPanel.getMyTable();
//
//				infoPlayerMap.clear();
//				positionTableData.clear();
//				nationalityTableData.clear();
//
//				Controller.getInstance().setPlayerGeneralView(
//								playerID,
//								infoPlayerMap,
//								positionTableData,
//								nationalityTableData
//				);
//
//				generalInfoPanel.createGeneralInfoPanel(infoPlayerMap, "playerInformation");
//
//				positionTable.setModel(new TableModel(positionTableData, GuiConfiguration.PLAYER_POSITION_TABLE_COLUMN_NAME));
//				positionTable.setPreferredScrollableViewportSize(positionTable.getPreferredSize());
//
//				nationalityTable.setModel(new TableModel(nationalityTableData, GuiConfiguration.PLAYER_NATIONALITY_TABLE_COLUMN_NAME));
//				nationalityTable.setPreferredScrollableViewportSize(nationalityTable.getPreferredSize());
//
//				Component component = ViewPlayerPanel.this.getComponent(2);
//				ViewPlayerPanel.this.remove(component);
//				ViewPlayerPanel.this.add(generalInfoTablePanel);
//				component.setVisible(false);
//				generalInfoTablePanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//		detailedInfoButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				MyTable goalkeepingAttributeTable = goalkeepingAttributePanel.getMyTable();
//				MyTable mentalAttributeTable = mentalAttributePanel.getMyTable();
//				MyTable physicalAttributeTable = physicalAttributePanel.getMyTable();
//				MyTable technicalAttributeTable = technicalAttributePanel.getMyTable();
//				MyTable tagTable = tagPanel.getMyTable();
//
//				infoPlayerMap.clear();
//				goalkeepingAttributeTableData.clear();
//				mentalAttributeTableData.clear();
//				physicalAttributeTableData.clear();
//				technicalAttributeTableData.clear();
//				tagTableData.clear();
//
//				Controller.getInstance().setPlayerDetailedView(
//								playerID,
//								infoPlayerMap,
//								goalkeepingAttributeTableData,
//								mentalAttributeTableData,
//								physicalAttributeTableData,
//								technicalAttributeTableData,
//								tagTableData
//				);
//
//				generalInfoPanel.createGeneralInfoPanel(infoPlayerMap, "playerInformation");
//
//				goalkeepingAttributeTable.setModel(new TableModel(
//								goalkeepingAttributeTableData,
//								GuiConfiguration.PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME
//				));
//				goalkeepingAttributeTable.setPreferredScrollableViewportSize(goalkeepingAttributeTable.getPreferredSize());
//
//				mentalAttributeTable.setModel(new TableModel(
//								mentalAttributeTableData,
//								GuiConfiguration.PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME
//				));
//				mentalAttributeTable.setPreferredScrollableViewportSize(mentalAttributeTable.getPreferredSize());
//
//				physicalAttributeTable.setModel(new TableModel(
//								physicalAttributeTableData,
//								GuiConfiguration.PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME
//				));
//				physicalAttributeTable.setPreferredScrollableViewportSize(physicalAttributeTable.getPreferredSize());
//
//				technicalAttributeTable.setModel(new TableModel(
//								technicalAttributeTableData,
//								GuiConfiguration.PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME
//				));
//				technicalAttributeTable.setPreferredScrollableViewportSize(technicalAttributeTable.getPreferredSize());
//
//				tagTable.setModel(new TableModel(tagTableData, GuiConfiguration.PLAYER_TAG_TABLE_COLUMN_NAME));
//
//				Component component = ViewPlayerPanel.this.getComponent(2);
//				ViewPlayerPanel.this.remove(component);
//				ViewPlayerPanel.this.add(detailedInfoTablePanel);
//				component.setVisible(false);
//				detailedInfoTablePanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//		careerButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				MyTable clubCareerTable = clubCareerPanel.getMyTable();
//				MyTable nationalCareerTable = nationalCareerPanel.getMyTable();
//
//				infoPlayerMap.clear();
//				clubCareerTableData.clear();
//				clubCareerTableMap.clear();
//				nationalCareerTableData.clear();
//				nationalCareerTableMap.clear();
//
////				Controller.getInstance().setPlayerCareerView(
////								playerID,
////								infoPlayerMap,
////								clubCareerTableData,
////								clubCareerTableMap,
////								nationalCareerTableData,
////								nationalCareerTableMap
////				);
//				//TODO REMOVE WHEN DONE
//
//				clubCareerTable.setModel(new TableModel(clubCareerTableData, GuiConfiguration.PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME));
//				clubCareerTable.setPreferredScrollableViewportSize(clubCareerTable.getPreferredSize());
//
//				nationalCareerTable.setModel(new TableModel(nationalCareerTableData, GuiConfiguration.PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME));
//				nationalCareerTable.setPreferredScrollableViewportSize(nationalCareerTable.getPreferredSize());
//
//
//				Component component = ViewPlayerPanel.this.getComponent(2);
//				ViewPlayerPanel.this.remove(component);
//				ViewPlayerPanel.this.add(careerTablePanel);
//				component.setVisible(false);
//				careerTablePanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//		clubStatisticsButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				Component component = ViewPlayerPanel.this.getComponent(2);
//				ViewPlayerPanel.this.remove(component);
//				ViewPlayerPanel.this.add(clubStatisticsPanel);
//				component.setVisible(false);
//				clubStatisticsPanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//		nationalStatisticsButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				Component component = ViewPlayerPanel.this.getComponent(2);
//				ViewPlayerPanel.this.remove(component);
//				ViewPlayerPanel.this.add(nationalStatisticsPanel);
//				component.setVisible(false);
//				nationalStatisticsPanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//		caseButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				Component component = ViewPlayerPanel.this.getComponent(2);
//				ViewPlayerPanel.this.remove(component);
//				ViewPlayerPanel.this.add(caseAwardsPanel);
//				component.setVisible(false);
//				caseAwardsPanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//
//
//
//		generalInfoButton.doClick();
//	}
//}
