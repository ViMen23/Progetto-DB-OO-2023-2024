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

public class MilitancyFilterPanel
							extends JPanel
{
	public MilitancyFilterPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlContinentName = new JLabel(selectAll);
		final JLabel ctrlNationName = new JLabel(selectAll);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel(selectAll);
		final JLabel ctrlFromYear = new JLabel((String) null);
		final JLabel ctrlToYear = new JLabel((String) null);


		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<Vector<String>> playerTableData = new Vector<>();
		final Map<Integer, String> playerTableDataMap = new HashMap<>();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		InfoPanel infoPanel;
		TitleLabel titleLabel;
		LabelComboPanel continentTypeNamePanel;
		LabelComboPanel nationTypeNamePanel;
		RadioPanel teamTypePanel;
		LabelComboPanel teamNamePanel;
		LabelComboPanel fromYearPanel;
		LabelComboPanel toYearPanel;
		TablePanel playerTablePanel;


		JButton button;


		String string;


		migLayout = new MigLayout(
						GuiConfiguration.generalSearchPanelLayoutConstraint,
						GuiConfiguration.generalSearchPanelColumnConstraint,
						""//TODO
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.middleSearchPanelLayoutConstraint,
						GuiConfiguration.middleSearchPanelColumnConstraint,
						GuiConfiguration.playerMiddleSearchPanelRowConstraint
		);

		centralPanel.setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("militancyFilter");
		string = string.toUpperCase();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.topSearchPanelAddConstraint);

		this.add(centralPanel, GuiConfiguration.middleSearchPanelAddConstraint);
		string = "1. ";
		string += GuiConfiguration.getMessage("choose");
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

		string = "2. ";
		string += GuiConfiguration.getMessage("choose");
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

		continentTypeNamePanel = new LabelComboPanel(string, false, ctrlContinentName);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 2, flowy, gap bottom 0"); //TODO

		string = Country.COUNTRY_TYPE.NATION.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		nationTypeNamePanel = new LabelComboPanel(string, false, GuiConfiguration.panelToAddRowConstraint, ctrlNationName);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = "3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		teamNamePanel = new LabelComboPanel(string, false, ctrlTeamName);
		centralPanel.add(teamNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = "4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("years");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		string = GuiConfiguration.getMessage("from");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		fromYearPanel = new LabelComboPanel(string, false, ctrlContinentName);
		centralPanel.add(fromYearPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 2, flowy, gap bottom 0"); //TODO

		string = GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		toYearPanel = new LabelComboPanel(string, false, GuiConfiguration.panelToAddRowConstraint, ctrlNationName);
		centralPanel.add(toYearPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il quarto info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		playerTablePanel = new TablePanel(true, null, null, null);
		this.add(playerTablePanel, GuiConfiguration.tablePanelAddConstraint);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				playerTableData.clear();

				Controller.getInstance().setPlayerTable(
								teamNameMap.get(ctrlTeamName.getText()),
								ctrlFromYear.getText(),
								ctrlToYear.getText(),
								playerTableData,
								playerTableDataMap
				);

				playerTablePanel.fillTable(playerTableData, GuiConfiguration.playerTableColumnName);


				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("players");
				string += " - ";
				string += playerTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("results");
				string = string.toUpperCase();

				playerTablePanel.setTextTitleLabel(string);

				MilitancyFilterPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);


		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				continentTypeNamePanel.getMyComboBox().setEnabled(true);
				//TODO LEGGI: selectAll è considerato come null non come una scelta possibile nel comboBox
				if (!(ctrlContinentName.getText().equalsIgnoreCase(selectAll))) {
					ctrlContinentName.setText(selectAll);
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

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				}
				else if (ctrlContinentName.getText().equalsIgnoreCase(selectAll)) {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlNationName.
				}


			}
		});
	}
}
