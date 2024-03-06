package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class SearchTeamPanel
							extends JPanel
{
	public SearchTeamPanel()
	{
		final JLabel ctrlTeamSubLongName = new JLabel((String) null);
		final JLabel ctrlTeamSubShortName = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<Vector<String>> teamTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> teamTableDataMap = new HashMap<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		InfoPanel infoPanel;
		LabelTextPanel teamLongNamePanel;
		LabelTextPanel teamShortNamePanel;
		RadioPanel teamTypePanel;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		TablePanel teamTablePanel;
		JButton button;

		String string;


		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.SEVEN_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("searchTeams");
		string += " - ";
		string += GuiConfiguration.getMessage("availableTeams");
		string += " ";
		string += Controller.getInstance().countTeams().toString();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("name").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		teamLongNamePanel = new LabelTextPanel(
						GuiConfiguration.getMessage("longName"),
						ctrlTeamSubLongName,
						Regex.patternAlnum
		);
		centralPanel.add(teamLongNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);


		teamShortNamePanel = new LabelTextPanel(
						GuiConfiguration.getMessage("shortName"),
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlTeamSubShortName,
						Regex.patternCode
		);
		centralPanel.add(teamShortNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		infoPanel = new InfoPanel(GuiConfiguration.getMessage("namesInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("teamType"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("NATION").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		continentNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						true,
						ctrlContinentName
		);
		centralPanel.add(continentNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		nationNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlNationName
		);
		centralPanel.add(nationNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("nationInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		teamTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(teamTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		button = new JButton(GuiConfiguration.getMessage("search"));

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable teamTable = teamTablePanel.getMyTable();
				String string;

				teamTableData.clear();
				teamTableDataMap.clear();

				Controller.getInstance().setTeamTable(
								ctrlTeamSubLongName.getText(),
								ctrlTeamSubShortName.getText(),
								ctrlTeamType.getText(),
								continentNameMap.get(ctrlContinentName.getText()),
								nationNameMap.get(ctrlNationName.getText()),
								teamTableData,
								teamTableDataMap
				);

				teamTable.setModel(new TableModel(teamTableData, GuiConfiguration.TEAM_TABLE_COLUMN_NAME));
				teamTable.setPreferredScrollableViewportSize(teamTable.getPreferredSize());

				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("teams");
				string += " ";
				string += teamTableData.size();

				teamTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";

				if (ctrlTeamSubLongName.getText() != null) {
					string += GuiConfiguration.getMessage("longName").toUpperCase();
					string += ": ";
					string += ctrlTeamSubLongName.getText();
				}

				if (ctrlTeamSubShortName.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("shortName").toUpperCase();
					string += ": ";
					string += ctrlTeamSubShortName.getText();
				}

				if (ctrlTeamType.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("teamType");
					string += ": ";
					string += GuiConfiguration.getMessage(ctrlTeamType.getText());
				}

				if (continentNameMap.get(ctrlContinentName.getText()) != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("country");
					string += ": ";
					string += ctrlContinentName.getText();

					if (nationNameMap.get(ctrlNationName.getText()) != null) {
						string += " - ";
						string += ctrlNationName.getText();
					}
				}

				teamTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				SearchTeamPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlContinentName.getText(), "@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					continentNameVector.add(GuiConfiguration.getMessage("selectAll"));

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					if (1 == continentNameVector.size()) {
						continentNameVector.clear();
						continentNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				} else {
					nationNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationNamePanel.getMyComboBox().setEnabled(continentNameMap.get(ctrlContinentName.getText()) != null);
					ctrlNationName.setText(null);
				}
			}
		});

		ctrlNationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlNationName.getText(), "@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();

					nationNameVector.add(GuiConfiguration.getMessage("selectAll"));

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					if (1 == nationNameVector.size()) {
						nationNameVector.clear();
						nationNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					nationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
			}
		});

		ctrlMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String teamID;
						String teamType;

						teamID = teamTableDataMap.get(tableIndex[1]).get(tableIndex[0]);

						if (teamTableData.get(tableIndex[1]).get(2).contains("C")) {
							teamType = Team.TEAM_TYPE.CLUB.toString();
						} else {
							teamType = Team.TEAM_TYPE.NATIONAL.toString();
						}

						JPanel panel = new ViewTeamSeasonPanel(teamID, teamType);

						SearchTeamPanel.this.setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(SearchTeamPanel.this);

						MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
						panel.setVisible(true);
					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});

	}

}
