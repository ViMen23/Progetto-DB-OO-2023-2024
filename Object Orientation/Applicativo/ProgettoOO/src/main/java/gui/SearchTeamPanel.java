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
						GuiConfiguration.generalSearchPanelLayoutConstraint,
						GuiConfiguration.generalSearchPanelColumnConstraint,
						GuiConfiguration.generalSearchPanelRowConstraint
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.middleSearchPanelLayoutConstraint,
						GuiConfiguration.middleSearchPanelColumnConstraint,
						GuiConfiguration.teamMiddleSearchPanelRowConstraint
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
		this.add(topSearchPanel, GuiConfiguration.topSearchPanelAddConstraint);

		this.add(centralPanel, GuiConfiguration.middleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);


		string = GuiConfiguration.getMessage("longName");
		string = StringUtils.capitalize(string);

		teamLongNamePanel = new LabelTextPanel(string, ctrlTeamSubLongName, Regex.patternAlnum);
		centralPanel.add(teamLongNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 2, flowy, gap bottom 0"); //TODO

		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		teamShortNamePanel = new LabelTextPanel(string, ctrlTeamSubShortName, Regex.patternCode);
		centralPanel.add(teamShortNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);


		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		string = Country.COUNTRY_TYPE.CONTINENT.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		continentTypeNamePanel = new LabelComboPanel(string, true, ctrlContinentName);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 2, flowy, gap bottom 0"); //TODO

		string = Country.COUNTRY_TYPE.NATION.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		nationTypeNamePanel = new LabelComboPanel(string, false, ctrlNationName);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint); //TODO
		/*------------------------------------------------------------------------------------------------------*/


		teamTablePanel = new TablePanel(true, null, null, null);
		this.add(teamTablePanel, GuiConfiguration.tablePanelAddConstraint);


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
								teamTableData
				);

				teamTablePanel.fillTable(teamTableData, GuiConfiguration.teamTableColumnName);

				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("teams");
				string += " - ";
				string += teamTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("results");
				string = string.toUpperCase();

				teamTablePanel.setTextTitleLabel(string);

				SearchTeamPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);


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
