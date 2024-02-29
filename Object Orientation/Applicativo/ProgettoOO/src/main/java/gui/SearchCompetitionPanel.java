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
		final JLabel ctrlCompetitionName = new JLabel((String) null);
		final JLabel ctrlCompetitionType = new JLabel((String) null);
		final JLabel ctrlCompetitionTeamType = new JLabel((String) null);
		final JLabel ctrlCompetitionCountryType = new JLabel((String) null);
		final JLabel ctrlContinentID = new JLabel("@null");
		final JLabel ctrlNationID = new JLabel("@null");

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> confederationTableColumnName = new Vector<>();
		final Vector<Vector<String>> confederationTableData = new Vector<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titlePanel;
		LabelTextPanel nameSearchPanel;
		RadioPanel competitionTypePanel;
		RadioPanel competitionTeamTypePanel;
		InfoPanel infoPanel;
		RadioComboPanel competitionCountryWorldPanel;
		RadioComboPanel competitionCountryContinentPanel;
		RadioComboPanel competitionCountryNationPanel;



		LabelComboPanel chooseContinentPanel;
		TablePanel tablePanel;
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
						"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]0[]0[fill]20[]0" //TODO
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

		titlePanel = new TitleLabel(string);
		centralPanel.add(titlePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titlePanel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titlePanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);


		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		nameSearchPanel = new LabelTextPanel(string, ctrlCompetitionName, Regex.patternAlnum);
		centralPanel.add(nameSearchPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("competitionType");
		string = string.toUpperCase();

		titlePanel = new TitleLabel(string);
		centralPanel.add(titlePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titlePanel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titlePanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		competitionTypePanel = new RadioPanel(Competition.COMPETITION_TYPE.values(), ctrlCompetitionType);
		centralPanel.add(competitionTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		titlePanel = new TitleLabel(string);
		centralPanel.add(titlePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titlePanel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titlePanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		competitionTeamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlCompetitionTeamType);
		centralPanel.add(competitionTeamTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("country");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		titlePanel = new TitleLabel(string);
		centralPanel.add(titlePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titlePanel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titlePanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);


		competitionCountryWorldPanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.WORLD.toString(),
						ctrlCompetitionCountryType,
						null,
						false
		);

		centralPanel.add(competitionCountryWorldPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il quarto info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint + ", spany 3"); //TODO


		competitionCountryContinentPanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						ctrlCompetitionCountryType,
						ctrlContinentID,
						true
		);

		centralPanel.add(competitionCountryContinentPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", wrap");

		competitionCountryNationPanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.NATION.toString(),
						ctrlCompetitionCountryType,
						ctrlNationID,
						true
		);

		centralPanel.add(competitionCountryNationPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", wrap");
		/*------------------------------------------------------------------------------------------------------*/




		tablePanel = new TablePanel(true, null, null, null);
		this.add(tablePanel, GuiConfiguration.tablePanelAddConstraint);


		button = new JButton("CERCA");

		/*
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				confederationTableData.clear();

				Controller.getInstance().setCountryTable(
								countryType.getText(),
								confederationNameMap.get(continent.getText()),
								confederationTableData
				);

				tablePanel.fillTable(confederationTableData, GuiConfiguration.confederationTableColumnName);


				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("confederations");
				string += " - ";
				string += confederationTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("results");
				string = string.toUpperCase();

				tablePanel.setTextTitleLabel(string);

				SearchConfederationPanel.this.revalidate();
			}
		});


		 */
		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);

/*
		countryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{

				if (0 == StringUtils.compareIgnoreCase(countryType.getText(), Country.COUNTRY_TYPE.NATION.toString())) {
					chooseContinentPanel.getMyComboBox().setEnabled(true);
				}
				else {
					chooseContinentPanel.getMyComboBox().setSelectedIndex(-1);
					continent.setText("@null");
				}

			}
		});

		continent.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (continent.getText().equalsIgnoreCase("@fill")) {
					confederationNameVector.clear();
					confederationNameMap.clear();

					String string;
					string = GuiConfiguration.getMessage("selectAll");
					string = StringUtils.capitalize(string);
					confederationNameVector.add(string);

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									confederationNameVector,
									confederationNameMap
					);

					chooseContinentPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
				}
			}
		});

 */
	}
}