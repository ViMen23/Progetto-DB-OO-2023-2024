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
		final JLabel ctrlMouseSquadTable = new JLabel((String) null);


		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<Vector<String>> squadTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> squadTableMap = new HashMap<>();

		final Vector<Vector<String>> participationTableData = new Vector<>();


		final MyTable squadTable;
		final MyTable participationTable;

		MigLayout migLayout;
		TopViewTeamPanel topViewTeamPanel;
		LabelComboPanel showSeasonPanel;
		JButton showButton;
		JPanel tablePanel;
		TablePanel squadPanel;
		TablePanel participationPanel;

		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);


		migLayout = new MigLayout(
						GuiConfiguration.VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_CELL,
						GuiConfiguration.THREE_CELL_EXT_GAP_0_INT_GAP_10_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);

		topViewTeamPanel = new TopViewTeamPanel(teamID, teamType);
		this.add(topViewTeamPanel);
		topViewTeamPanel.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		showSeasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season").toUpperCase(),
						true,
						GuiConfiguration.THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_LAYOUT_CONSTRAINT,
						ctrlSeason
		);

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

		squadPanel = new TablePanel(false, tableIndex, ctrlMouseSquadTable);

		squadPanel.getTitleLabel().setText(GuiConfiguration.getMessage("squad"));

		squadTable = squadPanel.getMyTable();
		squadTable.setModel(new TableModel(squadTableData, GuiConfiguration.TEAM_SQUAD_TABLE_COLUMN_NAME));
		squadTable.setPreferredScrollableViewportSize(squadTable.getPreferredSize());

		tablePanel.add(squadPanel);


		participationPanel = new TablePanel(false);

		participationPanel.getTitleLabel().setText(GuiConfiguration.getMessage("participations"));

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
				} else {
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

				topViewTeamPanel.setGeneralInfoPanel(infoTeamMap);

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

		ctrlMouseSquadTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt) {
				if (ctrlMouseSquadTable.getText().equalsIgnoreCase("@click")) {
					try {
						String playerID;

						playerID = squadTableMap.get(tableIndex[1]).get(tableIndex[0]);

						JPanel panel = new ViewPlayerGeneralInfo(playerID);

						ViewTeamSeasonPanel.this.setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(ViewTeamSeasonPanel.this);

						MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_VGROW_ADD_CONSTRAINT);
						panel.setVisible(true);
					} catch (Exception ignored) {
					} finally {
						ctrlMouseSquadTable.setText("@null");
					}

				}
			}
		});
	}
}
