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

public class CompetitionEditionFilterPanel
				extends JPanel
{

	public CompetitionEditionFilterPanel()
	{
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlCompetitionName = new JLabel((String) null);
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
		LabelComboPanel competitionNamePanel;
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
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
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

		competitionNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("competition"), false, ctrlCompetitionName);
		centralPanel.add(competitionNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

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
		button.setEnabled(false);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable competitionEditionStatisticsTable = competitionEditionTablePanel.getMyTable();
				String string;

				competitionEditionTableData.clear();
				competitionEditionTableDataMap.clear();


				Controller.getInstance().setStatisticCompetitionEditionTable(
								seasonMap.get(ctrlSeason.getText()),
								competitionNameMap.get(ctrlCompetitionName.getText()),
								competitionEditionTableData,
								competitionEditionTableDataMap
				);


				competitionEditionStatisticsTable.setModel(
								new TableModel(competitionEditionTableData, GuiConfiguration.STATISTIC_EDITION_TABLE_COLUMN_NAME)
				);
				competitionEditionStatisticsTable.setPreferredScrollableViewportSize(competitionEditionStatisticsTable.getPreferredSize());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("statistics");
				string += " ";
				string += competitionEditionTableData.size();

				competitionEditionTablePanel.getTitleLabel().setText(string);

				topSearchPanel.getTitleButton().doClick();
				CompetitionEditionFilterPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				buttonGroup.clearSelection();
				worldTypePanel.getRadioButton().setEnabled(null != ctrlTeamType.getText());
				continentTypeNamePanel.getRadioButton().setEnabled(null != ctrlTeamType.getText());
				nationTypeNamePanel.getRadioButton().setEnabled(
								null != ctrlTeamType.getText() && 0 == StringUtils.compareIgnoreCase(ctrlTeamType.getText(), Team.TEAM_TYPE.CLUB.toString())
				);
				continentTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
				ctrlContinentName.setText(null);
			}
		});

		ctrlCountryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				continentTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
				continentTypeNamePanel.getMyComboBox().setEnabled(
								0 != StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.WORLD.toString())
				);
				ctrlContinentName.setText(null);
			}
		});

		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlContinentName.getText(), "@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					if (continentNameVector.isEmpty()) {
						continentNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				} else {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(
									continentNameMap.get(ctrlContinentName.getText()) != null && 0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString())
					);
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

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					if (nationNameVector.isEmpty()) {
						nationNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				} else {
					competitionNamePanel.getMyComboBox().setSelectedIndex(-1);
					competitionNamePanel.getMyComboBox().setEnabled(
									(nationNameMap.get(ctrlNationName.getText()) != null && 0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString()))
									|| (continentNameMap.get(ctrlContinentName.getText()) != null && 0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.CONTINENT.toString()))
									|| (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.WORLD.toString()))
					);
					ctrlCompetitionName.setText(null);
				}
			}
		});

		ctrlCompetitionName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCompetitionName.getText(), "@fill")) {
					competitionNameVector.clear();
					competitionNameMap.clear();

					Controller.getInstance().setCompetitionComboBox(
									null,
									null,
									ctrlTeamType.getText(),
									ctrlCountryType.getText(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameMap.get(ctrlNationName.getText()),
									competitionNameVector,
									competitionNameMap
					);

					if (competitionNameVector.isEmpty()) {
						competitionNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					competitionNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(competitionNameVector));
				} else {
					seasonPanel.getMyComboBox().setSelectedIndex(-1);
					seasonPanel.getMyComboBox().setEnabled(competitionNameMap.get(ctrlCompetitionName.getText()) != null);
					ctrlSeason.setText(null);
				}
			}
		});

		ctrlSeason.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlSeason.getText(), "@fill")) {
					seasonVector.clear();
					seasonMap.clear();

					Controller.getInstance().setCompetitionEditionComboBox(
									ctrlTeamType.getText(),
									competitionNameMap.get(ctrlCompetitionName.getText()),
									seasonVector,
									seasonMap
					);

					if (seasonVector.isEmpty()) {
						seasonVector.add(GuiConfiguration.getMessage("noData"));
					}

					seasonPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(seasonVector));
				} else {
					button.setEnabled(seasonMap.get(ctrlSeason.getText()) != null);
				}
			}
		});

		ctrlMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						if (0 == tableIndex[1]) {
							String teamID;

							teamID = competitionEditionTableDataMap.get(tableIndex[1]).get(tableIndex[0]);

							JPanel panel = new MenuBarPanel(new ViewTeamSeasonPanel(teamID, ctrlTeamType.getText()));

							CompetitionEditionFilterPanel.this.getParent().setVisible(false);
							MainFrame.getMainFrameInstance().getContentPane().remove(CompetitionEditionFilterPanel.this.getParent());

							MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
							panel.setVisible(true);
						} else if (3 == tableIndex[1]) {
							String playerID;

							playerID = competitionEditionTableDataMap.get(tableIndex[1]).get(tableIndex[0]);

							JPanel panel = new MenuBarPanel(new ViewPlayerGeneralInfo(playerID));

							CompetitionEditionFilterPanel.this.getParent().setVisible(false);
							MainFrame.getMainFrameInstance().getContentPane().remove(CompetitionEditionFilterPanel.this.getParent());

							MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
							panel.setVisible(true);
						}

					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});
	}
}
