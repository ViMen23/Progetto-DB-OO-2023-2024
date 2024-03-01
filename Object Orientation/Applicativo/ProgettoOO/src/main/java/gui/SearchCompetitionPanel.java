package gui;

import controller.Controller;
import model.Competition;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.*;

public class SearchCompetitionPanel
				extends JPanel
{

	public SearchCompetitionPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlCompetitionSubName = new JLabel((String) null);
		final JLabel ctrlCompetitionType = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel(selectAll);
		final JLabel ctrlNationName = new JLabel(selectAll);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();


		final Vector<Vector<String>> competitionTableData = new Vector<>();

		final ButtonGroup buttonGroup = new ButtonGroup();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		LabelTextPanel competitionNamePanel;
		RadioPanel competitionTypePanel;
		RadioPanel teamTypePanel;
		InfoPanel infoPanel;
		RadioComboPanel worldTypePanel;
		RadioComboPanel continentTypeNamePanel;
		RadioComboPanel nationTypeNamePanel;
		TablePanel competitionTablePanel;
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
						GuiConfiguration.competitionMiddleSearchPanelRowConstraint
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("competitions");
		string += " - ";
		string += GuiConfiguration.getMessage("competitions");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countCountries().toString();
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


		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		competitionNamePanel = new LabelTextPanel(string, ctrlCompetitionSubName, Regex.patternAlnum);
		centralPanel.add(competitionNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		competitionTypePanel = new RadioPanel(Competition.COMPETITION_TYPE.values(), ctrlCompetitionType);
		centralPanel.add(competitionTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
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

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);


		worldTypePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.WORLD.toString(),
						ctrlCountryType,
						null,
						false
		);

		buttonGroup.add(worldTypePanel.getRadioButton());
		centralPanel.add(worldTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il quarto info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint + ", spany 3"); //TODO


		continentTypeNamePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						ctrlCountryType,
						ctrlContinentName,
						true
		);

		buttonGroup.add(continentTypeNamePanel.getRadioButton());
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", wrap");

		nationTypeNamePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.NATION.toString(),
						ctrlCountryType,
						ctrlNationName,
						true
		);

		buttonGroup.add(nationTypeNamePanel.getRadioButton());
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", wrap");
		/*------------------------------------------------------------------------------------------------------*/




		competitionTablePanel = new TablePanel(true, null, null, null);
		this.add(competitionTablePanel, GuiConfiguration.tablePanelAddConstraint);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				competitionTableData.clear();

				Controller.getInstance().setCompetitionTable(
								ctrlCompetitionSubName.getText(),
								ctrlCompetitionType.getText(),
								ctrlTeamType.getText(),
								ctrlCountryType.getText(),
								continentNameMap.get(ctrlContinentName.getText()),
								nationNameMap.get(ctrlNationName.getText()),
								competitionTableData
				);

				competitionTablePanel.fillTable(competitionTableData, GuiConfiguration.competitionTableColumnName);


				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("competitions");
				string += " - ";
				string += competitionTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("results");
				string = string.toUpperCase();

				competitionTablePanel.setTextTitleLabel(string);

				SearchCompetitionPanel.this.revalidate();
			}
		});



		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);

		ctrlCountryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt) {
				if (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.WORLD.toString())) {
					continentTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					continentTypeNamePanel.getMyComboBox().setEnabled(false);
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlContinentName.setText(selectAll);
					ctrlNationName.setText(selectAll);
				} else if (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.CONTINENT.toString())) {
					continentTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					continentTypeNamePanel.getMyComboBox().setEnabled(true);
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlNationName.setText(selectAll);
				} else if (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString())) {
					continentTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					continentTypeNamePanel.getMyComboBox().setEnabled(true);
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlContinentName.setText(ctrlContinentName.getText());
				}
			}
		});


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

				} else if (ctrlCountryType.getText().equalsIgnoreCase(Country.COUNTRY_TYPE.NATION.toString())) {
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