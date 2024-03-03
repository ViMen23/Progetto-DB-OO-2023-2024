package gui;

import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class CompetitionEditionFilterPanel
				extends JPanel
{

	public CompetitionEditionFilterPanel()
	{
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlCompetition = new JLabel((String) null);
		final JLabel ctrlSeason = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> competitionNameVector = new Vector<>();
		final Map<String, String> competitionNameMap = new HashMap<>();

		final Vector<String> seasonVector = new Vector<>();
		final Map<String, String> seasonMap = new HashMap<>();

		final Vector<Vector<String>> competitionEditionTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> competitionEditionTableDataMap = new HashMap<>();

		final ButtonGroup buttonGroup = new ButtonGroup();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		RadioPanel teamTypePanel;
		InfoPanel infoPanel;
		RadioComboPanel worldTypePanel;
		RadioComboPanel continentTypeNamePanel;
		RadioComboPanel nationTypeNamePanel;
		LabelComboPanel competitionPanel;
		LabelComboPanel seasonPanel;
		TablePanel competitionEditionTablePanel;
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
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.NINE_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("competitionEditionFilter");
		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "1. ";
		string += GuiConfiguration.getMessage("teamType");
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamTypePanel = new RadioPanel(Team.TEAM_TYPE.values(), ctrlTeamType);
		centralPanel.add(teamTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "2. ";
		string += GuiConfiguration.getMessage("country");
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		worldTypePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.WORLD.toString(),
						ctrlCountryType,
						null,
						false
		);

		worldTypePanel.getRadioButton().setEnabled(false);
		buttonGroup.add(worldTypePanel.getRadioButton());
		centralPanel.add(worldTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT);

		continentTypeNamePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlCountryType,
						ctrlContinentName,
						true
		);

		continentTypeNamePanel.getRadioButton().setEnabled(false);
		buttonGroup.add(continentTypeNamePanel.getRadioButton());
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT);

		nationTypeNamePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.NATION.toString(),
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlCountryType,
						ctrlNationName,
						true
		);

		nationTypeNamePanel.getRadioButton().setEnabled(false);
		buttonGroup.add(nationTypeNamePanel.getRadioButton());
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("countryInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "3. ";
		string += GuiConfiguration.getMessage("competition").toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		competitionPanel = new LabelComboPanel(GuiConfiguration.getMessage("competition"), false, ctrlCompetition);
		centralPanel.add(competitionPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("competitionInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "4. ";
		string += GuiConfiguration.getMessage("season").toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		seasonPanel = new LabelComboPanel(GuiConfiguration.getMessage("season"), false, ctrlSeason);
		centralPanel.add(seasonPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("seasonInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		competitionEditionTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(competitionEditionTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);

		button = new JButton(GuiConfiguration.getMessage("search"));

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

	}
}
