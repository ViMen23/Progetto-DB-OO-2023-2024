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
import java.time.Year;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class MilitancyFilterPanel
							extends JPanel
{
	public MilitancyFilterPanel()
	{
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlTeamType = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlFromYear = new JLabel((String) null);
		final JLabel ctrlToYear = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Vector<Vector<String>> playerTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerTableDataMap = new HashMap<>();

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
		/*------------------------------------------------------------------------------------------------------*/

		topSearchPanel = new TopSearchPanel(GuiConfiguration.getMessage("militancyFilter"), this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);

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
		string += GuiConfiguration.getMessage("NATION").toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		continentTypeNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("CONTINENT"), false, ctrlContinentName);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		nationTypeNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("NATION"), false, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlNationName);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("nationInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "3. ";
		string += GuiConfiguration.getMessage("team").toUpperCase();
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		teamNamePanel = new LabelComboPanel(GuiConfiguration.getMessage("team"), false, ctrlTeamName);
		centralPanel.add(teamNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("teamInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = "4. ";
		string += GuiConfiguration.getMessage("yearsRange");
		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		fromYearPanel = new LabelComboPanel(GuiConfiguration.getMessage("fromYear"), false, ctrlFromYear);
		centralPanel.add(fromYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		toYearPanel = new LabelComboPanel(GuiConfiguration.getMessage("toYear"), false, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlToYear);
		centralPanel.add(toYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("yearsRangeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		playerTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(playerTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		button = new JButton(GuiConfiguration.getMessage("search"));
		button.setEnabled(false);


		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable playerTable = playerTablePanel.getMyTable();
				String string;

				playerTableData.clear();
				playerTableDataMap.clear();


//				Controller.getInstance().setPlayerTable(
//								teamNameMap.get(ctrlTeamName.getText()),
//								ctrlFromYear.getText(),
//								ctrlToYear.getText(),
//								playerTableData,
//								playerTableDataMap
//				);
				//TODO REMOVE WHEN THE CONTROLLER IS FIXED

				playerTable.setModel(new TableModel(playerTableData, GuiConfiguration.PLAYER_TABLE_COLUMN_NAME));
				playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());

				// messaggio ricerca effettuata
				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("players");
				string += " ";
				string += playerTableData.size();
				string = string.toUpperCase();

				playerTablePanel.getTitleLabel().setText(string);

				// messaggio informazioni ricerca effettuata
				string = "";
				if (ctrlTeamName.getText() != null) {
					string += StringUtils.capitalize(GuiConfiguration.getMessage("teamName"));
					string += ": ";
					string += ctrlTeamName.getText();
				}

				if (ctrlFromYear.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += StringUtils.capitalize(GuiConfiguration.getMessage("rangeYears"));
					string += ": ";
					string += ctrlFromYear.getText();
					string += "-";

					if (ctrlToYear.getText() != null) {
						string += ctrlToYear.getText();
					}
					else {
						string += Year.now().toString();
					}
				}

				playerTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				MilitancyFilterPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlTeamType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (null != ctrlContinentName.getText()) {
					continentTypeNamePanel.getMyComboBox().removeAllItems();
					ctrlContinentName.setText(null);
				}
				else {
					continentTypeNamePanel.getMyComboBox().setEnabled(true);
				}
			}
		});

		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (null == ctrlContinentName.getText()) {
					nationTypeNamePanel.getMyComboBox().removeAllItems();
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlNationName.setText(null);
				}
				else if (ctrlContinentName.getText().equalsIgnoreCase("@fill")) {
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
				else {
					if (null != ctrlNationName.getText()) {
						nationTypeNamePanel.getMyComboBox().removeAllItems();
						ctrlNationName.setText(null);
					}
					else {
						nationTypeNamePanel.getMyComboBox().setEnabled(true);
					}
				}

			}
		});

		ctrlNationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (null == ctrlNationName.getText()) {
					teamNamePanel.getMyComboBox().removeAllItems();
					teamNamePanel.getMyComboBox().setEnabled(false);
					ctrlTeamName.setText(null);
				}
				else if (ctrlNationName.getText().equalsIgnoreCase("@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
				else {
					if (null != ctrlTeamName.getText()) {
						teamNamePanel.getMyComboBox().removeAllItems();
						ctrlTeamName.setText(null);
					}
					else {
						teamNamePanel.getMyComboBox().setEnabled(true);
					}
				}
			}
		});


		ctrlTeamName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (null == ctrlTeamName.getText()) {
					button.setEnabled(false);
					fromYearPanel.getMyComboBox().setEnabled(false);

					fromYearPanel.getMyComboBox().removeAllItems();

					ctrlFromYear.setText(null);
				}
				else if (ctrlTeamName.getText().equalsIgnoreCase("@fill")) {
					teamNameVector.clear();
					teamNameMap.clear();

					Controller.getInstance().setTeamComboBox(
									null,
									null,
									ctrlTeamType.getText(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameMap.get(ctrlNationName.getText()),
									teamNameVector,
									teamNameMap
					);

					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				}
				else {
					if (null != ctrlFromYear.getText()) {
						fromYearPanel.getMyComboBox().removeAllItems();
						ctrlFromYear.setText(null);
					}
					else {
						button.setEnabled(true);
						fromYearPanel.getMyComboBox().setEnabled(true);
					}
				}
			}
		});


		ctrlFromYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (null == ctrlFromYear.getText()) {
					toYearPanel.getMyComboBox().removeAllItems();
					toYearPanel.getMyComboBox().setEnabled(false);
					ctrlToYear.setText(null);
				}
				else if (ctrlFromYear.getText().equalsIgnoreCase("@fill")) {

					JComboBox<String> comboBox = fromYearPanel.getMyComboBox();

					comboBox.removeAllItems();

					int maximumYear = Year.now().getValue();
					int minimumYear = GuiConfiguration.MIN_YEAR;

					for (int i = maximumYear; i >= minimumYear; --i) {
						comboBox.addItem(String.valueOf(i));
					}
				}
				else {
					if (null != ctrlToYear.getText()) {
						toYearPanel.getMyComboBox().removeAllItems();
						ctrlToYear.setText(null);
					}
					else {
						toYearPanel.getMyComboBox().setEnabled(true);
					}
				}
			}
		});


		ctrlToYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlToYear.getText(), "@fill")) {
					JComboBox<String> comboBox = toYearPanel.getMyComboBox();

					comboBox.removeAllItems();

					int maximumYear = Year.now().getValue();
					int minimumYear = Integer.parseInt(ctrlFromYear.getText());

					for (int i = maximumYear; i >= minimumYear; --i) {
						comboBox.addItem(String.valueOf(i));
					}
				}
			}
		});
	}
}
