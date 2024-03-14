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

public class AdminSearchCompetition
				extends JPanel
{

	public AdminSearchCompetition()
	{
		final JLabel ctrlCompetitionSubName = new JLabel((String) null);
		final JLabel ctrlCompetitionType = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<Vector<String>> competitionTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> competitionTableDataMap = new HashMap<>();

		final ButtonGroup buttonGroup = new ButtonGroup();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		InfoPanel infoPanel;
		LabelTextPanel competitionNamePanel;
		RadioPanel competitionTypePanel;
		RadioPanel teamTypePanel;
		RadioComboPanel worldTypePanel;
		RadioComboPanel continentTypeNamePanel;
		RadioComboPanel nationTypeNamePanel;
		TablePanel competitionTablePanel;
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


		string = GuiConfiguration.getMessage("searchCompetitions");
		string += " - ";
		string += GuiConfiguration.getMessage("availableCompetitions");
		string += " ";
		string += Controller.getInstance().countCompetitions();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/



		titleLabel = new TitleLabel(GuiConfiguration.getMessage("name").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		competitionNamePanel = new LabelTextPanel(
						GuiConfiguration.getMessage("name"),
						ctrlCompetitionSubName,
						Regex.patternAlnum
		);
		centralPanel.add(competitionNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("nameInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("competitionType"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		competitionTypePanel = new RadioPanel(Competition.COMPETITION_TYPE.values(), ctrlCompetitionType);
		centralPanel.add(competitionTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("competitionTypeInfo"));
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


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("country"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		worldTypePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.WORLD.toString(),
						ctrlCountryType,
						null,
						false
		);

		buttonGroup.add(worldTypePanel.getRadioButton());
		centralPanel.add(worldTypePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT);

		continentTypeNamePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlCountryType,
						ctrlContinentName,
						true
		);

		buttonGroup.add(continentTypeNamePanel.getRadioButton());
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT);

		nationTypeNamePanel = new RadioComboPanel(
						Country.COUNTRY_TYPE.NATION.toString(),
						GuiConfiguration.ONE_CELL_GAP_0_10,
						ctrlCountryType,
						ctrlNationName,
						true
		);

		buttonGroup.add(nationTypeNamePanel.getRadioButton());
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("countryInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		competitionTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(competitionTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);



		button = new JButton(GuiConfiguration.getMessage("search"));

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable competitionTable = competitionTablePanel.getMyTable();
				String string;

				competitionTableData.clear();
				competitionTableDataMap.clear();

				Controller.getInstance().setCompetitionTableAdmin(
								ctrlCompetitionSubName.getText(),
								ctrlCompetitionType.getText(),
								ctrlTeamType.getText(),
								ctrlCountryType.getText(),
								continentNameMap.get(ctrlContinentName.getText()),
								nationNameMap.get(ctrlNationName.getText()),
								competitionTableData,
								competitionTableDataMap
				);

				competitionTable.setModel(new TableModel(competitionTableData, GuiConfiguration.COMPETITION_TABLE_COLUMN_NAME));
				competitionTable.setPreferredScrollableViewportSize(competitionTable.getPreferredSize());

				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("competitions");
				string += " ";
				string += competitionTableData.size();

				competitionTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";

				if (ctrlCompetitionSubName.getText() != null) {
					string += GuiConfiguration.getMessage("name").toUpperCase();
					string += ": ";
					string += ctrlCompetitionSubName.getText();
				}

				if (ctrlCompetitionType.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("competitionType");
					string += ": ";
					string += GuiConfiguration.getMessage(ctrlCompetitionType.getText());
				}

				if (ctrlTeamType.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("teamType");
					string += ": ";
					string += GuiConfiguration.getMessage(ctrlTeamType.getText());
				}

				if (ctrlCountryType.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("country");
					string += ": ";
					string += GuiConfiguration.getMessage(ctrlCountryType.getText());
					if (continentNameMap.get(ctrlContinentName.getText()) != null) {
						string += " - ";
						string += ctrlContinentName.getText();
						if (nationNameMap.get(ctrlNationName.getText()) != null) {
							string += " - ";
							string += ctrlNationName.getText();
						}
					}
				}

				competitionTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				AdminSearchCompetition.this.revalidate();
			}
		});


		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);

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
					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				} else {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(
									(
													continentNameMap.get(ctrlContinentName.getText()) != null
																	&&
																	0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString())
									)
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

					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
			}
		});

		ctrlMouseTable.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String competitionID;
						String competitionTeamType;

						competitionID = competitionTableDataMap.get(tableIndex[1]).get(tableIndex[0]);

						competitionTeamType = competitionTableDataMap.get(2).get(tableIndex[0]);

						AdminSearchCompetition.this.getParent().setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(AdminSearchCompetition.this.getParent());

						MainFrame.getMainFrameInstance().getContentPane().add(
										new AdminNavigationPanel(new AdminViewCompetitionAddCompetitionEdition(competitionID, competitionTeamType)),
										GuiConfiguration.HGROUP_FRAME_ADD_CONSTRAINT
						);
					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});
	}
}