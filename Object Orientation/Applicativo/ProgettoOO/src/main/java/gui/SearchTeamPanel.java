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
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlTeamSubLongName = new JLabel((String) null);
		final JLabel ctrlTeamSubShortName = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel(selectAll);
		final JLabel ctrlNationName = new JLabel(selectAll);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();


		final Vector<Vector<String>> teamTableData = new Vector<>();
		final Map<Integer, String> teamTableDataMap = new HashMap<>();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		InfoPanel infoPanel;
		LabelTextPanel teamLongNamePanel;
		LabelTextPanel teamShortNamePanel;
		RadioPanel teamTypePanel;
		LabelComboPanel continentTypeNamePanel;
		LabelComboPanel nationTypeNamePanel;
		TablePanel teamTablePanel;
		JButton button;

		String string;


		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_INT_GAP_10_0_LAYOUT_CONSTRAINT
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_60P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.SEVEN_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("teams");
		string += " - ";
		string += GuiConfiguration.getMessage("teams");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countTeams().toString();
		string = string.toUpperCase();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		string = GuiConfiguration.getMessage("longName");
		string = StringUtils.capitalize(string);

		teamLongNamePanel = new LabelTextPanel(string, ctrlTeamSubLongName, Regex.patternAlnum);
		centralPanel.add(teamLongNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT + ", split 2, flowy, gap bottom 0"); //TODO

		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		teamShortNamePanel = new LabelTextPanel(string, ctrlTeamSubShortName, Regex.patternCode);
		centralPanel.add(teamShortNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		string = Country.COUNTRY_TYPE.CONTINENT.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		continentTypeNamePanel = new LabelComboPanel(string, true, ctrlContinentName);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT + ", split 2, flowy, gap bottom 0"); //TODO

		string = Country.COUNTRY_TYPE.NATION.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		nationTypeNamePanel = new LabelComboPanel(string, false, ctrlNationName);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT); //TODO
		/*------------------------------------------------------------------------------------------------------*/


		teamTablePanel = new TablePanel(true, null, null, null, null);
		this.add(teamTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				teamTableData.clear();

				Controller.getInstance().setTeamTable(
								ctrlTeamSubLongName.getText(),
								ctrlTeamSubShortName.getText(),
								ctrlTeamType.getText(),
								continentNameMap.get(ctrlContinentName.getText()),
								nationNameMap.get(ctrlNationName.getText()),
								teamTableData,
								teamTableDataMap
				);

				teamTablePanel.getMyTable().setModel(new TableModel(teamTableData, GuiConfiguration.TEAM_TABLE_COLUMN_NAME));

				string = GuiConfiguration.getMessage("research");
				string += " ";
				string += GuiConfiguration.getMessage("performed");
				string += " - ";
				string += teamTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("teams");
				string = string.toUpperCase();

				teamTablePanel.getTitleLabel().setText(string);

				string = StringUtils.capitalize(GuiConfiguration.getMessage("longName"));
				string += ": ";

				if (null != ctrlTeamSubLongName.getText()) {
					string += ctrlTeamSubLongName.getText();
				}

				string += "\t";

				string += StringUtils.capitalize(GuiConfiguration.getMessage("shortName"));
				string += ": ";

				if (null != ctrlTeamSubShortName.getText()) {
					string += ctrlTeamSubShortName.getText();
				}

				string += "\n";

				string += StringUtils.capitalize(GuiConfiguration.getMessage("teamType"));
				string += ": ";

				if (null != ctrlTeamType.getText()) {
					string += GuiConfiguration.getMessage(ctrlTeamType.getText().toLowerCase());
				}

				string += "\n";

				string += StringUtils.capitalize(GuiConfiguration.getMessage("country"));
				string += ": ";

				if (!(ctrlContinentName.getText().equalsIgnoreCase(selectAll))) {
					string += ctrlContinentName.getText();
				}


				if (!(ctrlNationName.getText().equalsIgnoreCase(selectAll))) {
					string += " - ";
					string += ctrlNationName.getText();
				}


				teamTablePanel.getTitleLabel().setText(string);

				topSearchPanel.getTitleButton().doClick();

				SearchTeamPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlContinentName.getText().equalsIgnoreCase("@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					continentNameVector.add(selectAll);

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));

				} else if (ctrlContinentName.getText().equalsIgnoreCase(selectAll)) {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlNationName.setText(selectAll);
				} else {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(true);
					ctrlNationName.setText(selectAll);
				}
			}
		});

		ctrlNationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlNationName.getText().equalsIgnoreCase("@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();

					nationNameVector.add(selectAll);

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
			}
		});

	}

}
