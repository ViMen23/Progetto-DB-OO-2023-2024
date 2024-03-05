package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.*;

public class ViewTeamSeasonPanel
				extends JPanel
{
	public ViewTeamSeasonPanel(String teamID, String teamType)
	{
		final JLabel ctrlSeason = new JLabel((String) null);
		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);


		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<Vector<String>> squadTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> squadTableMap = new HashMap<>();

		final Vector<Vector<String>> participationTableData = new Vector<>();


		final MyTable squadTable;
		final MyTable participationTable;

		MigLayout migLayout;
		ViewTeamCaseGeneralInfo viewTeamCaseGeneralInfo;
		LabelComboPanel showSeasonPanel;
		JButton showButton;
		JPanel tablePanel;
		TablePanel squadPanel;
		TablePanel participationPanel;

		String firstSeason;
		String string;


		Controller.getInstance().setTeamYearComboBox(
						teamID,
						teamType,
						seasonVector,
						seasonMap
		);


		try {
			firstSeason = seasonVector.getFirst();
		}
		catch(NoSuchElementException e) {
			firstSeason = null;
		}

		Controller.getInstance().setTeamSeasonView(
						teamID,
						seasonMap.get(firstSeason),
						infoTeamMap,
						squadTableData,
						squadTableMap,
						participationTableData
		);

		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.THREE_CELL_EXT_GAP_0_INT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		viewTeamCaseGeneralInfo = new ViewTeamCaseGeneralInfo(teamID, teamType);
		this.add(viewTeamCaseGeneralInfo);
		viewTeamCaseGeneralInfo.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		showSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season").toUpperCase(),
						true,
						GuiConfiguration.THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT,
						ctrlSeason
		);
		showSeasonPanel.getMyComboBox().addItem(firstSeason);

		showButton = new JButton(GuiConfiguration.getMessage("show"));
		showSeasonPanel.add(showButton);

		this.add(showSeasonPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_GROW_FILL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_TOP_GAP_10_0_LAYOUT_CONSTRAINT
		);

		tablePanel = new JPanel(migLayout);
		tablePanel.setOpaque(false);

		this.add(tablePanel);

		squadPanel = new TablePanel(false, tableIndex, ctrlMouseTable);

		string = GuiConfiguration.getMessage("squad");
		string += " ";
		string += firstSeason;
		squadPanel.getTitleLabel().setText(string);

		squadTable = squadPanel.getMyTable();
		squadTable.setModel(new TableModel(squadTableData, GuiConfiguration.TEAM_SQUAD_TABLE_COLUMN_NAME));
		squadTable.setPreferredScrollableViewportSize(squadTable.getPreferredSize());

		tablePanel.add(squadPanel);


		participationPanel = new TablePanel(false);

		string = GuiConfiguration.getMessage("participations");
		string += " ";
		string += firstSeason;
		participationPanel.getTitleLabel().setText(string);

		participationTable = participationPanel.getMyTable();
		participationTable.setModel(new TableModel(participationTableData, GuiConfiguration.TEAM_PARTICIPATING_TABLE_COLUMN_NAME));
		participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());

		tablePanel.add(participationPanel);
		/*------------------------------------------------------------------------------------------------------*/


		ctrlSeason.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlSeason.getText(), "@fill")) {
					seasonVector.clear();
					seasonMap.clear();

					Controller.getInstance().setTeamYearComboBox(
									teamID,
									teamType,
									seasonVector,
									seasonMap
					);

					if (seasonVector.isEmpty()) {
						seasonVector.add(GuiConfiguration.getMessage("noData"));
					}
					showSeasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
				}
				else {
					showButton.setEnabled(null != seasonMap.get(ctrlSeason.getText()));
				}
			}
		});

		showButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				infoTeamMap.clear();
				squadTableData.clear();
				squadTableMap.clear();
				participationTableData.clear();

				Controller.getInstance().setTeamSeasonView(
								teamID,
								seasonMap.get(ctrlSeason.getText()),
								infoTeamMap,
								squadTableData,
								squadTableMap,
								participationTableData
				);

				viewTeamCaseGeneralInfo.setGeneralInfoPanel(infoTeamMap);

				string = GuiConfiguration.getMessage("squad");
				string += " ";
				string += ctrlSeason.getText();
				squadPanel.getTitleLabel().setText(string);

				squadTable.setModel(new TableModel(squadTableData, GuiConfiguration.TEAM_SQUAD_TABLE_COLUMN_NAME));
				squadTable.setPreferredScrollableViewportSize(squadTable.getPreferredSize());

				string = GuiConfiguration.getMessage("participations");
				string += " ";
				string += ctrlSeason.getText();
				participationPanel.getTitleLabel().setText(string);

				participationTable.setModel(new TableModel(participationTableData, GuiConfiguration.TEAM_PARTICIPATING_TABLE_COLUMN_NAME));
				participationTable.setPreferredScrollableViewportSize(participationTable.getPreferredSize());

				revalidate();
			}
		});

		ctrlMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				//TODO
			}
		});
	}
}
