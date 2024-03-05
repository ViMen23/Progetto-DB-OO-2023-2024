//package gui;
//
//import controller.Controller;
//import net.miginfocom.swing.MigLayout;
//import org.apache.commons.lang3.StringUtils;
//
//import javax.swing.*;
//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.awt.event.ActionListener;
//import java.beans.PropertyChangeEvent;
//import java.beans.PropertyChangeListener;
//import java.util.HashMap;
//import java.util.LinkedHashMap;
//import java.util.Map;
//import java.util.Vector;
//
//public class ViewTeamSeasonPanel
//				extends JPanel
//{
//	public ViewTeamSeasonPanel(String teamID, String teamType)
//	{
//		final JLabel ctrlSeason = new JLabel((String) null);
//
//		final Vector<String> seasonVector = new Vector<>();
//		final Map<String, String> seasonMap = new HashMap<>();
//
//		final Map<String, String> infoTeamMap = new LinkedHashMap<>();
//
//		final Vector<Vector<String>> squadTableData = new Vector<>();
//		final Map<Integer, Map<Integer, String>> squadTableMap = new HashMap<>();
//
//		final Vector<Vector<String>> participationTableData = new Vector<>();
//		final Vector<Vector<String>> trophyTableData = new Vector<>();
//		final Vector<Vector<String>> prizeTableData = new Vector<>();
//
//		MigLayout migLayout;
//		LabelComboPanel showSeasonPanel;
//		JPanel navigationPanel;
//		JButton showButton;
//		GeneralInfoPanel generalInfoPanel;
//		JButton squadParticipationButton;
//		JButton caseButton;
//		JPanel squadParticipationPanel;
//		TablePanel squadPanel;
//		TablePanel participationPanel;
//		JPanel tablePanel;
//		JPanel casePanel;
//		TablePanel trophyPanel;
//		TablePanel prizePanel;
//
//
//
//		migLayout = new MigLayout(
//						GuiConfiguration.VLAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.THREE_CELL_EXT_GAP_0_10_LAYOUT_CONSTRAINT
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
//						GuiConfiguration.TWO_CELL_SIZE_15P_INT_GAP_150_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT
//		);
//
//		navigationPanel = new JPanel(migLayout);
//		navigationPanel.setBackground(Color.white);
//
//		this.add(navigationPanel);
//
//		squadParticipationButton = new JButton(GuiConfiguration.getMessage("seasonDetails"));
//		squadParticipationButton.setCursor(GuiConfiguration.HAND_CURSOR);
//
//		navigationPanel.add(squadParticipationButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//
//		caseButton = new JButton(GuiConfiguration.getMessage("caseAwards"));
//		caseButton.setCursor(GuiConfiguration.HAND_CURSOR);
//
//		navigationPanel.add(caseButton, GuiConfiguration.HGRUOP_ADD_CONSTRAINT);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.VLAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.TWO_CELL_LAYOUT_CONSTRAINT
//		);
//
//		squadParticipationPanel = new JPanel(migLayout);
//		squadParticipationPanel.setOpaque(false);
//
//		showSeasonPanel = new LabelComboPanel(
//						GuiConfiguration.getMessage("season").toUpperCase(),
//						true,
//						GuiConfiguration.THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT,
//						ctrlSeason
//		);
//
//		showButton = new JButton(GuiConfiguration.getMessage("show"));
//		showSeasonPanel.add(showButton);
//
//		squadParticipationPanel.add(showSeasonPanel);
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
//						GuiConfiguration.TWO_CELL_GROW_FILL_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
//		);
//
//		tablePanel = new JPanel(migLayout);
//		tablePanel.setOpaque(false);
//
//		squadParticipationPanel.add(tablePanel);
//
//		squadPanel = new TablePanel(false);
//		tablePanel.add(squadPanel);
//
//		participationPanel = new TablePanel(false);
//		tablePanel.add(participationPanel);
//		/*------------------------------------------------------------------------------------------------------*/
//
//		migLayout = new MigLayout(
//						GuiConfiguration.VLAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_GROW_FILL_CELL,
//						GuiConfiguration.TWO_CELL_LAYOUT_CONSTRAINT
//		);
//
//		casePanel = new JPanel(migLayout);
//		setOpaque(false);
//
//		migLayout = new MigLayout(
//						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
//						GuiConfiguration.TWO_CELL_GROW_FILL_LAYOUT_CONSTRAINT,
//						GuiConfiguration.ONE_CELL_TOP_LAYOUT_CONSTRAINT
//		);
//
//		tablePanel = new JPanel(migLayout);
//		tablePanel.setOpaque(false);
//
//		casePanel.add(tablePanel);
//
//		trophyPanel = new TablePanel(false);
//		trophyPanel.getTitleLabel().setText(GuiConfiguration.getMessage("trophies"));
//
//		tablePanel.add(trophyPanel);
//
//		prizePanel = new TablePanel(false);
//		prizePanel.getTitleLabel().setText(GuiConfiguration.getMessage("prizes"));
//
//		tablePanel.add(prizePanel);
//
//
//		squadParticipationButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				ctrlSeason.setText("@fill");
//				ctrlSeason.setText(seasonVector.getFirst());
//				showButton.doClick();
//
//				ViewTeamCasePanel.this.remove(casePanel);
//				ViewTeamCasePanel.this.add(squadParticipationPanel);
//				casePanel.setVisible(false);
//				squadParticipationPanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//		caseButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				MyTable trophyTable = trophyPanel.getMyTable();
//				MyTable prizeTable = prizePanel.getMyTable();
//
//				infoTeamMap.clear();
//				trophyTableData.clear();
//				prizeTableData.clear();
//
//				Controller.getInstance().setTeamCaseView(
//								teamID,
//								teamType,
//								infoTeamMap,
//								trophyTableData,
//								prizeTableData
//				);
//
//				generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "teamInformation");
//
//				trophyTable.setModel(new TableModel(trophyTableData, GuiConfiguration.TEAM_TROPHY_TABLE_COLUMN_NAME));
//				trophyTable.setPreferredScrollableViewportSize(trophyTable.getPreferredSize());
//
//				prizeTable.setModel(new TableModel(prizeTableData, GuiConfiguration.TEAM_PRIZE_TABLE_COLUMN_NAME));
//				prizeTable.setPreferredScrollableViewportSize(prizeTable.getPreferredSize());
//
//				ViewTeamCasePanel.this.remove(squadParticipationPanel);
//				ViewTeamCasePanel.this.add(casePanel);
//				squadParticipationPanel.setVisible(false);
//				casePanel.setVisible(true);
//
//				revalidate();
//			}
//		});
//
//		ctrlSeason.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt)
//			{
//				if (0 == StringUtils.compareIgnoreCase(ctrlSeason.getText(), "@fill")) {
//					seasonVector.clear();
//					seasonMap.clear();
//
//					Controller.getInstance().setTeamYearComboBox(
//									teamID,
//									teamType,
//									seasonVector,
//									seasonMap
//					);
//
//					if (seasonVector.isEmpty()) {
//						seasonVector.add(GuiConfiguration.getMessage("noData"));
//					}
//					showSeasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
//				}
//				else {
//					showButton.setEnabled(null != seasonMap.get(ctrlSeason.getText()));
//				}
//			}
//		});
//
//		showButton.addActionListener(new ActionListener() {
//			@Override
//			public void actionPerformed(ActionEvent e)
//			{
//				MyTable squadTable = squadPanel.getMyTable();
//				MyTable participationTable = participationPanel.getMyTable();
//
//				infoTeamMap.clear();
//				squadTableData.clear();
//				squadTableMap.clear();
//				participationTableData.clear();
//
//				Controller.getInstance().setTeamSeasonView(
//								teamID,
//								seasonMap.get(ctrlSeason.getText()),
//								infoTeamMap,
//								squadTableData,
//								squadTableMap,
//								participationTableData
//				);
//
//				generalInfoPanel.createGeneralInfoPanel(infoTeamMap, "teamInformation");
//
//				squadTable.setModel(new TableModel(squadTableData, GuiConfiguration.TEAM_SQUAD_TABLE_COLUMN_NAME));
//				squadTable.setPreferredScrollableViewportSize(squadTable.getPreferredSize());
//				squadPanel.getTitleLabel().setText(GuiConfiguration.getMessage("squad") + " " + ctrlSeason.getText());
//
//				participationTable.setModel(new TableModel(participationTableData, GuiConfiguration.TEAM_PARTICIPATING_TABLE_COLUMN_NAME));
//				participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());
//				participationPanel.getTitleLabel().setText(GuiConfiguration.getMessage("participations") + " " + ctrlSeason.getText());
//
//				revalidate();
//			}
//		});
//
//		squadParticipationButton.doClick();
//	}
//}